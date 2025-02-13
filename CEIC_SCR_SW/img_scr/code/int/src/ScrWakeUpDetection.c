/*
 * WakeUpDetection.c
 *
 *  Created on: 27.07.2021
 *      Author: vikaagz
 */

/**********************************************************************************************************************
 INCLUDES
 **********************************************************************************************************************/
#include "BrsHw.h"
#include "Ifx_reg.h"
#include "IfxScr_bf.h"
#include "ScrTricoreIf.h"
#include "ScrWakeupHndl.h"
#include "ScrWakeupEcu.h"
#include "ScrWakeUpDetection.h"
#include "ScrDioPort.h"
#include "ScrStateMngmt.h"

/**********************************************************************************************************************
 DEFINITION + MACROS
 **********************************************************************************************************************/

/**********************************************************************************************************************
 GLOBAL VARIABLES
 **********************************************************************************************************************/

/**********************************************************************************************************************
 GLOBAL CONST
 **********************************************************************************************************************/

/**********************************************************************************************************************
 LOCAL VARIABLES & CONST
 **********************************************************************************************************************/
#define TICKS_PER_MS  10000u

static WupData_t WupData;

extern uint8 PatternGenOngoingWUL1;
extern uint8 PatternGenOngoingWUL2;

/**********************************************************************************************************************
 PROTOTYPES OF GLOBAL FUNCTIONS
 **********************************************************************************************************************/

/**********************************************************************************************************************
 PROTOTYPES OF LOCAL FUNCTIONS
 **********************************************************************************************************************/
void ScrActivate100MHz(void);

/**********************************************************************************************************************
 FUNCTION DEFINITIONS
 **********************************************************************************************************************/


/* PRQA S 0303 LABEL_0303 */ /* MD_FBL_0303_MemoryMappedRegAccess */
/* PRQA S 2987 LABEL_0303 */ /* This function sets internal register */
/* PRQA S 3408 LABEL_0303 */ /* This ISR function definition is only needed in this way  */

/*****************************************************************************/
/**
 * @brief      Timer 0 is used for puls width measurement of the ethernet wakeupline 1
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from interrupt handling
 */
/*****************************************************************************/
void __interrupt(__INTNO(3)) Timer1OverflowInt(void)
{
    WupData.rawTimeWul2 ++;
}


/*****************************************************************************/
/**
 * @brief      Timer 1 is used for puls width measurement of the ethernet wakeupline 2
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from interrupt handling
 */
/*****************************************************************************/
void __interrupt(__INTNO(1)) Timer0OverflowInt(void)
{
    WupData.rawTimeWul1 ++;
}


/*****************************************************************************/
/**
* @brief      We need to free ports on the SCR to use more IOs,
*             to free ports we need to use an additional HW-Multiplexer.
* @pre        -
* @param[in]  -
* @param[out] -
* @return     -
* @context    Function is called from interrupt handling
*/
/*****************************************************************************/
void Multiplexer(void)
{
    uint8 MuxSel = 0u;
    uint8 result = 0u;

#if 0  /* @@@vikaagz: LIN is not supported and deactivated now, will be activated later */
    /* check first the lines for LIN, FR and CAN5, normally this is also handled in the corresponding ISR function */
    result = DioPortRead (g1IN_LIN_WAKE);
    if (result != 0u)
    {
        SetFirstWakeupSource (LIN);
    }
    else
#endif
    {
        result = DioPortRead (g1IN_FLR_WAKE);
        if (result != 0u)
        {
            SetFirstWakeupSource (FR);
        }
        else
        {
            result = DioPortRead (g1IN_CAN5_WAKE);
            if (result != 0u)
            {
                SetFirstWakeupSource (RESERVED1);
            }
            else
            {
                /* check the multiplexed CAN INH lines */
                while (MuxSel <= 7u)
                {
                    switch (MuxSel)
                    {
                        case 0:
                            DioPortWrite (g1OUT_MUX_SEL0, 0u);
                            DioPortWrite (g1OUT_MUX_SEL1, 0u);
                            DioPortWrite (g1OUT_MUX_SEL2, 0u);
                            BrsHwTime100NOP();
                            MuxSel++;
                            result = DioPortRead (g1IN_MUX_OUT);
                            if (result != 0u)
                            {
                                SetFirstWakeupSource (BODY1);
                                MuxSel = 0xFFu;   // break while-loop
                            }
                        break;
                        case 1:
                            DioPortWrite (g1OUT_MUX_SEL0, 1u);
                            DioPortWrite (g1OUT_MUX_SEL1, 0u);
                            DioPortWrite (g1OUT_MUX_SEL2, 0u);
                            BrsHwTime100NOP();
                            MuxSel++;
                            result = DioPortRead (g1IN_MUX_OUT);
                            if (result != 0u)
                            {
                                SetFirstWakeupSource (BODY2);
                                MuxSel = 0xFFu;   // break while-loop
                            }
                        break;
                        case 2:
                            DioPortWrite (g1OUT_MUX_SEL0, 0u);
                            DioPortWrite (g1OUT_MUX_SEL1, 1u);
                            DioPortWrite (g1OUT_MUX_SEL2, 0u);
                            BrsHwTime100NOP();
                            MuxSel++;
                            result = DioPortRead (g1IN_MUX_OUT);
                            if (result != 0u)
                            {
                                SetFirstWakeupSource (BODY3);
                                MuxSel = 0xFFu;   // break while-loop
                            }
                        break;
                        case 3:
                            DioPortWrite (g1OUT_MUX_SEL0, 1u);
                            DioPortWrite (g1OUT_MUX_SEL1, 1u);
                            DioPortWrite (g1OUT_MUX_SEL2, 0u);
                            BrsHwTime100NOP();
                            MuxSel++;
                            result = DioPortRead (g1IN_MUX_OUT);
                            if (result != 0u)
                            {
                                SetFirstWakeupSource (BODY4);
                                MuxSel = 0xFFu;   // break while-loop
                            }
                        break;
                        case 4:
                            DioPortWrite (g1OUT_MUX_SEL0, 0u);
                            DioPortWrite (g1OUT_MUX_SEL1, 0u);
                            DioPortWrite (g1OUT_MUX_SEL2, 1u);
                            BrsHwTime100NOP();
                            MuxSel++;
                            result = DioPortRead (g1IN_MUX_OUT);
                            if (result != 0u)
                            {
                                SetFirstWakeupSource (PERIPHERY2);
                                MuxSel = 0xFFu;   // break while-loop
                            }
                        break;
                        case 5:
                            DioPortWrite (g1OUT_MUX_SEL0, 1u);
                            DioPortWrite (g1OUT_MUX_SEL1, 0u);
                            DioPortWrite (g1OUT_MUX_SEL2, 1u);
                            BrsHwTime100NOP();
                            MuxSel++;
                            result = DioPortRead (g1IN_MUX_OUT);
                            if (result != 0u)
                            {
                                SetFirstWakeupSource (PERIPHERY);
                                MuxSel = 0xFFu;   // break while-loop
                            }
                        break;
                        case 6:
                            DioPortWrite (g1OUT_MUX_SEL0, 0u);
                            DioPortWrite (g1OUT_MUX_SEL1, 1u);
                            DioPortWrite (g1OUT_MUX_SEL2, 1u);
                            BrsHwTime100NOP();
                            MuxSel++;
                            result = DioPortRead (g1IN_MUX_OUT);
                            if (result != 0u)
                            {
                                SetFirstWakeupSource (HU1);
                                MuxSel = 0xFFu;   // break while-loop
                            }
                        break;
                        case 7:
                            DioPortWrite (g1OUT_MUX_SEL0, 1u);
                            DioPortWrite (g1OUT_MUX_SEL1, 1u);
                            DioPortWrite (g1OUT_MUX_SEL2, 1u);
                            BrsHwTime100NOP();
                            MuxSel++;
                            result = DioPortRead (g1IN_MUX_OUT);
                            if (result != 0u)
                            {
                                SetFirstWakeupSource (HU2);
                                MuxSel = 0xFFu;   // break while-loop
                            }
                        break;
                        default:
                            /* default section */
                            /* Intentionally Empty */
                        break;
                    }
                }
            }
        }
    }
    if (GetFirstWakeupSource() == EMPTY)
    {
        /* no valid wakeup was detected go sleep again */
        ScrStateMngmtStandby();
    }
    else
    {
        ScrWupCallback();
    }
}

/*****************************************************************************/
/**
 * @brief      external 0 interrupt is used for edge detecting the eth. wakeupline1
 *             if rising/falling edge detected, the time measurement is started.
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from interrupt handling
 */
/*****************************************************************************/
void __interrupt(__INTNO(0)) Ext0IntWakeupLine1(void)
{
    ScrActivate100MHz ();

    SCR_T01_TCON.B.IE0 = 0u;
    /* falling edge WUL (g12IN_WAKE1) */
    if (SCR_P01_IN.B.P2 == 0u)
    {
        WupData.isBusyWul1 = 1u;
        WupData.rawTimeWul1 = 0u;
        WupData.fineTimeWul1 = 0u;
        WupData.msTimeWul1 = 0u;

        SCR_T01_TL0.U = 0u;
        SCR_T01_TH0.U = 0u;
        SCR_T01_TCON.B.TR0 = 1u; /* start Timer 0 for measurement */
        if (PatternGenOngoingWUL1 == 0u)
        {
            StartTimerValidateWUL1 ();
        }
        SCR_SCU_PAGE.B.PAGE = 1u;
        SCR_EXICON0.B.EXINT0 = 1u; /* P01.2: rising edge 1, falling edge 0, ri/fal edge 2*/
        SCR_SCU_PAGE.B.PAGE = 0u;
    }
    else
    {
        /* rising edge WUL */
        SCR_T01_TCON.B.TR0 = 0u; /* stop Timer 0 measurement finished */

        /* check for uncosummed timer overflow */
        if (SCR_T01_TCON.B.TF0 == 1u)
        {
            SCR_T01_TCON.B.TF0 = 0u;
            WupData.rawTimeWul1++;
        }

        WupData.rawTimeWul1 *= 0xFFFFu;
        WupData.fineTimeWul1 = SCR_T01_TH0.U;
        WupData.fineTimeWul1 = (WupData.fineTimeWul1 << 8u) + SCR_T01_TL0.U;
        WupData.msTimeWul1 = (uint16)((WupData.rawTimeWul1 + WupData.fineTimeWul1) / TICKS_PER_MS);

        WupData.rawTimeWul1 = 0u;
        WupData.fineTimeWul1 = 0u;
        WupData.isBusyWul1 = 0u;
        //moved ScrEthWupCallback ();
        SCR_SCU_PAGE.B.PAGE = 1u;
        SCR_EXICON0.B.EXINT0 = 0u; /* P01.2: rising edge 1, falling edge 0, ri/fal edge 2*/
        SCR_SCU_PAGE.B.PAGE = 0u;
    }
}


/*****************************************************************************/
/**
* @brief       external 4 interrupt is used for edge detecting the eth. wakeupline2.
 *             if rising/falling edge detected, the time measurement is started.
 *             It is also used to  detect CAN wakeINH line interrupts.
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from interrupt handling
 */
/*****************************************************************************/
void __interrupt(__INTNO(9)) Ext4IntWakeupLine2(void)
{
    if (SCR_IRCON0.B.EXINT4 == 1u)
    {
        ScrActivate100MHz ();

        SCR_IRCON0.B.EXINT4 = 0u;
        /* Eth wakeup int, check falling edge WUL eth (g1IN_WAKE2) */
        if (SCR_P01_IN.B.P1 == 0u)
        {
            WupData.isBusyWul2 = 1u;
            WupData.rawTimeWul2 = 0u;
            WupData.fineTimeWul2 = 0u;
            WupData.msTimeWul2 = 0u;

            SCR_T01_TL1.U = 0u;
            SCR_T01_TH1.U = 0u;
            SCR_T01_TCON.B.TR1 = 1u; /* start Timer 1 for measurement */
            if (PatternGenOngoingWUL2 == 0u)
            {
                StartTimerValidateWUL2 ();
            }
            SCR_SCU_PAGE.B.PAGE = 1u;
            SCR_EXICON1.B.EXINT4 = 1u; /* P01.1: rising edge 1, falling edge 0, ri/fal edge 2*/
            SCR_SCU_PAGE.B.PAGE = 0u;
        }
        else
        {
            /* rising edge WUL */
            SCR_T01_TCON.B.TR1 = 0u; /* stop Timer 1 measurement finished */

            /* check for uncosummed timer overflow */
            if (SCR_T01_TCON.B.TF1 == 1u)
            {
                SCR_T01_TCON.B.TF1 = 0u;
                WupData.rawTimeWul2++;
            }

            WupData.rawTimeWul2 *= 0xFFFFu;
            WupData.fineTimeWul2 = SCR_T01_TH1.U;
            WupData.fineTimeWul2 = (WupData.fineTimeWul2 << 8u) + SCR_T01_TL1.U;
            WupData.msTimeWul2 = (uint16)((WupData.rawTimeWul2 + WupData.fineTimeWul2) / TICKS_PER_MS);

            WupData.rawTimeWul2 = 0u;
            WupData.fineTimeWul2 = 0u;
            WupData.isBusyWul2 = 0u;
            //moved ScrEthWupCallback ();
            SCR_SCU_PAGE.B.PAGE = 1u;
            SCR_EXICON1.B.EXINT4 = 0u; /* P01.1: rising edge 1, falling edge 0, ri/fal edge 2*/
            SCR_SCU_PAGE.B.PAGE = 0u;
        }
    }

    if (SCR_IRCON0.B.EXINT3 == 1u)
    {
        // WAKE_CAN_LIN_FLR_PMIC wakeup int.
        ScrActivate100MHz ();
        SCR_IRCON0.B.EXINT3 = 0u;
        if (SCR_SCU_SR.B.STBY == 1u)
        {
            /* start multiplexing */
            Multiplexer ();
        }
    }
}

#if 0 /* not used */
/*****************************************************************************/
/**
 * @brief      external 1 interrupt is used for edge detecting of CAN wake INH line
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from interrupt handling
 */
/*****************************************************************************/
void __interrupt(__INTNO(2)) Ext1IntCan3Wakeup(void)
{
    ScrActivate100MHz ();
    SCR_T01_TCON.B.IE1 = 0u;
    // CAN3 wakeup int.
    ScrCanWupCallback ();
    SetFirstWakeupSource (BODY4);
}
#endif

/*****************************************************************************/
/**
 * @brief      external 2 interrupt is used for edge detecting of CAN wake INH line
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from interrupt handling
 */
/*****************************************************************************/
void __interrupt(__INTNO(8)) Ext2IntCan5Wakeup(void)
{
    ScrActivate100MHz ();
    SCR_IRCON0.B.EXINT2 = 0u;
    // CAN5 wakeup int.
    ScrCanWupCallback ();
    SetFirstWakeupSource (RESERVED1);
}

#if 0 /* not used */
/*****************************************************************************/
/**
 * @brief      external 9 interrupt is used for edge detecting of CAN wake INH line
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from interrupt handling
 */
/*****************************************************************************/
void __interrupt(__INTNO(10)) Ext9IntCan1Wakeup(void)
{
    if (SCR_IRCON2.B.EXINT9 == 1u)
    {
        ScrActivate100MHz ();
        SCR_IRCON2.B.EXINT9 = 0u;
        // CAN1 wakeup int.
        ScrCanWupCallback ();
        SetFirstWakeupSource (BODY2);
    }
}
#endif

/*****************************************************************************/
/**
 * @brief      external 10 interrupt is used for edge detecting of CAN wake INH line
 *             external 11 interrupt is used for edge detecting of LIN wake INH line
 *             external 12 interrupt is used for edge detecting of CAN wake INH line
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from interrupt handling
 */
/*****************************************************************************/
void __interrupt(__INTNO(11)) Ext11IntLinWakeup(void)
{
    if (SCR_IRCON2.B.EXINT11 == 1u)
    {
        ScrActivate100MHz ();
        SCR_IRCON2.B.EXINT11 = 0u;
        // LIN wakeup int.
        ScrLinWupCallback ();
        SetFirstWakeupSource (LIN);
    }
}


/*****************************************************************************/
/**
 * @brief      external 13 interrupt is used for edge detecting of CAN wake INH line
 *             external 14 interrupt is used for edge detecting of FR wake INH line
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from interrupt handling
 */
/*****************************************************************************/
void __interrupt(__INTNO(12)) Ext14IntFrWakeup(void)
{
    if (SCR_IRCON2.B.EXINT14 == 1u)
    {
        ScrActivate100MHz ();
        SCR_IRCON2.B.EXINT14 = 0U;
        ScrFrWupCallback ();
        SetFirstWakeupSource (FR);
    }
}


/*****************************************************************************/
/**
 * @brief      Main initialization routine for interrupts.
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from BRS init
 */
/*****************************************************************************/
void WupInit (void)
{
    SCR_T01_TMOD.B.T0M = 1u; /* set Timer 0 to mode 1 = 16 bits non auto reload */
    SCR_T01_TMOD.B.T1M = 1u; /* set Timer 1 to mode 1 = 16 bits non auto reload */

    SCR_IEN0.B.ET0 = 1u; /* enable Timer 0 interrupt */
    SCR_IEN0.B.ET1 = 1u; /* enable Timer 1 interrupt */

    SCR_SCU_PAGE.B.PAGE = 1u;
    SCR_EXICON0.U = 0xFFu;   /* First disable all external int */
    SCR_EXICON1.U = 0xFFu;   /* First disable all external int */
    SCR_EXICON2.U = 0xFFu;   /* First disable all external int */
    SCR_EXICON3.U = 0xFFu;   /* First disable all external int */

    /* define input external interrupt edge */
    /* WUL1 */
    SCR_SCU_PAGE.B.PAGE = 1u;
    SCR_T01_TCON.B.IT0 = 1u;   /* edge detection of interrupt */
    SCR_EXICON0.B.EXINT0 = 0u; /* P01.2: rising edge 1, falling edge 0, ri/fal edge 2*/
    SCR_SCU_PAGE.B.PAGE = 2u;
    SCR_MODPISEL1.B.EXINT0IS = 3u; /* EX0 input is P1.2 */
    SCR_SCU_PAGE.B.PAGE = 1u;
    SCR_IEN0.B.EX0 = 1u;       /* enable ext. int 0*/
    SCR_IP.B.PX0 = 1u;         /* ext.int0 (xintr0)  prio (low bit) */
    SCR_IPH.B.PX0H = 1u;       /* ext.int0 (xintr0)  prio (hig bit) */

    /* WUL2 */
    SCR_EXICON1.B.EXINT4 = 0u; /* P01.1: rising edge 1, falling edge 0, ri/fal edge 2*/
    SCR_SCU_PAGE.B.PAGE = 2u;
    SCR_MODPISEL2.B.T2CC1EXINT4IS = 1u; /*EX4 input is P1.1*/
    SCR_SCU_PAGE.B.PAGE = 1u;
    SCR_IEN1.B.EXM = 1u;       /* enable ext. int 4*/
    SCR_IP1.B.PXM = 0u;        /* ext.int5 (xintr9)  prio (low bit) */
    SCR_IPH1.B.PXMH = 1u;      /* ext.int5 (xintr9)  prio (hig bit) */
    /* WAKE_CAN_LIN_FLR_PMIC */
    SCR_EXICON0.B.EXINT3 = 1u; /* P01.0: rising edge 1, falling edge 0, ri/fal edge 2*/
    SCR_SCU_PAGE.B.PAGE = 2u;
    SCR_MODPISEL2.B.T2CC0EXINT3IS = 1u; /*EX3 input is P01.0*/
    SCR_SCU_PAGE.B.PAGE = 1u;
    SCR_IEN1.B.EXM = 1u;       /* enable ext. int 3*/
#if 0 /* not used */
    /* CAN3 BODY4 */
    SCR_SCU_PAGE.B.PAGE = 1u;
    SCR_T01_TCON.B.IT1 = 1u;   /* edge detection of interrupt */
    SCR_EXICON0.B.EXINT1 = 1u; /* P00.1: rising edge 1, falling edge 0, ri/fal edge 2*/
    SCR_IEN0.B.EX1 = 1u;       /* enable ext. int 1*/
    SCR_IP.B.PX1 = 1u;         /* ext.int1 (xintr2) has one level higher prio*/
#endif

    /* CAN5 RESERVED1 */
    SCR_SCU_PAGE.B.PAGE = 2u;
    SCR_MODPISEL1.B.EXINT2IS = 1u; /* EX2 input is P0.6 */
    SCR_SCU_PAGE.B.PAGE = 1u;
    SCR_EXICON0.B.EXINT2 = 1u; /* P00.6: rising edge 1, falling edge 0, ri/fal edge 2*/
#if 0  /* @@@vikaagz: will handled in multiplexer */
    SCR_IEN1.B.EX2 = 1u;       /* enable ext. int 2 (xintr8) */
#else
    SCR_IEN1.B.EX2 = 0u;
#endif
    SCR_IP1.B.PX2 = 1u;
    SCR_IPH1.B.PX2H = 1u;
#if 0 /* not used */
    /* CAN4 PERIPHERY */
    SCR_EXICON1.B.EXINT6 = 1u; /* P01.3: rising edge 1, falling edge 0, ri/fal edge 2*/
    SCR_SCU_PAGE.B.PAGE = 2u;
    SCR_MODPISEL2.B.T2CC3EXINT6IS = 1u; /*EX6 input is P1.3*/
    SCR_IEN1.B.EXM = 1u;       /* enable ext. int 6 (xintr9) */

    /* CAN1 BODY2 */
    SCR_SCU_PAGE.B.PAGE = 1u;
    SCR_EXICON2.B.EXINT9 = 1u;  /* P00.6: rising edge 1, falling edge 0, ri/fal edge 2*/
    SCR_IEN1.B.ECCIP0 = 1u;     /* enable ext. int 9 (xintr10) */

    /* CAN2 BODY3 */
    SCR_SCU_PAGE.B.PAGE = 1u;
    SCR_EXICON2.B.EXINT10 = 1u; /* P00.7: rising edge 1, falling edge 0, ri/fal edge 2*/
    SCR_IEN1.B.ECCIP1 = 1u;     /* enable ext. int 10 (xintr11) */
#endif
    /* LIN */
    SCR_SCU_PAGE.B.PAGE = 1u;
    SCR_EXICON2.B.EXINT11 = 1u; /* P01.4: rising edge 1, falling edge 0, ri/fal edge 2*/
#if 0  /* @@@vikaagz: LIN is not supported and deactivated now */
    SCR_IEN1.B.ECCIP1 = 1u;     /* enable ext. int 11 (xintr11) */
#else
    SCR_IEN1.B.ECCIP1 = 0u;
#endif
    SCR_IP1.B.PCCIP1 = 1u;
    SCR_IPH1.B.PCCIP1H = 1u;
#if 0 /* not used */
    /* CAN8 HU1 */
    SCR_SCU_PAGE.B.PAGE = 1u;
    SCR_EXICON3.B.EXINT12 = 1u; /* P01.5: rising edge 1, falling edge 0, ri/fal edge 2*/
    SCR_IEN1.B.ECCIP1 = 1u;     /* enable ext. int 12 (xintr11) */

    /* CAN9 HU2 */
    SCR_SCU_PAGE.B.PAGE = 1u;
    SCR_EXICON3.B.EXINT13 = 1u; /* P01.6: rising edge 1, falling edge 0, ri/fal edge 2*/
    SCR_IEN1.B.ECCIP2 = 1u;     /* enable ext. int 13 (xintr12) */
#endif
    /* FR */
    SCR_SCU_PAGE.B.PAGE = 1u;
    SCR_EXICON3.B.EXINT14 = 1u; /* P01.7: rising edge 1, falling edge 0, ri/fal edge 2*/
#if 0  /* @@@vikaagz: will handled in multiplexer */
    SCR_IEN1.B.ECCIP2 = 1u;     /* enable ext. int 14*/
#else
    SCR_IEN1.B.ECCIP2 = 0u;     /* enable ext. int 14*/
#endif
    SCR_IP1.B.PCCIP2 = 1u;      /* ext.int 14 (xintr12) has one level higher prio*/
    SCR_IPH1.B.PCCIP2H = 1u;

    /* clr all int flags */
    SCR_SCU_PAGE.B.PAGE = 0u;
    SCR_IRCON0.U = 0u;
    SCR_IRCON1.U = 0u;
    SCR_IRCON2.U = 0u;

    WupData.isBusyWul1 = 1u;
    WupData.isBusyWul2 = 1u;
}

void ScrActivate100MHz (void)
{
    if (SCR_SCU_SR.B.STBY == 1u)    //If in SCR low power-mode (70kHz) interrupt is detected
    {                               //switch on the 100MHz immediately to handle the wakeup interrupt
        SCR_SCU_PAGE.B.PAGE = 1u;

        SCR_PASSWD.U = 0xC0u;         //Enable writing of protected regs
        SCR_SCU_CMCON.B.OSCPD = 0u;   //100 MHz oscillator is powered up in standby mode =0
        SCR_PASSWD.U = 0xC7u;         //Disable writing of protected regs

        SCR_SCU_PAGE.B.PAGE = 0u;
    }
}

WupData_t* WupGetData (void)
{
    return &WupData;
}

/* PRQA L: LABEL_0303 */
