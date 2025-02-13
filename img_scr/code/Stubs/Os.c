
/**********************************************************************************************************************
  COPYRIGHT
-----------------------------------------------------------------------------------------------------------------------
  \par      copyright
  \verbatim
  Copyright (c) 2018 by Vector Informatik GmbH.                                                  All rights reserved.

                This software is copyright protected and proprietary to Vector Informatik GmbH.
                Vector Informatik GmbH grants to you only those rights as set out in the license conditions.
                All other rights remain with Vector Informatik GmbH.
  \endverbatim
-----------------------------------------------------------------------------------------------------------------------
  FILE DESCRIPTION
-----------------------------------------------------------------------------------------------------------------------
  \file  File:  Os.c
      Project:  Vector Basic Runtime System for MICROSAR4
       Module:  BrsAsr@Impl_Stubs

  \brief Description:  Stub of Os, to support simple projects w/o OS.

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
  Andreas Hahn                  vishan        Vector Informatik GmbH
-----------------------------------------------------------------------------------------------------------------------
  REVISION HISTORY
 ----------------------------------------------------------------------------------------------------------------------
  Version   Date        Author  Description
  --------  ----------  ------  ---------------------------------------------------------------------------------------
  01.00.00  2014-10-21  visbwa  Initial creation
  01.00.01  2015-02-08  visbwa  Added OS_MS2TICKS_SystemTimer
  01.00.02  2015-03-24  visbwa  Added macro ISR
  01.00.03  2016-09-12  vishan  Added OS GEN7 stubs
  01.00.04  2016-10-14  visbwa  Added sample code comment
  01.00.05  2017-05-23  visbwa  Optimized include sequence
  01.00.06  2017-09-06  visbwa  Added several function stubs to support UseCases with RTE and EcuM
  01.00.07  2017-09-25  visbwa  Added Rte_Al_TE2_Default_BSW_Async_Task_0_10ms for usage with Vita
  01.00.08  2017-10-04  visbwa  Renamed InitTask to Default_Init_Task (same naming as StartApplication),
                                added call of BrsAsrMainTaskfunc() for UseCase with EcuM,
                                added empty implementation of osInitialize() and Schedule()
  01.00.09  2017-10-24  visbwa  Added extern declaration of Default_Init_Taskfunc() to prevent compiler warnings
  01.01.00  2017-10-25  visbwa  Removed encapsulation of BrsAsrMainTaskfunc() call within StartOS(),
                                added definition of BRSASR_ENABLE_OS_STUB within Os.h
  01.01.01  2018-01-03  visbwa  Added stubs for DisableAllInterrupts() and EnableAllInterrupts() within Os.h
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
#include "Os.h"

#include "BrsAsrMain.h"

/**********************************************************************************************************************
  GLOBAL DATA
**********************************************************************************************************************/
/* OsAppMode needed in EcuM.c for EcuM_StartOS() */
AppModeType OsAppMode = OSDEFAULTAPPMODE;

/* Rte_Al_TE2_OsTask_0_255ms needed by RTE */
CounterType Rte_Al_TE2_OsTask_0_255ms = 1;
CounterType Rte_Al_TE2_Default_BSW_Async_Task_0_10ms = 2;

/**********************************************************************************************************************
  PROTOTYPES OF GLOBAL FUNCTIONS
**********************************************************************************************************************/


/**********************************************************************************************************************
  FUNCTION DEFINITIONS
**********************************************************************************************************************/
/* Additional stubs for OsCoreGen7 environments */
void Os_InitMemory(void)
{}

void Os_Init(void)
{}

/* Additional stub used within EcuM_Callout_Stubs.c */
void ShutdownOS(Std_ReturnType ErrCode)
{
  ErrCode = ErrCode;  /* PRQA S 3112, 1338, 2983 */ /* MD_MSR_DummyStmt */
}

/* Additional stubs for RTE [Schm_Init() / Schm_DeInit()] */
void SetRelAlarm(CounterType counter, TickType ticktype1, TickType ticktype2)
{
  counter = counter;    /* PRQA S 3112, 1338, 2983 */ /* MD_MSR_DummyStmt */
  ticktype1 = ticktype1;  /* PRQA S 3112, 1338, 2983 */ /* MD_MSR_DummyStmt */
  ticktype2 = ticktype2;  /* PRQA S 3112, 1338, 2983 */ /* MD_MSR_DummyStmt */
}

void CancelAlarm(CounterType counter)
{
  counter = counter;  /* PRQA S 3112, 1338, 2983 */ /* MD_MSR_DummyStmt */
}

void osInitialize(void)
{}

void Schedule(void)
{}

void StartOS(uint8 appMode)
{
  /** Enable the interrupt now for the first time. All hardware should be successfully
  *  initialized here. */
  appMode = appMode;  /* PRQA S 3112, 1338, 2983 */ /* MD_MSR_DummyStmt */
  BrsHwEnableInterruptAtPowerOn();

  Default_Init_Taskfunc();

  BrsAsrMainTaskfunc();
}

