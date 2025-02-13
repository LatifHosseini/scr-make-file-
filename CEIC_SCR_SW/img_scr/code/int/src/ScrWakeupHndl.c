/*
 * ScrWakeupHndl.c
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
#include "ScrWakeupEcu.h"
#include "ScrStateMngmt.h"
#include "ScrWakeupHndl.h"
#include "ScrGenEthWULPulse.h"
#include "ScrDioPort.h"

/**********************************************************************************************************************
 DEFINITION + MACROS
 **********************************************************************************************************************/
#define VALIDATION_TIME 15u  // time ticks for validation the min pulse input: VALIDATION_TIME*1ms
#define UBAT_MIN    60u       // ADC value for 6V: U(R2014)= 10/43,2*6V; U = 1,39V; by LSB 23,077mV follows 60 ADC
#define UBAT_MAX    160u      // ADC value for 16V: U(R2014)= 10/43,2*16V; U = 3,70V; by LSB 23,077mV follows 160 ADC
#define ADC_CIRCUIT_VOLTAGE_DIFF  20u  // ADC measurement voltage difference between ADC circuit is off and on , 20u = 2V as per req. 5432279

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
  AdcStart = 0,
  CheckAdcCircuit,
  CheckUBat,
  DoNothing
} tADCMeasStates;

static tADCMeasStates ADCMeasState = DoNothing;
uint8 ValidationTimerWUL1 = 0u;
uint8 ValidationTimerWUL2 = 0u;
static uint16 UBatAdcDisabled = 0u;		// UBat votage value measured with ADC circuit is disabled
static uint16 UBatAdcEnabled = 0u;      // UBat votage value measured with ADC circuit is enabled
static uint8 ADCsample;

/**********************************************************************************************************************
 PROTOTYPES OF GLOBAL FUNCTIONS
 **********************************************************************************************************************/

/**********************************************************************************************************************
 PROTOTYPES OF LOCAL FUNCTIONS
 **********************************************************************************************************************/
static void DisableADCUnit (void);
static uint8 GetADCvalue (void);
static void EnableADCUnit (void);

/**********************************************************************************************************************
 FUNCTION DEFINITIONS
 **********************************************************************************************************************/

/****************************************************************************/
/*                            Disable ADC unit                              */
/****************************************************************************/
static void DisableADCUnit (void)
{
  SCR_SCU_PAGE.U = 0u;
  SCR_ADCOMP_CON.U = 0x00u; // Disable ADC
  while((SCR_ADCOMP_CON.B.ADCEN) != 0u); // Wait for ADC disable
}

/****************************************************************************/
/*                            Sample ADC Ch0 and return value               */
/****************************************************************************/
static uint8 GetADCvalue (void)
{
    uint8 result;
    SCR_SCU_PAGE.U = 0u;
    SCR_ADCOMP_CON.B.SOC = 1u; // start conversion
    while((SCR_ADCOMP_CON.B.VF) != 1u); // wait ValidFlag

    result = SCR_ADCOMP_RES.U;
    return result;
}


/****************************************************************************/
/*                            Enable ADC unit                               */
/****************************************************************************/
static void EnableADCUnit (void)
{
  volatile uint8 i;

  SCR_SCU_PAGE.U = 0u;
  SCR_ADCOMP_CON.B.ADCENREQ = 1u; // Enable ADC
  while((SCR_ADCOMP_CON.B.ADCEN) != 1u); // Wait for ADC enable

  SCR_ADCOMP_CON.B.ADCCHSEL = 0u; // select channel0
  for(i=0u; i<20u; i++);

  (void)GetADCvalue();  // dummy read at first time
}


/*****************************************************************************/
/**
 * @brief      Starts the validation of an detected Eth WUL
 * @pre        -
 * @param[in]  -
 *             -
 * @param[out] -
 * @return     -
 * @context    Function is called from wakeupdetection interrupt
 */
/*****************************************************************************/
void StartTimerValidateWUL1 (void)
{
  ValidationTimerWUL1 = VALIDATION_TIME;
  if (SCR_SCU_SR.B.STBY == 1u)
  {
      ScrWakeupHndl_ResetADCstate();
  }
}

void StartTimerValidateWUL2 (void)
{
  ValidationTimerWUL2 = VALIDATION_TIME;
  if (SCR_SCU_SR.B.STBY == 1u)
  {
      ScrWakeupHndl_ResetADCstate();
  }
}


/*****************************************************************************/
/**
 * @brief      sets the wakeup event which was the first
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from state handling
 */
/*****************************************************************************/
void SetFirstWakeupSource (WakeupSrc Wevent)
{
  if (FirstWakeup == (uint8)EMPTY) // check if another one was the first
  {
    FirstWakeup = (uint8)Wevent;
  }
}


/*****************************************************************************/
/**
* @brief      gets the wakeup event which was the first
* @pre        -
* @param[in]  -
* @param[out] -
* @return     -
* @context    Function is called from state handling
*/
/*****************************************************************************/
WakeupSrc GetFirstWakeupSource (void)
{
  return FirstWakeup;
}


/*****************************************************************************/
/**
 * @brief      cylic task routine for handling the wakeup events.
 *             Validation of WUL1&2 is doing here.
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from state handling
 */
/*****************************************************************************/
void ScrWakeupHndlTask1 (void)
{
  /* PRQA S 0303 LABEL_0303 */ /* MD_FBL_0303_MemoryMappedRegAccess */

  boolean bWULOperationCondition;

  switch (ADCMeasState)
  {
    case AdcStart:
        ADCsample = 0u;
        EnableADCUnit ();
        DioPortWrite (g1OUT_KL30_FLTR_SCR_AD_EN, 0u);
        ADCMeasState = CheckAdcCircuit;
      break;

    case CheckAdcCircuit:
        UBatAdcDisabled += GetADCvalue ();
        ADCsample++;
        if (ADCsample == 3u)
        {
            DioPortWrite (g1OUT_KL30_FLTR_SCR_AD_EN, 1u);
            ADCMeasState = CheckUBat;
            ADCsample = 0u;
            UBatAdcDisabled = UBatAdcDisabled/3u;
        }
      break;

    case CheckUBat:
        UBatAdcEnabled += GetADCvalue ();
        ADCsample++;
        if (ADCsample == 3u)
        {
            DisableADCUnit ();
            DioPortWrite (g1OUT_KL30_FLTR_SCR_AD_EN, 0u);
            ADCMeasState = DoNothing;  // Wait Next Wakeup Phase
            UBatAdcEnabled = UBatAdcEnabled/3u;
            if (UBatAdcEnabled - UBatAdcDisabled < ADC_CIRCUIT_VOLTAGE_DIFF)
            {
                ADCcircuitDTC = ADCdefectiv;
            }
            else
            {
                ADCcircuitDTC = 0u;
            }
        }
      break;

    default:
      /* Intentionally Empty */
      break;
  } 

  if (0u == SCR_SCU_SR.B.STBY)
  {
      /* Norrmal Mode => WUL Operation Condition evaluated on TriCore side. */
      bWULOperationCondition = WULOperationCondition;
  }
  else
  {
      /** Standby Mode => WUL Operation Condition evaluated on SCR side.
       *  Note:  In case of issue with the filter circuit => ignore the voltage condition check and set
       *         DTC (or update DTC fault counter), i.e. only the pulse length validation must be considered
       */
      bWULOperationCondition = ( (ADCdefectiv == ADCcircuitDTC) || ((UBatAdcEnabled > UBAT_MIN) && (UBatAdcEnabled < UBAT_MAX)) ) ? TRUE : FALSE;
  }

  if (ValidationTimerWUL1 > 0u)
  {
    if (ValidationTimerWUL1 == 1u)  //Validation timing is done check lines
    {
      if ((DioPortRead (g12IN_WAKE1) == 0u) && (TRUE == bWULOperationCondition)) //WUL1 signal is low activ (g12IN_WAKE1) and UBat is in range
      {                                     //This is valid edge of WUL, start further actions
        ScrEthWupCallback (WUL1);
        ScrGenerateWULPattern (WUL2);
        SetFirstWakeupSource (ETH_WUL1);
        WUL1Wakeup = ETH_WAK_FLAG;
        if (WUL1CntGood < 0xFFFFu)
        {
          WUL1CntGood++;
        }
      }
      else
      {
        ScrStateMngmtStandby ();    //WUL signal was not valid, switch SCR again in low power mode
      }
    }
    ValidationTimerWUL1--;
  }

  if (ValidationTimerWUL2 > 0u)
  {
    if (ValidationTimerWUL2 == 1u)
    {
      if ((DioPortRead (g1IN_WAKE2) == 0u) && (TRUE == bWULOperationCondition))  // WUL2 signal is low activ (g1IN_WAKE2)and UBat is in range
      {
        ScrEthWupCallback (WUL2);
        ScrGenerateWULPattern (WUL1);
        SetFirstWakeupSource (ETH_WUL2);
        WUL2Wakeup = ETH_WAK_FLAG;
        if (WUL2CntGood < 0xFFFFu)
        {
          WUL2CntGood++;
        }
      }
      else
      {
        ScrStateMngmtStandby ();
      }
    }
    ValidationTimerWUL2--;
  }
  /* PRQA L: LABEL_0303 */
}


/*****************************************************************************/
/**
 * @brief      event routine for handling the ADC measurement during wakeup validation.
 *             Validation of UBat is reset here.
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from state handling if system goes in sleep mode
 */
/*****************************************************************************/
void ScrWakeupHndl_ResetADCstate (void)
{   
    ADCMeasState = AdcStart;
    UBatAdcDisabled = 0u;
    UBatAdcEnabled = 0u;
}
