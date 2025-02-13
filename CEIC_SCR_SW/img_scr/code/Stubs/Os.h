
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
  \file  File:  Os.h
      Project:  Vector Basic Runtime System for MICROSAR4
       Module:  BrsAsr@Impl_Stubs

  \brief Description:  Stub of Os, to support simple projects w/o OS.

  \attention Please note:
    The demo and example programs only show special aspects of the software. With regard to the fact
    that these programs are meant for demonstration purposes only, Vector Informatik liability shall be
    expressly excluded in cases of ordinary negligence, to the extent admissible by law or statute.
**********************************************************************************************************************/

#ifndef INCLUDE_OS_H_
#define INCLUDE_OS_H_

/**********************************************************************************************************************
  INCLUDES
**********************************************************************************************************************/
#include "BrsHw.h"

/**********************************************************************************************************************
  GLOBAL CONSTANT MACROS
**********************************************************************************************************************/
#define OSDEFAULTAPPMODE 0x01

#define OS_AR_RELEASE_MAJOR_VERSION    4
#define OS_AR_RELEASE_MINOR_VERSION    0
#define OS_AR_RELEASE_REVISION_VERSION 3

/* Switch for other BrsAsr4 modules to react on OS Stub usage */
#define BRSASR_ENABLE_OS_STUB

/**********************************************************************************************************************
  GLOBAL DATA PROTOTYPES
**********************************************************************************************************************/
typedef uint8 AppModeType;

/* OS ID Type */
typedef uint8 CounterType;

/* OS Tick reference type */
typedef uint32 TickType;

/* Type to manage triggered events per task. */
typedef unsigned long long EventMaskType;

extern AppModeType OsAppMode;

extern CounterType Rte_Al_TE2_OsTask_0_255ms;
extern CounterType Rte_Al_TE2_Default_BSW_Async_Task_0_10ms;

/**********************************************************************************************************************
  GLOBAL FUNCTION MACROS
**********************************************************************************************************************/

/* PRQA S 0342 3 */ /* MD_MSR_Rule20.10_0342 */
#define ISR(name) void name##func(void)
#define TASK(name) void name##func(void)

#define TerminateTask()                                                                         \
    0; /* Support calls like (void)WaitEvent(SomeEvent); */                                     \
    {                                                                                           \
        return; /* Return out of TASK(...) { ... } block. (Jump back to the scheduler loop.) */ \
    }
    
#define SuspendAllInterrupts()  BrsHwDisableInterrupt()
#define ResumeAllInterrupts()   BrsHwRestoreInterrupt()

#define DisableAllInterrupts()  BrsHwDisableInterrupt()
#define EnableAllInterrupts()   BrsHwRestoreInterrupt()

/**********************************************************************************************************************
  GLOBAL FUNCTION PROTOTYPES
**********************************************************************************************************************/
/* Additional stubs for OsCoreGen7 environments */
void Os_InitMemory(void);
void Os_Init(void);

void osInitialize(void);
void Schedule(void);
void StartOS(uint8 appMode);

/* Additional stub used within EcuM_Callout_Stubs.c */
void ShutdownOS(Std_ReturnType ErrCode);

/* Additional stubs for RTE [Schm_Init() / Schm_DeInit()] */
void SetRelAlarm(CounterType counter, TickType ticktype1, TickType ticktype2);
void CancelAlarm(CounterType counter);

#endif /*INCLUDE_OS_H_*/

