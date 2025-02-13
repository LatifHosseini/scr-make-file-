/**********************************************************************************************************************
 COPYRIGHT
 -----------------------------------------------------------------------------------------------------------------------
 \par      copyright
 \verbatim
 Copyright (c) 2020 by Vector Informatik GmbH.                                                  All rights reserved.

 This software is copyright protected and proprietary to Vector Informatik GmbH.
 Vector Informatik GmbH grants to you only those rights as set out in the license conditions.
 All other rights remain with Vector Informatik GmbH.
 \endverbatim
 -----------------------------------------------------------------------------------------------------------------------
 FILE DESCRIPTION
 -----------------------------------------------------------------------------------------------------------------------
 \file  File:  BrsHw.c
 Project:  Vector Basic Runtime System
 Module:  BrsHw for platform Infineon Xc800
 Template:  This file is reviewed according to zBrs_Template@root[2.02.04]

 \brief Description:  This is the hardware specific code file for Vector Basic Runtime System (BRS).
 This file supports: Tasking compiler, XC800 family

 \attention Please note:
 The demo and example programs only show special aspects of the software. With regard to the fact
 that these programs are meant for demonstration purposes only, Vector Informatik liability shall be
 expressly excluded in cases of ordinary negligence, to the extent admissible by law or statute.
 **********************************************************************************************************************/

/**********************************************************************************************************************
 AUTHOR IDENTITY
 ----------------------------------------------------------------------------------------------------------------------
 Name                          Initials      Company
 ----------------------------  ------------  -------------------------------------------------------------------------
 Benjamin Walter               visbwa        Vector Informatik GmbH
 Jochen Theuer                 visth         Vector Informatik GmbH
 Jens Haerer                   visjhr        Vector Informatik GmbH
 -----------------------------------------------------------------------------------------------------------------------
 REVISION HISTORY
 ----------------------------------------------------------------------------------------------------------------------
 Version   Date        Author  Description
 --------  ----------  ------  ---------------------------------------------------------------------------------------
 1.00.00   2010-08-16  visth   Initial Version
 1.01.00   2010-10-16  visth   Add Large model + CAN support
 1.01.01   2010-10-16  visstu  Add tasking support
 2.00.00   2020-07-16  visjhr  Adapted according to Brs_Template 2.02.04
 2020-08-06  visbwa  Review; several adaptions for new C51 Tasking abstraction;
 removed DrvCan and Keil support; Wrapper for Aurix sfr file namings
 **********************************************************************************************************************/

/**********************************************************************************************************************
 *  EXAMPLE CODE ONLY
 *  -------------------------------------------------------------------------------------------------------------------
 *  This Example Code is only intended for illustrating an example of a possible BSW integration and BSW configuration.
 *  The Example Code has not passed any quality control measures and may be incomplete. The Example Code is neither
 *  intended nor qualified for use in series production. The Example Code as well as any of its modifications and/or
 *  implementations must be tested with diligent care and must comply with all quality requirements which are necessary
 *  according to the state of the art before their use.
 *********************************************************************************************************************/

/**********************************************************************************************************************
 INCLUDES
 **********************************************************************************************************************/
/*
 * Description: The BrsHw header provides all the necessary interfaces to
 *              the microcontroller hardware features like ports, timers, LEDs, ...
 */
#include "BrsHw.h"
#include "Ifx_reg.h"
#include "IfxScr_bf.h"
#include "ScrDioPort.h"
#include "ScrWakeUpDetection.h"

/*
 * Description: The BrsMain header provides all the necessary interfaces to
 *              the BRS main file (BrsMainExceptionHandler, gbBrsMainIsrMilliSecondFlag).
 *              This file is part of the BRS.
 */
#include "BrsMain.h"

/**********************************************************************************************************************
 VERSION CHECK
 **********************************************************************************************************************/
#if (BRSHW_VERSION != 0x0200)
#error "Header and source file are inconsistent!"
#endif
#if (BRSHW_BUGFIX_VERSION != 0x00)
#error "Different versions of bugfix in Header and Source used!"
#endif

/**********************************************************************************************************************
 CONFIGURATION CHECK
 **********************************************************************************************************************/
#if defined(BRS_COMP_TASKING)

#else
#error "Unknown compiler specified!"
#endif

/**********************************************************************************************************************
 DEFINITION + MACROS
 **********************************************************************************************************************/
/* As the register namings inside the sfr files differ, a wrapper is needed */
#if defined(BRS_DERIVATIVE_51)
/* nothing to be done, default register namings from sfr file are suitable */

#elif defined(BRS_DERIVATIVE_tc26x) || defined(BRS_DERIVATIVE_tc26xb)
#define EA IEN0_EA
#define ET0 IEN0_ET0
#define TR0 TCON_TR0

#define SET_P0_0 SET_SCR_P00_OUT_0
#define CLR_P0_0 CLR_SCR_P00_OUT_0

#elif defined(BRS_DERIVATIVE_tc38x) || defined(BRS_DERIVATIVE_tc39x) || \
    defined(BRS_DERIVATIVE_tc39xb)
// #define EA   SCR_IEN0.B.EA
// #define ET0  SCR_IEN0_ET0
// #define TMOD SCR_T01_TMOD
// #define TL0  SCR_T01_TL0
// #define TH0  SCR_T01_TH0
// #define TR0  ((*(__sfr volatile __bitstruct_t *) 0xc9).__b4)

// #define SET_P0_0 SET_SCR_P00_OUT_0
// #define CLR_P0_0 CLR_SCR_P00_OUT_0

#else
#error "Selected derivative not yet supported!"
#endif

/**********************************************************************************************************************
 GLOBAL VARIABLES
 **********************************************************************************************************************/

/**********************************************************************************************************************
 GLOBAL CONST VARIABLES
 **********************************************************************************************************************/
/*
 * Description: These constants are used to propagate the Versions over
 *              module boundaries.The version numbers are BCD coded. E.g. a sub
 *              version of 23 is coded with 0x23, a bug fix version of 9 is
 *              coded 0x09.
 */
uint8 const kBrsHwMainVersion = (uint8)(BRSHW_VERSION >> 8u);
uint8 const kBrsHwSubVersion = (uint8)(BRSHW_VERSION & 0xFFu);
uint8 const kBrsHwBugfixVersion = (uint8)(BRSHW_BUGFIX_VERSION);

/**********************************************************************************************************************
 LOCAL VARIABLES AND LOCAL HW REGISTERS
 **********************************************************************************************************************/
/*
 * Description: This counter is used to count the number of nested calls to
 *              disable and restore the state of the global INT enable bit.
 *              Please note: This variable is used only in this file.
 * Values     : 0 if no BrsHwDisableInterrupt is called and INT is allowed by the
 *              BRS. Value > 0 if INT is locked by the BRS interrupt control API.
 */
static uint8 bBrsHwIntDiCounter;

/*
 * Description: This variable is used to store the state of the IEN flag at
 *              the first call of BrsHwDisableInterrupt till the last nested call
 *              of BrsHwRestoreInterrupt.
 */
static uint16 wBrsHwSavedPSW;

/**********************************************************************************************************************
 CONTROLLER CONFIGURATION REGISTERS
 **********************************************************************************************************************/
/* Sfr file is used for this. Proper sfr file is included via compiler switch */

/**********************************************************************************************************************
 LOCAL VARIABLES
 **********************************************************************************************************************/

/**********************************************************************************************************************
 LOCAL CONST VARIABLES
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
 * @brief      This function has to be used to initialize the Watchdog.
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from main@BrsMain or EcuM at power on initialization
 */
/*****************************************************************************/
void BrsHwWatchdogInitPowerOn(void)
{
}

/*****************************************************************************/
/**
 * @brief      This function has to be used to initialize the PLL.
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from main@BrsMain or EcuM at power on initialization
 */
/*****************************************************************************/
void BrsHwPllInitPowerOn(void)
{
}

/*****************************************************************************/
/**
 * @brief      This function has to be used to initialize the used ports.
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from main@BrsMain or EcuM at power on initialization
 */
/*****************************************************************************/
void BrsHwPortInitPowerOn(void)
{
  DioPortInit();
}

/*****************************************************************************/
/**
 * @brief      Programmable Interrupt Timer, Timer initialization for 'FakeOS'
 *             1ms time base generation
 * @pre        Interrupt vector must be correct configured and the ISR
 *             function itself should exist.
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from main@BrsMain at power on initialization.
 */
/*****************************************************************************/
void BrsHwTimeBaseInitPowerOn(void)
{
  SCR_SCU_PAGE.B.PAGE = 1u;

  SCR_SCU_PMCON1.B.RTC_DIS = 0u; /* enable RTC */
  SCR_IEN1.B.ECCIP3 = 1u;        /* enable XINTR13 interrupt for RTC capture int*/
  SCR_RTC_CNT0.U = 0u;           /* Initialize RTC count registers*/
  SCR_RTC_CNT1.U = 0u;
  SCR_RTC_CNT2.U = 0u;
  SCR_RTC_CNT3.U = 0u;
  SCR_RTC_CR0.U = 0x20u; /* Initialize RTC compare registers to 20000 ticks for 1ms @ 20Mhz (f/DIV5) (100Mhz/5)*/
  SCR_RTC_CR1.U = 0x4eu;
  SCR_RTC_CR2.U = 0u;
  SCR_RTC_CR3.U = 0u;

  SCR_NMISR.U = 0u; /* Clear all NMI service request flags */

  SCR_RTC_CON.B.ECRTC = 1u;     /* real time clock compare enable*/
  SCR_RTC_CON.B.RTPBYP = 1u;    /* prescaler bypassed */
  SCR_RTC_CON.B.RTCCLKSEL = 1u; /* select fclk/5 as input */
  SCR_RTC_CON.B.RTCC = 1u;      /* start real time clock */

  SCR_SCU_PAGE.B.PAGE = 0u;

  WupInit();
}

/*****************************************************************************/
/**
 * @brief      Timer interrupt for the 'FakeOS' 1ms time base generation.
 *             This ISR function is not necessary if an OS is used!
 * @pre        Interrupt vector must be correct configured and the ISR
 *             function itself should exist.
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from interrupt vector table if the assigned
 *             timer has set its interrupt flag.
 */
/*****************************************************************************/
void __interrupt(__INTNO(13)) BrsHwTimeBaseInterrupt(void) /* PRQA S 3408 */ /* This ISR function definition is only needed in this way  */
{
  gbBrsMainIsrMilliSecondFlag++;
}

/*****************************************************************************/
/**
 * @brief      Disable the global system interrupt and initialize the INT
 *             lock handler variables.
 * @pre        Must be the first function call in main@BrsMain
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from main@BrsMain at power on initialization
 */
/*****************************************************************************/
void BrsHwDisableInterruptAtPowerOn(void)
{
  bBrsHwIntDiCounter = 0u;
  SCR_IEN0.B.EA = 0u;
}

/*****************************************************************************/
/**
 * @brief      Enable the global system interrupt the first time
 * @pre        Must be called after all initializations are done
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from main@BrsMain at power on initialization
 */
/*****************************************************************************/
void BrsHwEnableInterruptAtPowerOn(void)
{
  SCR_IEN0.B.EA = 1u;
}

/*****************************************************************************/
/**
 * @brief      This function has to be used to initialize the used interrupts.
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from BrsHwEnableInterruptAtPowerOn or EcuM-DriverInitThree
 */
/*****************************************************************************/
void BrsHwConfigureInterruptsAtPowerOn(void)
{
  /* Timer interrupt is enabled in BrsHwTimeBaseInitPowerOn() */
  /* Activate CAN Interrupts done in CAN Driver */
}

/*****************************************************************************/
/**
 * @brief      Disables the global interrupt of the micro. This is done in a
 *             "save way" to allow also nested calls of BrsHwDisableInterrupt
 *             and BrsHwRestoreInterrupt. The first call of BrsHwDisableInterrupt
 *             stores the current state of the global INT flag and the last
 *             call to BrsHwRestoreInterrupt restores the state.
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from all modules to disable the global interrupt
 */
/*****************************************************************************/
void BrsHwDisableInterrupt(void)
{
  uint16 localOldPSW;

  /* No check for "overrun" of nested INT lock counter is performed, due to more
   *  than 255 nested calls to BrsHwDisableInterrupt are very unlikely. */
  if (bBrsHwIntDiCounter == 0u)
  {
    localOldPSW = SCR_IEN0.B.EA;
    SCR_IEN0.B.EA = 0u;
    wBrsHwSavedPSW = localOldPSW;
  }

  bBrsHwIntDiCounter++;
}

/*****************************************************************************/
/**
 * @brief      Restores the state of the global interrupt of the micro. This
 *             is done in a "save way" to allow also nested calls of
 *             BrsHwDisableInterrupt and BrsHwRestoreInterrupt. The first call
 *             of BrsHwDisableInterrupt stores the current state of the global
 *             INT flag and the last call to BrsHwRestoreInterrupt restores the
 *             state.
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from all modules to enable the global interrupt
 */
/*****************************************************************************/
void BrsHwRestoreInterrupt(void)
{
  /* Check for illegal call of BrsHwRestoreInterrupt. If this function is called
   *  too often, the INT lock works incorrect. */
  if (bBrsHwIntDiCounter == 0u)
  {
    BrsMainExceptionHandler(kBrsIllegalInterruptRestoration, BRSERROR_MODULE_BRSHW, (uint16)(__LINE__));
  }

  bBrsHwIntDiCounter--;
  if (bBrsHwIntDiCounter == 0u)
  { /* enable INT again, if zero */
    SCR_IEN0.B.EA = wBrsHwSavedPSW;
  }
}

/*****************************************************************************/
/**
 * @brief      restart ECU (issue a software reset or jump to startup code)
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from e.g. ECU state handling
 */
/*****************************************************************************/
void BrsHwSoftwareResetECU(void)
{
  BrsHwDisableInterrupt();

  /* implement code, necessary for a software reset, here */

  while (1u)
  {
    /* Wait until reset/watchdog reset occurs */
  }
}

/*****************************************************************************/
/**
 * @brief      This API is used for the BRS time measurement support to get a
 *             default time value for all measurements with this platform to
 *             be able to compare time measurements on different dates based
 *             on this time result.
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from TimeMeasurement
 */
/*****************************************************************************/
void BrsHwTime100NOP(void)
{
  BrsHwDisableInterrupt();

  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");
  __asm("NOP");

  BrsHwRestoreInterrupt();
}

/* PRQA L: LABEL_0303 */
