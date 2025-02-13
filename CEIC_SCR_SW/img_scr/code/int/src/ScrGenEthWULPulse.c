/*
 * ScrGenEthWULPulse.c
 *
 *  Created on: 01.10.2021
 *      Author: vikaagz
 */


/**********************************************************************************************************************
 INCLUDES
 **********************************************************************************************************************/
#include "BrsHw.h"
#include "Ifx_reg.h"
#include "IfxScr_bf.h"
#include "ScrTricoreIf.h"
#include "ScrDioPort.h"
#include "ScrWakeUpDetection.h"
#include "ScrGenEthWULPulse.h"
#include "ScrWakeupEcu.h"

/**********************************************************************************************************************
 DEFINITION + MACROS
 **********************************************************************************************************************/
#define WU_PULSE_LEN    (70u)  //time ticks for generating pulse length output: WU_PULSE_LEN*10ms
#define WU_PULSE_LEN_CS (75u)  //WUL_CS has 750ms length
#define WU_PULSE_LEN_SH_TO_GND    (50u) //time ticks for generating pulse length output if Short-To-GND has been detected: WU_PULSE_LEN_SH_TO_GND*10ms => 500ms (SysRS: 8437017, SwRS: 9677182)
#define WU_PULSE_LEN_SH_TO_GND_CS (55u) //WUL_CS has 50ms length in case of Short-To-GND has been detected (SysRS: 8437017, SwRS: 9674529)
#define SHORT_DET_TIME  (5u)  //after this time (SHORT_DET_TIME*10ms) the WU line is checked for short detections
#define VALID_PULS_MIN  (500u)    //valid min puls length of 500ms
#define VALID_PULS_MAX  (1000u)   //valid max puls lenegth of 1000ms
#define WU_PERMA_ACTIVE (0xFFu)     //marks diagnostic mode of permanent active for all wakeup lines

#define TASK_PERIOD (10u)
#define SH_TO_BAT_DEMATURE_TIME_ms (60000u) //(60s) Sh-To-BAT faults should cleared after this time in seconds ( SysRS: 8437018, SwRS: 9676814, 9676492)
#define SH_TO_BAT_DEMATURE_TIME  ((uint16)(SH_TO_BAT_DEMATURE_TIME_ms / TASK_PERIOD)) //Sh-To-BAT faults should cleared after these task iterations
#define SH_TO_GND_DEMATURE_VALID_PULSES (5u) //Short-To-GND faults should cleared after 5 valid pulses are generated (SysRS: 8437016, SwRS: 9677182, 9674529)
#define SH_TOGETHER_CONSECUTIVE_PULSES (2u) //Short-Between-WULs is active for at least 2 consecutive pulses

#define EL_FAULT_TIME  (500u)  //after this time (EL_FAULT_TIME*10ms) el.fault is set
#define ShToGnd_ShTogether_CHECK_TIMER_UNINIT (0xFFu)

//GenWULPulseDiag
#define GenWULPulse_NoActDiagReq    (0x00u)     //Indication that there is no active Wakeup Line Pulse generation requested by Diag (RID 0x025A)
#define GenWULPulse_DiagReq         (0x01u)     //Indication that Wakeup Line Pulse generation is requested by Diag (RID 0x025A)
#define GenWULPulse_WUL1InProgress  (0x02u)     //Indication that Wakeup Line 1 Pulse generation is in progress
#define GenWULPulse_WUL2InProgress  (0x04u)     //Indication that Wakeup Line 2 Pulse generation is in progress
#define GenWULPulse_WUL1Finish      (0x08u)     //Indication that Wakeup Line 1 Pulse generation is completed
#define GenWULPulse_WUL2Finish      (0x10u)     //Indication that Wakeup Line 2 Pulse generation is completed
#define GenWULPulse_Complete        (0x20u)     //Indication that Wakeup Line Pulse generation has finished on both WULs

//DID 0x167 reads level of all wakeup lines into bitfield
#define DIAG_NCS_WUL_STATUS_BITMASK  (0x01u)    //NCS line is WUL1
#define DIAG_CS_WUL_STATUS_BITMASK   (0x02u)    //CS line is WUL2

/**********************************************************************************************************************
 GLOBAL VARIABLES
 **********************************************************************************************************************/
uint8 PatternGenOngoingWUL1 = 0u; /* PRQA S 3408 */ /* This global variable is need in a ISR function for fast porecudre */
uint8 PatternGenOngoingWUL2 = 0u; /* PRQA S 3408 */ /* This global variable is need in a ISR function for fast porecudre */

//extern'd only for read access, similar to PatternGenOngoingWUL1/2
extern uint8 ValidationTimerWUL1;
extern uint8 ValidationTimerWUL2;

/**********************************************************************************************************************
 GLOBAL CONST
 **********************************************************************************************************************/

/**********************************************************************************************************************
 LOCAL VARIABLES & CONST
 **********************************************************************************************************************/
static uint8  GenTimerWUL1 = 0u;
static uint8  GenTimerWUL2 = 0u;

//Eth Wakeup Lines/Pins statuses (used for El.Faults monitoring)
static uint8  WUL1Mon_StatusNCS_Old;
static uint8  WUL1Mon_StatusCS_Old;
static uint8  WUL1MonShToBAT_StatusNCS_Old = 1u; //default pin state
static uint8  WUL2Mon_StatusCS_Old;
static uint8  WUL2Mon_StatusNCS_Old;
static uint8  WUL2MonShToBAT_StatusCS_Old = 1u; //default pin state

static uint8  StartBothWULwOffset;
static uint8  IgnoreDiagReqGenWulPattern = 0u;
static uint8  IsDiagReqWUL1;
static uint8  IsDiagReqWUL2;

//Short-To-GND and Short-Together handling data
static uint8   ShToGND_ShTogether_CheckTimerWUL1 = ShToGnd_ShTogether_CHECK_TIMER_UNINIT;
static uint8   ShToGND_ShTogether_CheckTimerWUL2 = ShToGnd_ShTogether_CHECK_TIMER_UNINIT;
static uint16  ShToGND_ErrorCntWUL1 = 0u;
static uint16  ShToGND_ErrorCntWUL2 = 0u;
static uint8   ShToGND_DematureCnt_WUL1 = 0u;
static uint8   ShToGND_DematureCnt_WUL2 = 0u;
static uint8   ShTogether_ErrorCnt = 0u;
static boolean bCheck_ShortBetweenWULs = FALSE;
//Short-To-BAT handling data
static uint16  ShToBAT_ErrorCntWUL1 = 0u;
static uint16  ShToBAT_ErrorCntWUL2 = 0u;
static uint16  ShToBAT_DematureCnt_WUL1 = 0u;
static uint16  ShToBAT_DematureCnt_WUL2 = 0u;


/**********************************************************************************************************************
 PROTOTYPES OF GLOBAL FUNCTIONS
 **********************************************************************************************************************/

/**********************************************************************************************************************
 PROTOTYPES OF LOCAL FUNCTIONS
 **********************************************************************************************************************/
static void CheckWulPulsLength (void);

/**********************************************************************************************************************
 FUNCTION DEFINITIONS
 **********************************************************************************************************************/
void ScrIsWakeupDiagRequested (void);
void ScrStartEthLineShortMon (uint8 EthWUchannel);
void ScrHndlEthLineShortMonWUL1 (void);
void ScrHndlEthLineShortMonWUL2 (void);

/*****************************************************************************/
/**
 * @brief      Starts the monitoring the wakeup lines
 * @pre        -
 * @param[in]  -EthWUchannel: WUL channel
 *             -
 * @param[out] -
 * @return     -
 * @context    Function is called from state handling
 */
/*****************************************************************************/
void ScrStartEthLineShortMon (uint8 EthWUchannel)
{
    if ((EthWUchannel == WUL1) && (GenTimerWUL1 == 0u))
    {
        WUL1Mon_StatusNCS_Old = DioPortRead (g12IN_WAKE1);
        WUL1Mon_StatusCS_Old  = DioPortRead (g1IN_WAKE2);

        if (0u == ShToGND_ErrorCntWUL1)
        {
            ShToGND_ShTogether_CheckTimerWUL1 = SHORT_DET_TIME;
        }
    }
    else if ((EthWUchannel == WUL2) && (GenTimerWUL2 == 0u))
    {
        WUL2Mon_StatusCS_Old    = DioPortRead (g1IN_WAKE2);
        WUL2Mon_StatusNCS_Old = DioPortRead (g12IN_WAKE1);

        if (0u == ShToGND_ErrorCntWUL2)
        {
            ShToGND_ShTogether_CheckTimerWUL2 = SHORT_DET_TIME;
        }
    }
    else
    {
      /* Intentionally Empty */
    }
}


/*****************************************************************************/
/**
 * @brief      Handles the monitoring of short circuit line of WUL1
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from state handling
 */
/*****************************************************************************/
void ScrHndlEthLineShortMonWUL1 (void)
{
    uint8 StatusNCS_New = DioPortRead (g12IN_WAKE1);

    //-------------------------------------------------------------------------------------------------------
    //  Short-To-BAT monitoring
    //    (monitor only if diagnostic mode of permanent active level has NOT been applied)
    //-------------------------------------------------------------------------------------------------------
    if((GenTimerWUL1 != WU_PERMA_ACTIVE) && (GenTimerWUL2 != WU_PERMA_ACTIVE))
    {
        if ((WUL1MonShToBAT_StatusNCS_Old == 0u) && (StatusNCS_New == 0u))
        {
            //conditions for new error (Short-To-BAT) detected => clear Sh-To-GND err.counter
            ShToGND_ErrorCntWUL1 = 0u;

            ShToBAT_ErrorCntWUL1++;
            if (ShToBAT_ErrorCntWUL1 >= EL_FAULT_TIME)
            {
                ShToBAT_ErrorCntWUL1 = EL_FAULT_TIME; //limit to this max value
                // short to bat
                WUL1LineStatus = ShortUBAT;
                ShToBAT_DematureCnt_WUL1 = SH_TO_BAT_DEMATURE_TIME;
            }
        }
        else
        {
            if (WUL1LineStatus == ShortUBAT)
            {
                if ((WUL1MonShToBAT_StatusNCS_Old == 0u) && (StatusNCS_New == 1u))
                {
                    if (ShToBAT_DematureCnt_WUL1 > 0u)
                    {
                        ShToBAT_DematureCnt_WUL1--;
                    }
                    else
                    {
                        ShToBAT_ErrorCntWUL1 = 0u;
                        WUL1LineStatus = 0u;
                        WUL1MonShToBAT_StatusNCS_Old = StatusNCS_New;
                    }
                }
            }
            else
            {
                ShToBAT_ErrorCntWUL1 = 0u;
                WUL1MonShToBAT_StatusNCS_Old = StatusNCS_New;
            }
        }
    }
    //=======================================================================================================


    //-------------------------------------------------------------------------------------------------------
    //  Short-To-GND monitoring
    //-------------------------------------------------------------------------------------------------------
    if (ShToGND_ShTogether_CheckTimerWUL1 == 0u)
    {
        if ((PatternGenOngoingWUL1 == 1u) || (0u < ShToGND_ErrorCntWUL1))
        {
            if ((WUL1Mon_StatusNCS_Old == 1u) && (StatusNCS_New == 1u))
            {
                IsDiagReqWUL1 = 0u; //to avoid pulse length check of current pulse
                //conditions for new error (Short-To-GND) detected => clear Sh-To-BAT err.counter
                ShToBAT_ErrorCntWUL1 = 0u;

                ShToGND_ErrorCntWUL1++;
                if ((ShToGND_ErrorCntWUL1 >= EL_FAULT_TIME) || (WUL1LineStatus == ShortGND))
                {
                    ShToGND_ErrorCntWUL1 = 0u;
                    // short to GND
                    WUL1LineStatus = ShortGND;
                    ShToGND_DematureCnt_WUL1 = SH_TO_GND_DEMATURE_VALID_PULSES;
                }
            }
            else
            {
                //electrical faults still not set and error conditions are no more present => clear ShToGND err.counters
                ShToGND_ErrorCntWUL1 = 0u;
            }
        }
    }

    if ((ShToGND_ShTogether_CheckTimerWUL1 > 0u) && (ShToGnd_ShTogether_CHECK_TIMER_UNINIT != ShToGND_ShTogether_CheckTimerWUL1))
    {
        ShToGND_ShTogether_CheckTimerWUL1--;
    }
    //=======================================================================================================
}


/*****************************************************************************/
/**
 * @brief      Handles the monitoring of short circuit line of WUL2
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from state handling
 */
/*****************************************************************************/
void ScrHndlEthLineShortMonWUL2 (void)
{
    uint8 StatusCS_New = DioPortRead (g1IN_WAKE2);

    //-------------------------------------------------------------------------------------------------------
    //  Short-To-BAT monitoring
    //    (monitor only if diagnostic mode of permanent active level has NOT been applied)
    //-------------------------------------------------------------------------------------------------------
    if((GenTimerWUL1 != WU_PERMA_ACTIVE) && (GenTimerWUL2 != WU_PERMA_ACTIVE))
    {
        if ((WUL2MonShToBAT_StatusCS_Old == 0u) && (StatusCS_New == 0u))
        {
            //conditions for new error (Short-To-BAT) detected => clear Sh-To-GND err.counter
            ShToGND_ErrorCntWUL2 = 0u;

            ShToBAT_ErrorCntWUL2++;
            if (ShToBAT_ErrorCntWUL2 >= EL_FAULT_TIME)
            {
                ShToBAT_ErrorCntWUL2 = EL_FAULT_TIME; //limit to this max value
                // short to bat
                WUL2LineStatus = ShortUBAT;
                ShToBAT_DematureCnt_WUL2 = SH_TO_BAT_DEMATURE_TIME;
            }
        }
        else
        {
            if (WUL2LineStatus == ShortUBAT)
            {
                if ((WUL2MonShToBAT_StatusCS_Old == 0u) && (StatusCS_New == 1u))
                {
                    if (ShToBAT_DematureCnt_WUL2 > 0u)
                    {
                        ShToBAT_DematureCnt_WUL2--;
                    }
                    else
                    {
                        ShToBAT_ErrorCntWUL2 = 0u;
                        WUL2LineStatus = 0u;
                        WUL2MonShToBAT_StatusCS_Old = StatusCS_New;
                    }
                }
            }
            else
            {
                ShToBAT_ErrorCntWUL2 = 0u;
                WUL2MonShToBAT_StatusCS_Old = StatusCS_New;
            }
        }
    }
    //=======================================================================================================


    //-------------------------------------------------------------------------------------------------------
    //  Short-To-GND and Short-Between-WULs monitoring
    //-------------------------------------------------------------------------------------------------------
    if (ShToGND_ShTogether_CheckTimerWUL2 == 0u)
    {
        if ((PatternGenOngoingWUL2 == 1u) || (0u < ShToGND_ErrorCntWUL2))
        {
            if ((WUL2Mon_StatusCS_Old == 1u) && (StatusCS_New == 1u))
            {
                IsDiagReqWUL2 = 0u; //to avoid pulse length check of current pulse
                //conditions for new error (Short-To-GND) detected => clear Sh-To-BAT err.counter
                ShToBAT_ErrorCntWUL2 = 0u;

                ShToGND_ErrorCntWUL2++;
                if ((ShToGND_ErrorCntWUL2 >= EL_FAULT_TIME) || (WUL2LineStatus == ShortGND))
                {
                    ShToGND_ErrorCntWUL2 = 0u;
                    // short to GND
                    WUL2LineStatus = ShortGND;
                    ShToGND_DematureCnt_WUL2 = SH_TO_GND_DEMATURE_VALID_PULSES;
                }
            }
            else
            {
                //electrical faults still not set and error conditions are no more present => clear ShToGND err.counters
                ShToGND_ErrorCntWUL2 = 0u;
            }
        }


        if (bCheck_ShortBetweenWULs)
        {
            /** dtinkov, 2024.14.12:
             *
             *  1. Just checking the difference between pulses length (if less than or equal to 5ms, see SYS Req: 3498562),
             *     in order to set the fault, is not reliable enough. Since CEIC_C could also generate pulse on WUL1, both
             *     pulses (from CEIC_M and CEIC_C) may overlap each other and at the end we will have one, longer than the
             *     expected 700ms, pulse on the line. I.e. depending on timing conditions, it may happen that the "final" pulse
             *     on WUL1 is equal to the one on WUL2, or the difference between them is within 5ms. In this way, we will set
             *     DTC without having a real short circuit between the lines.
             *
             *  2. On request for pulse generation, it is expected that the level of the corresponding eth.line is LOW before the
             *     pulse begins and HIGH a certain time later (e.g. after 50ms). As the pulses on WUL1 and WUL2 are always started
             *     with an offset (WUL1 pulse is started first and 10ms later WUL2 pulse is started), in case of short circuit
             *     between the lines, the WUL2 level will be HIGH in both cases. This is an indication that both pulses have started
             *     together (due to the short circuit), instead with 10ms offset from each other.
             *     Since this indication just checks if both pulses have started with an offset or not, and does not check their
             *     full length, it should be used in addition to the pulses length check. Otherwise (if used alone), we will set DTC
             *     also in case of short-circuit between the lines, even for a very short moment, after which the pulses would still
             *     have more than the minimum allowed difference of 5ms.
             *
             *  3. For robustness, the DTC will be set only if both conditions/checks above fail for two or more consecutive pulses.
             *     (System engineer Uday Naraharasetti confirmed that this does not violate the system and/or customer's requirements)
             */

            // Check for Short-Between-WULs only if no other error is set to any of the lines
            if (
                  ((WUL1LineStatus != ShortUBAT) && (WUL1LineStatus != ShortGND))
                  &&
                  ((WUL2LineStatus != ShortUBAT) && (WUL2LineStatus != ShortGND))
                )
            {
                uint32 tmp;
                WupData_t* pWupData = WupGetData ();
                boolean bBothPulsesStartedTogether = FALSE;

                //check CS Line levels: current one and the one stored just before pulse starts
                if ((WUL2Mon_StatusCS_Old == 0u) && (StatusCS_New == 0u))
                {
                    //check if both pulses have started together
                    tmp = (pWupData->rawTimeWul2 > pWupData->rawTimeWul1) ? (pWupData->rawTimeWul2-pWupData->rawTimeWul1) : (pWupData->rawTimeWul1-pWupData->rawTimeWul2);
                    if (tmp <= 1u)  //rawTime diff is 6.5ms (i.e. one timer overflow)
                    {
                        bBothPulsesStartedTogether = TRUE;
                    }
                }

                //wait until the end of current pulses on both lines
                if ((pWupData->isBusyWul1 == 0u) && (pWupData->isBusyWul2 == 0u))
                {
                    //check the difference in the pulse durations
                    tmp = (pWupData->msTimeWul2 > pWupData->msTimeWul1) ? (pWupData->msTimeWul2-pWupData->msTimeWul1) : (pWupData->msTimeWul1-pWupData->msTimeWul2);
                    if ((TRUE == bBothPulsesStartedTogether) && (tmp <= 5u))
                    {
                        ShTogether_ErrorCnt++;
                        if (ShTogether_ErrorCnt >= SH_TOGETHER_CONSECUTIVE_PULSES)
                        {
                            // WULs short together
                            WUL1LineStatus = ShortWUL;
                            WUL2LineStatus = ShortWUL;

                            //conditions for new error ("Short-Between-WULs") detected => clear Sh-To-BAT and Sh-To-GND err.counters
                            ShToGND_ErrorCntWUL2 = 0u;
                            ShToBAT_ErrorCntWUL2 = 0u;
                        }
                    }
                    else
                    {
                        ShTogether_ErrorCnt = 0u;

                        if (ShortWUL == WUL1LineStatus)
                        {
                            WUL1LineStatus = 0u;
                        }
                        if (ShortWUL == WUL2LineStatus)
                        {
                            WUL2LineStatus = 0u;
                        }
                    }

                    //no need to check more than once after the end of the pulses
                    bCheck_ShortBetweenWULs = FALSE;
                }
            }
        }
    }

    if ((ShToGND_ShTogether_CheckTimerWUL2 > 0u) && (ShToGnd_ShTogether_CHECK_TIMER_UNINIT != ShToGND_ShTogether_CheckTimerWUL2))
    {
        ShToGND_ShTogether_CheckTimerWUL2--;

        //ready to check for Short-Between-WULs
        if (0u == ShToGND_ShTogether_CheckTimerWUL2)
        {
            bCheck_ShortBetweenWULs = TRUE;
        }
    }
    //=======================================================================================================
}

/*****************************************************************************/
/**
 * @brief      Initiates the generation of WUL pattern on given channel
 * @pre        -
 * @param[in]  -EthWUchannel: WUL cahnnel
 * @param[out] -
 * @return     -
 * @context    Function is called from state handling
 */
/*****************************************************************************/
void ScrGenerateWULPattern (uint8 EthWUchannel)
{
    if ((EthWUchannel == WUL1) && (WUL1LineStatus != ShortUBAT))
    {
        ScrStartEthLineShortMon (WUL1);
        if (0x00u == GenTimerWUL1)
        {
            if(ShortGND != WUL1LineStatus)
            {
                GenTimerWUL1 = WU_PULSE_LEN;
            }
            else
            {
                GenTimerWUL1 = WU_PULSE_LEN_SH_TO_GND;
            }
        }
        PatternGenOngoingWUL1 = 1u;
        DioPortWrite (g12OUT_WAKE1, 1u);
    }
    else if ((EthWUchannel == WUL2) && (WUL2LineStatus != ShortUBAT))
    {
        ScrStartEthLineShortMon (WUL2);
        if (0x00u == GenTimerWUL2)
        {
            if(ShortGND != WUL2LineStatus)
            {
                GenTimerWUL2 = WU_PULSE_LEN_CS;
            }
            else
            {
                GenTimerWUL2 = WU_PULSE_LEN_SH_TO_GND_CS;
            }
        }

        if (!(~GenWULPulseDiag & GenWULPulse_DiagReq))
        {
            //RID 025A Pulse Generation started
            GenWULPulseDiag |= GenWULPulse_WUL2InProgress;
        }

        PatternGenOngoingWUL2 = 1u;
        DioPortWrite (g1OUT_WAKE2, 1u);
    }
    else if (EthWUchannel == WUL_BOTH)
    {
        if (WUL1LineStatus != ShortUBAT)
        {
            ScrStartEthLineShortMon (WUL1);
            if (0x00u == GenTimerWUL1)
            {
                if(ShortGND != WUL1LineStatus)
                {
                    GenTimerWUL1 = WU_PULSE_LEN;
                }
                else
                {
                    GenTimerWUL1 = WU_PULSE_LEN_SH_TO_GND;
                }
            }
            if (!(~GenWULPulseDiag & GenWULPulse_DiagReq))
            {
                //RID 025A Pulse Generation started
                GenWULPulseDiag |= GenWULPulse_WUL1InProgress;
            }
            PatternGenOngoingWUL1 = 1u;
            DioPortWrite (g12OUT_WAKE1, 1u);
        }
        else
        {
            //Do not block RID 025A response in case of Sh-To-BAT on WUL1 only
            if (!(~GenWULPulseDiag & GenWULPulse_DiagReq))
            {
                GenWULPulseDiag |= GenWULPulse_WUL1Finish;
            }
        }

        if (WUL2LineStatus != ShortUBAT)
        {
            if (0u == IgnoreDiagReqGenWulPattern)
            {
                StartBothWULwOffset = 1u;   // start the second WUL with offset to prevent wrong short-UBAT detection
            }
            else
            {
                /** set the offset to 2, because:
                 *    - if "ScrGenerateWULPattern(WUL_BOTH)" is called and "IgnoreDiagReqGenWulPattern == 1"
                 *      => we have invalid pulse (i.e. "ScrGenerateWULPattern(WUL_BOTH)" has been called by "CheckWulPulsLength()".
                 *    - in this case, "StartBothWULwOffset" will be decremented in the same process and we will have generation of
                 *      pulse on WUL2, together with the generation on WUL1 (in the same process, without offset).
                 */
                StartBothWULwOffset = 2u;
            }
        }
        else
        {
            //Do not block RID 025A response in case of Sh-To-BAT on WUL2 only
            if (!(~GenWULPulseDiag & GenWULPulse_DiagReq))
            {
                GenWULPulseDiag |= GenWULPulse_WUL2Finish;
            }
        }
    }
    else if (EthWUchannel == WUL_DIAG_HIGH_ALL)
    {
        //no shortcut detection in the case of diagnostic permanent active of all WULs
        GenTimerWUL1 = WU_PERMA_ACTIVE;
        GenTimerWUL2 = WU_PERMA_ACTIVE;
        GenWULPulseDiag = WU_PERMA_ACTIVE;  //indication for diagnostics that WULs are already set to 'Permanent-High' Level
        PatternGenOngoingWUL1 = 1u;
        PatternGenOngoingWUL2 = 1u;
        DioPortWrite (g12OUT_WAKE1, 1u);
        DioPortWrite (g1OUT_WAKE2, 1u);
    }
    else
    {
        /* Intentionally Empty */
    }
}


/*****************************************************************************/
/**
 * @brief      Routine foe handling diagnostic reqs from Tricore to generate the
 *             wakeup patterns on WUL1 or WUL2
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from e.g. ECU state handling cylic task
 */
/*****************************************************************************/
void ScrIsWakeupDiagRequested (void)
{
    /** GenPermanentDiagHighAllWUL:
     *    - DID 0x168 Ethernet Wake-up Line Activation => The Wakeup lines shall be set to permanent high level until released by diag
     *  GenSinglePulseWULxDiag:
     *    - RID 0x25A Generate Wake up Line Pulse => Single pulse should be generated on WULx (x: WUL1 or WUL2 or WULBoth, depending on CEIC variant)
     */
    if((GenerateWakeup == GenPermanentDiagHighAllWUL) || (GenerateWakeup == GenSinglePulseWULxDiag))
    {
        WupData_t* pWupData = WupGetData();

        //If any ongoing WUL pulse handling, wait for it to complete
        //If we start servicing diag request, while there is an external pulse isBusyWul1, we might detect pattern length failure >1s and increment bad counter
        //If we start servicing diag request, while validation is not yet completed, we might misdetect a glitch for valid wakeup event
        //If we start servicing diag request, while in backoff time, we might have shortcut DTCs
        if((PatternGenOngoingWUL1 | PatternGenOngoingWUL2 | ValidationTimerWUL1 | ValidationTimerWUL2) == 0u)
        {
            //Critical section is needed due to external pulse handling in ISR context
            BrsHwDisableInterrupt();
            if((pWupData->isBusyWul1 == 0u) && (pWupData->isBusyWul2 == 0u))
            {
                if(GenerateWakeup == GenPermanentDiagHighAllWUL)
                {
                    //no consumption of shared var GenerateWakeup in this case due to need to maintain state until diag release on tricore side
                    ScrGenerateWULPattern(WUL_DIAG_HIGH_ALL);
                }
                else //GenSinglePulseWULxDiag
                {
                    IsDiagReqWUL1 = 1u;
                    GenerateWakeup = 0u;
                    ScrGenerateWULPattern(WUL_BOTH);
                }
            }
            BrsHwRestoreInterrupt();
        }
    }
    else
    {
        //if diagnostic mode of permanent active level has indeed been applied
        if((GenTimerWUL1 == WU_PERMA_ACTIVE) || (GenTimerWUL2 == WU_PERMA_ACTIVE))
        {
            //diag request released => release lines and PatternGenOngoingWUL1/2
            DioPortWrite(g12OUT_WAKE1, 0u);
            DioPortWrite(g1OUT_WAKE2, 0u);
            GenTimerWUL1 = 0u;
            GenTimerWUL2 = 0u;
            PatternGenOngoingWUL1 = 0u;
            PatternGenOngoingWUL2 = 0u;
            if (WU_PERMA_ACTIVE == GenWULPulseDiag)
            {
                GenWULPulseDiag = GenWULPulse_NoActDiagReq;
            }
        }
        if(IgnoreDiagReqGenWulPattern == 0u)
        {
            switch(GenerateWakeup)
            {
                case GenWUL1:
                    IsDiagReqWUL1 = 1u;
                    GenerateWakeup = 0u;
                    ScrGenerateWULPattern(WUL1);
                break;

                case GenWUL2:
                    IsDiagReqWUL2 = 1u;
                    GenerateWakeup = 0u;
                    ScrGenerateWULPattern(WUL2);
                break;

                case GenBothWULAndTriggerSwitch:
                    ScrKeepSwitchAwake();
                    //intentional no break
                case GenBothWUL:
                    IsDiagReqWUL1 = 1u;
                    GenerateWakeup = 0u;
                    ScrGenerateWULPattern(WUL_BOTH);
                break;

                case GenKeepSwitchAwake:
                    GenerateWakeup = 0u;
                    ScrKeepSwitchAwake();
                break;

                case GenKeepSwitchAwakeOff:
                    GenerateWakeup = 0u;
                    ScrResetPmicHandler();
                break;

                default:
                  // Nothing to do here, all relevant cases handled above
                break;
            }
        }
    }
}


/*****************************************************************************/
/**
 * @brief      Cyclic task for handling Eth Pattern Generation
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from e.g. ECU state handling cylic task
 */
/*****************************************************************************/
void ScrGenEthWULTask10 (void)
{
    uint8 u8TmpWulLevel = 0u;
    static uint8 task100ms = 0u;

    if(GenTimerWUL1 != WU_PERMA_ACTIVE)
    {
        if(GenTimerWUL1 > 0u)
        {
            GenTimerWUL1--;
        }
        if(GenTimerWUL1 == 0u)
        {
            DioPortWrite(g12OUT_WAKE1, 0u);
            PatternGenOngoingWUL1 = 0u;

            //check whether RID 025A Pulse Generation is in progress on WUL1
            if (!(~GenWULPulseDiag & GenWULPulse_WUL1InProgress))
            {
                //RID 025A Pulse Generation on WUL1 finished
                GenWULPulseDiag |= GenWULPulse_WUL1Finish;

                //check whether RID 025A Pulse Generation has finished on both WUL1 & WUL2
                if (!(~GenWULPulseDiag & (GenWULPulse_WUL1Finish | GenWULPulse_WUL2Finish)))
                {
                    GenWULPulseDiag = GenWULPulse_Complete;
                }
            }
        }
    }

    if(GenTimerWUL2 != WU_PERMA_ACTIVE)
    {
        if(GenTimerWUL2 > 0u)
        {
            GenTimerWUL2--;
        }
        if(GenTimerWUL2 == 0u)
        {
            DioPortWrite(g1OUT_WAKE2, 0u);
            PatternGenOngoingWUL2 = 0u;

            //check whether RID 025A Pulse Generation is in progress on WUL2
            if (!(~GenWULPulseDiag & GenWULPulse_WUL2InProgress))
            {
                //RID 025A Pulse Generation on WUL2 finished
                GenWULPulseDiag |= GenWULPulse_WUL2Finish;

                //check whether RID 025A Pulse Generation has finished on both WUL1 & WUL2
                if (!(~GenWULPulseDiag & (GenWULPulse_WUL1Finish | GenWULPulse_WUL2Finish)))
                {
                    GenWULPulseDiag = GenWULPulse_Complete;
                }
            }
        }
    }

    if(StartBothWULwOffset > 0u)
    {
        StartBothWULwOffset--;
        if(StartBothWULwOffset == 0u)
        {
            IsDiagReqWUL2 = 1u;
            ScrGenerateWULPattern(WUL2);
        }
    }

    if(++task100ms >= 10u)
    {
        task100ms = 0u;
        if(GenTimerWUL1 != WU_PERMA_ACTIVE)
        {
            CheckWulPulsLength();
        }
    }

    ScrIsWakeupDiagRequested();
    ScrHndlEthLineShortMonWUL1();
    ScrHndlEthLineShortMonWUL2();

    //Update current line levels to Tricore interface
    //Wakeup signals are Low active!
    if(0u == DioPortRead(g12IN_WAKE1))
    {
        u8TmpWulLevel |= DIAG_NCS_WUL_STATUS_BITMASK;
    }
    if(0u == DioPortRead(g1IN_WAKE2))
    {
        u8TmpWulLevel |= DIAG_CS_WUL_STATUS_BITMASK;
    }
    //Atomic transfer to XRAM shared var
    WULSignalLogicLevels = u8TmpWulLevel;
}


/*****************************************************************************/
/**
 * @brief      Cyclic task for checking the Wul puls length
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from e.g. ECU state handling cylic task
 */
/*****************************************************************************/
static void CheckWulPulsLength (void)
{
    static uint8 timer1000ms = 0u;
    static boolean bRetryInvPulse = FALSE;
    WupData_t* pWupData;

    pWupData = WupGetData ();

    if ((pWupData->isBusyWul1 == 0u) && (IgnoreDiagReqGenWulPattern == 0u) && (IsDiagReqWUL1 == 1u) && (WUL1LineStatus != ShortUBAT))
    {
        if ((pWupData->msTimeWul1 < VALID_PULS_MIN) || (pWupData->msTimeWul1 > VALID_PULS_MAX))
        {
            IgnoreDiagReqGenWulPattern = 1u;
            timer1000ms = 7u;
            bRetryInvPulse = TRUE;

            if (ShortGND == WUL1LineStatus)
            {
                //invalid pulse => reset the counter (SysRs: 8437016, SwRS: 9677182)
                ShToGND_DematureCnt_WUL1 = SH_TO_GND_DEMATURE_VALID_PULSES;
            }
        }
        else
        {
            bRetryInvPulse = FALSE;

            if (ShortGND == WUL1LineStatus)
            {
                if (ShToGND_DematureCnt_WUL1 > 0u)
                {
                    ShToGND_DematureCnt_WUL1--;
                    if (0u == ShToGND_DematureCnt_WUL1)
                    {
                        //5 consecutive valid WUPs (with 500ms duration) are generated on WUL1 => clear Sh-To-GND error (SysRs: 8437016, SwRS: 9677182)
                        ShToGND_ErrorCntWUL1 = 0u;
                        WUL1LineStatus = 0u;
                        ShToGND_ShTogether_CheckTimerWUL1 = ShToGnd_ShTogether_CHECK_TIMER_UNINIT;
                    }
                }
            }
        }
        //WUL1 pulse length checked => clear the flag and wait for next pulse gen. request to validate
        IsDiagReqWUL1 = 0u;
    }

    if ((pWupData->isBusyWul2 == 0u) && (IgnoreDiagReqGenWulPattern == 0u) && (IsDiagReqWUL2 == 1u)  && (WUL2LineStatus != ShortUBAT))
    {
        if ((pWupData->msTimeWul2 < VALID_PULS_MIN) || (pWupData->msTimeWul2 > VALID_PULS_MAX))
        {
            IgnoreDiagReqGenWulPattern = 1u;
            timer1000ms = 7u;
            bRetryInvPulse = TRUE;

            if (ShortGND == WUL2LineStatus)
            {
                //invalid pulse => reset the counter (SysRs: 8437016, SwRS: 9674529)
                ShToGND_DematureCnt_WUL2 = SH_TO_GND_DEMATURE_VALID_PULSES;
            }
        }
        else
        {
            bRetryInvPulse = FALSE;

            if (ShortGND == WUL2LineStatus)
            {
                if (ShToGND_DematureCnt_WUL2 > 0u)
                {
                    ShToGND_DematureCnt_WUL2--;
                    if (0u == ShToGND_DematureCnt_WUL2)
                    {
                        //5 consecutive valid WUPs (with 550ms duration) are generated on WUL1 => clear Sh-To-GND error (SysRs: 8437016, SwRS: 9674529)
                        ShToGND_ErrorCntWUL2 = 0u;
                        WUL2LineStatus = 0u;
                        ShToGND_ShTogether_CheckTimerWUL2 = ShToGnd_ShTogether_CHECK_TIMER_UNINIT;
                    }
                }
            }
        }
        //WUL2 pulse length checked => clear the flag and wait for next pulse gen. request to validate
        IsDiagReqWUL2 = 0u;
    }

    if (++timer1000ms >= 10u)
    {
        timer1000ms = 0u;

        if (TRUE == bRetryInvPulse)
        {
            ScrGenerateWULPattern (WUL_BOTH);
            bRetryInvPulse = FALSE;
        }
        else
        {
            IgnoreDiagReqGenWulPattern = 0u;
        }
    }
}


/*****************************************************************************/
/**
 * @brief      event routine for resetting some variables.
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from state handling if system goes in sleep mode
 */
/*****************************************************************************/
void ScrGenReset (void)
{
    IgnoreDiagReqGenWulPattern = 0u;
    IsDiagReqWUL1 = 0u;
    IsDiagReqWUL2 = 0u;
}

