
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
  \file  File:  BrsCfg.h
      Project:  Vector Basic Runtime System for MICROSAR4
       Module:  BrsAsrMain

  \brief Description:  Template for generated BrsAsr header, for UseCases w/o Cfg5-generator of BrsAsr4

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
-----------------------------------------------------------------------------------------------------------------------
  REVISION HISTORY
 ----------------------------------------------------------------------------------------------------------------------
  Version   Date        Author  Description
  --------  ----------  ------  ---------------------------------------------------------------------------------------
  01.00.00  2016-12-21  visbwa  Revision history added
**********************************************************************************************************************/

#ifndef INCLUDE_BRSCFG_H_
#define INCLUDE_BRSCFG_H_

/**********************************************************************************************************************
  INCLUDES
**********************************************************************************************************************/
#include "Std_Types.h"

/* necessary for VGEN_ENABLE switches */
#include "VGenEnableSwitches.h"

/* v_def.h maybe necessary, if you are using an old BrsHw implementation. A template for v_def.h is included within this BrsAsr4. */
/*#include "v_def.h"*/

/**********************************************************************************************************************
  GLOBAL CONSTANT MACROS
**********************************************************************************************************************/
#define BASIC_RUNTIME_SYSTEM_TYPE_MSR4

/*******************************************************************************
 Standard BrsAsr configuration
*******************************************************************************/
/* Support of test generator framework */
/*#define BRSASR_ENABLE_TGFSUPPORT*/

/* Use Autosar-OS conform Tasks; disable this, if no OS should be used */
/*#define BRSASR_ENABLE_OSSUPPORT*/

/* Support of OS emulation */
/*#define BRSASR_ENABLE_OSEMULATION*/

/* Use the functionality of a blinking live-LED for the used EvalBoard */
#define BRS_ENABLE_SUPPORT_LEDS

#define BRS_ENABLE_SUPPORT_TOGGLE_WD_PIN
#define BRS_ENABLE_SUPPORT_TOGGLE_CUSTOM_PIN

/* Configure additional Pins for external wakeup functionality within BrsHw, if supported */
/*#define BRS_ENABLE_EXTERNAL_WAKEUP*/

/* Enable Test-Control-Module support */
/*#define BRS_ENABLE_TCM_SUPPORT*/

/* Enable HLP-Testsuite support */
/*#define BRS_ENABLE_HLPTEST_SUPPORT*/

/* Enable TestFramework of module zCantate_TFW support */
/*#define BRSASR_ENABLE_TFW_SUPPORT*/

/* Enable FlashBootLoader support */
/*#define BRS_ENABLE_FBL_SUPPORT*/

/*******************************************************************************
 Additional BrsAsr support features
*******************************************************************************/
/* Switch to enable support of SafeContext OS */
/*#define BRSASR_ENABLE_SAFECTXSUPPORT*/

/* Switch to enable support of MCALs that can not be initialized in non-trusted OS-Application*/
/*#define BRSASR_ENABLE_MCAL_TRUSTED_ONLY*/

/* Switch to enable support of MultiCore OS */
/*#define BRSASR_ENABLE_OS_MULTICORESUPPORT*/

/* Switch to enable support of SafeWatchdog Stack */
/*#define BRSASR_ENABLE_SAFEWDGSUPPORT*/

/* Switch to enable support of MultiCore SafeWatchdog Stack */
/*#define BRSASR_ENABLE_SAFEWDG_MULTICORESUPPORT*/

#endif /*INCLUDE_BRSCFG_H_*/

