/*
 * ScrWakeupEcu.c
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
#include "ScrDioPort.h"
#include "ScrWakeupEcu.h"
#include "ScrTricoreIf.h"
#include "ScrGenEthWULPulse.h"
#include "ScrWakeUpDetection.h"

/**********************************************************************************************************************
 DEFINITION + MACROS
 **********************************************************************************************************************/
#define MIN_PULSE 20u       // wakeup pulse length mimimum 20ms
#define MAX_PULSE 1000u     // wakeup pulse length maximum 1000ms
#define PMIC_ON_TIME 20u    // PMIC is triggered for PMIC_ON_TIME*50ms
#define PMIC_KEEP_SWITCH_AWAKE 20u // PMIC is triggered for PMIC_KEEP_SWITCH_AWAKE*50ms

/**********************************************************************************************************************
 GLOBAL VARIABLES
 **********************************************************************************************************************/

/**********************************************************************************************************************
 GLOBAL CONST
 **********************************************************************************************************************/

/**********************************************************************************************************************
 LOCAL VARIABLES & CONST
 **********************************************************************************************************************/
#define CAN_FR_LIN_WAKEABLE 0

/* PRQA S 0635 10 */ /* Compiler supports unsigned char bitfield defines  */
typedef struct{
  uint8 EthWUL1Detected: 1;
  uint8 EthWUL2Detected: 1;
  uint8 CanWupDetected: 1;
  uint8 FrWupDetected:  1;
  uint8 LinWupDetected: 1;
  uint8 unused:         3;
  uint8 PmicTimer;
} ScrData_t;

static ScrData_t  ScrData;

/**********************************************************************************************************************
 PROTOTYPES OF GLOBAL FUNCTIONS
 **********************************************************************************************************************/

/**********************************************************************************************************************
 PROTOTYPES OF LOCAL FUNCTIONS
 **********************************************************************************************************************/
static void ScrHandleWakeup (void);
static void ScrHandlePmic (void);

/**********************************************************************************************************************
 FUNCTION DEFINITIONS
 **********************************************************************************************************************/


void ScrEthWupCallback (uint8 EthWUchannel)
{
  if (EthWUchannel == WUL1)
  {
    ScrData.EthWUL1Detected = 1u;
  }
  if (EthWUchannel == WUL2)
  {
    ScrData.EthWUL2Detected = 1u;
  }
  //trigger PMIC
  ScrData.PmicTimer = PMIC_ON_TIME;
  DioPortWrite (g1OUT_PMIC1_WAKE, 1u);
}
void ScrCanWupCallback (void)
{
  ScrData.CanWupDetected = 1u;
  //trigger PMIC
#if CAN_FR_LIN_WAKEABLE == 1
  ScrData.PmicTimer = PMIC_ON_TIME;
  DioPortWrite (g1OUT_PMIC1_WAKE, 1u);
#endif
}
void ScrFrWupCallback (void)
{
  ScrData.FrWupDetected = 1u;
  //trigger PMIC
#if CAN_FR_LIN_WAKEABLE == 1
  ScrData.PmicTimer = PMIC_ON_TIME;
  DioPortWrite (g1OUT_PMIC1_WAKE, 1u);
#endif
}
void ScrLinWupCallback (void)
{
  ScrData.LinWupDetected = 1u;
  //trigger PMIC
#if CAN_FR_LIN_WAKEABLE == 1
  ScrData.PmicTimer = PMIC_ON_TIME;
  DioPortWrite (g1OUT_PMIC1_WAKE, 1u);
#endif
}
void ScrWupCallback (void)
{
  //trigger PMIC
  ScrData.PmicTimer = PMIC_ON_TIME;
  DioPortWrite (g1OUT_PMIC1_WAKE, 1u);
}
void ScrKeepSwitchAwake (void)
{
  ScrData.PmicTimer = PMIC_KEEP_SWITCH_AWAKE;
  DioPortWrite (g1OUT_PMIC1_WAKE, 1u);
}

/*****************************************************************************/
/**
 * @brief      Checks the wakeup signal timings and reports DTC if out of limits
 * @pre        -
 * @param[in]  -
 *             -
 * @param[out] -
 * @return     -
 * @context    Function is called from state handling
 */
/*****************************************************************************/
static void ScrHandleWakeup (void)
{
  WupData_t* pWupData;

  pWupData = WupGetData ();

  if ((pWupData->isBusyWul1 == 0u) && (ScrData.EthWUL1Detected == 1u))
  {
    ScrData.EthWUL1Detected = 0u;
    if (pWupData->msTimeWul1 > MAX_PULSE)
    {
      // pulse length of WUL is in too long
      if (WUL1CntBad < 0xFFu)
      {
        WUL1CntBad++;
      }
    }
  }

  if ((pWupData->isBusyWul2 == 0u) && (ScrData.EthWUL2Detected == 1u))
  {
    ScrData.EthWUL2Detected = 0u;
    if (pWupData->msTimeWul2 > MAX_PULSE)
    {
      // pulse length of WUL is in too long
      if (WUL2CntBad < 0xFFu)
      {
        WUL2CntBad++;
      }
    }
  }
}

/*****************************************************************************/
/**
 * @brief      starts the handling of PMIC with given time value
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from state handling
 */
/*****************************************************************************/
void ScrResetPmicHandler(void)
{
  ScrData.PmicTimer = 0u;
  DioPortWrite(g1OUT_PMIC1_WAKE, 0u);
}

/*****************************************************************************/
/**
 * @brief      starts the handling of PMIC with given time value
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from state handling
 */
/*****************************************************************************/
static void ScrHandlePmic (void)
{
#if 1  // toggle
  if (ScrData.PmicTimer > 0u)
  {
    ScrData.PmicTimer--;
    DioPortWrite (g1OUT_PMIC1_WAKE, 1u);

  }
  else
  {
    DioPortWrite (g1OUT_PMIC1_WAKE, 0u);
  }


#else

  static uint8 tt=0,bb=0,cc=0;

  if (tt==100)
  {
    DioPortWrite (g1OUT_PMIC1_WAKE, 1);
    bb=100;
  }

  if (tt < 101) tt++;

  if (bb==1)
  {
    DioPortWrite (g1OUT_PMIC1_WAKE, 0);
    tt=0;
  }

  if (bb>=1) bb--;
#endif
}


/*****************************************************************************/
/**
 * @brief      cylic task routine for handling the PMIC
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from state handling
 */
/*****************************************************************************/
void ScrWakeupEcuTask50 (void)
{
  ScrHandleWakeup ();
  ScrHandlePmic ();
}

