/*
 * ScrStateMngmt.c
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
#include "ScrWakeupHndl.h"
#include "ScrStateMngmt.h"
#include "ScrGenEthWULPulse.h"
#include "ScrWakeUpDetection.h"
#include "ScrDioPort.h"
#include "ScrWakeupEcu.h"

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
typedef enum
{
  UNINIT = 0,
  INITIALISED,
  NORMAL,
  STANDBY,
  SLEEP
} tScrStates;

static tScrStates ScrState = INITIALISED;

static uint16 RunOutTimeCnt;
#define RUN_OUT_TIME  500u    //If Tricore goes in standby mode, SCR should wait this time and go than in low power mode

static boolean gbNormalToStbyTransition = FALSE;
static boolean gbRestartPMICWakPulse = FALSE;

/**********************************************************************************************************************
 PROTOTYPES OF GLOBAL FUNCTIONS
 **********************************************************************************************************************/

/**********************************************************************************************************************
 PROTOTYPES OF LOCAL FUNCTIONS
 **********************************************************************************************************************/

/**********************************************************************************************************************
 FUNCTION DEFINITIONS
 **********************************************************************************************************************/

/* PRQA S 0303 LABEL_0303 */ /* MD_FBL_0303_MemoryMappedRegAccess */

/*****************************************************************************/
/**
 * @brief      Main state management routine.
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from main task
 */
/*****************************************************************************/
void ScrStateMngmtTask10 (void)
{
  switch(ScrState)
  {
    case UNINIT:
      break;
    case INITIALISED:
      RunOutTimeCnt = 0u;
      ScrState = NORMAL;
      SetDioPortsForNormalOperation();
      break;
    case NORMAL:
      // check Tricore if standby mode is entered, if yes go SCR lowpower mode
      if (SCR_SCU_SR.B.STBY == 1u)
      {
        RunOutTimeCnt = RUN_OUT_TIME;
        FirstWakeup = 0u;             //Clear this to arm the mechanism for registration the  wakeup reason
        gbNormalToStbyTransition = TRUE;
        ScrState = STANDBY;	
        SetDioPortsForSleepOperation();
        ScrGenReset ();
      }
      break;
    case STANDBY:
      //PMIC triggers Aurix power up due to rising WAK edge. On sleep transition Tricore might send Off command during an ongoing pulse on SCR WAK line
      //In order to wake up, we need to restart the pulse
      //Not needed for trcv wakeups as these trigger SCR WAK only in Aurix Standby mode
      if(FALSE != gbRestartPMICWakPulse)
      {
          ScrWupCallback();
          gbRestartPMICWakPulse = FALSE;
      }

      if(FALSE != gbNormalToStbyTransition)
      {
          if(SCR_SCU_SR.B.STBY == 1u)
          {
              if(ETH_WAK_FLAG == WUL1Wakeup)
              {
                  SetFirstWakeupSource (ETH_WUL1);
                  gbRestartPMICWakPulse = TRUE;
                  ScrResetPmicHandler();
              }
              else if(ETH_WAK_FLAG == WUL2Wakeup)
              {
                  SetFirstWakeupSource (ETH_WUL2);
                  gbRestartPMICWakPulse = TRUE;
                  ScrResetPmicHandler();
              }
              else
              {
                  Multiplexer();
              }
          }
          gbNormalToStbyTransition = FALSE;
      }

      // run out "nachlaufzeit" and switch SCR in low power frequency mode
      RunOutTimeCnt--;

      if (RunOutTimeCnt == 0u)
      {
        SCR_SCU_PAGE.B.PAGE = 1u;

        SCR_PASSWD.U = 0xC0u;         //Enable writing of protected regs
        SCR_SCU_CMCON.B.OSCWAKE = 0;  //Modules can clear OSCPD and enable 100 MHz oscillator =1
        SCR_SCU_CMCON.B.OSCPD = 1;    //100 MHz oscillator is powered down in standby mode =1
        SCR_PASSWD.U = 0xC7u;         //Disable writing of protected regs
        SCR_PCON.B.IDLE = 0u;         //0= Do not enter Idle Mode. 1= Enter Idle Mode. If activated program stops here until any ints coming.

        SCR_SCU_PAGE.B.PAGE = 0u;
        ScrState = SLEEP;
      }
      break;
    case SLEEP:
      // check Tricore if normal mode is entered. Normally the 100MHz clock is still activated in the WUL1&2 int-routine
      if (SCR_SCU_SR.B.STBY == 0u)
      {
        SCR_SCU_PAGE.B.PAGE = 1u;

        SCR_PASSWD.U = 0xC0u;         //Enable writing of protected regs
        SCR_SCU_CMCON.B.OSCWAKE = 0;  //Modules can clear OSCPD and enable 100 MHz oscillator =1
        SCR_SCU_CMCON.B.OSCPD = 0;    //100 MHz oscillator is powered up in standby mode =0
        SCR_PASSWD.U = 0xC7u;         //Disable writing of protected regs

        SCR_SCU_PAGE.B.PAGE = 0u;
        RunOutTimeCnt = 0u;
        ScrState = NORMAL;
        SetDioPortsForNormalOperation();
      }
      break;
    default:
      /* Intentionally Empty */
      break;
  }
}


/*****************************************************************************/
/**
 * @brief      Sets the SCR state to standby
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from wakeupdetection validation
 */
/*****************************************************************************/
void ScrStateMngmtStandby (void)
{
  // check if Tricore is also in standby mode
  if (SCR_SCU_SR.B.STBY == 1u)
  {
    RunOutTimeCnt = RUN_OUT_TIME;
    if(NORMAL == ScrState)
    {
        gbNormalToStbyTransition = TRUE;
    }
    ScrState = STANDBY;
    SetDioPortsForSleepOperation();
  }
}

/* PRQA L: LABEL_0303 */
