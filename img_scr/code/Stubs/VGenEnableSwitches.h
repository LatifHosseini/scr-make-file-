/**********************************************************************************************************************
  COPYRIGHT
-----------------------------------------------------------------------------------------------------------------------
  \par      copyright
  \verbatim
  Copyright (c) 2015 by Vector Informatik GmbH.                                                  All rights reserved.

                This software is copyright protected and proprietary to Vector Informatik GmbH.
                Vector Informatik GmbH grants to you only those rights as set out in the license conditions.
                All other rights remain with Vector Informatik GmbH.
  \endverbatim
-----------------------------------------------------------------------------------------------------------------------
  FILE DESCRIPTION
-----------------------------------------------------------------------------------------------------------------------
  \file  File:  VGenEnableSwitches.h
      Project:  Vector Basic Runtime System for MICROSAR4
       Module:  BrsAsrInit
    Generator:  -

  \brief Description:  ALM-filtered header to provide project specific VGEN_ENABLE-switches
                         (used by BrsAsrInit_InitMemory() and BrsHw)
  
  \attention Please note:
    The demo and example programs only show special aspects of the software. With regard to the fact
    that these programs are meant for demonstration purposes only, Vector Informatik liability shall be
    expressly excluded in cases of ordinary negligence, to the extent admissible by law or statute.
**********************************************************************************************************************/

#ifndef INCLUDE_VGENENABLESWITCHES_H_
#define INCLUDE_VGENENABLESWITCHES_H_

/* #define VGEN_ENABLE_CCL_ASR4COMM */

/*******************/
/*** CAN modules ***/
/*******************/
//#define VGEN_ENABLE_CAN_DRV

//#define VGEN_ENABLE_IF_ASRIFCAN

/* #define VGEN_ENABLE_CCL_ASR4SMCAN */

/*******************/
/*** LIN modules ***/
/*******************/
//#define VGEN_ENABLE_LIN_DRV

//#define VGEN_ENABLE_IF_ASRIFLIN

/***********************/
/*** FlexRay modules ***/
/***********************/
/* #define VGEN_ENABLE_DRVFR__BASEASR */

/************************/
/*** Ethernet modules ***/
/************************/
/* #define VGEN_ENABLE_DRVETH__BASEASR */

/**********************/
/*** Memory modules ***/
/**********************/
/* #define VGEN_ENABLE_IF_ASRIFFEE */

/* #define VGEN_ENABLE_IF_ASRIFEA */

/* #define VGEN_ENABLE_DRVEEP_30_AT25128 */

/* #define VGEN_ENABLE_MEMSERVICE_ASRNVM */

/********************/
/*** MCAL modules ***/
/********************/
/* #define VGEN_ENABLE_DRVADC */
/* #define VGEN_ENABLE_DRVDIO */
/* #define VGEN_ENABLE_DRVEEP */
/* #define VGEN_ENABLE_IF_ASRIFFEE */
/* #define VGEN_ENABLE_DRVFLS */
/* #define VGEN_ENABLE_DRVGPT */
/* #define VGEN_ENABLE_DRVI2C */
/* #define VGEN_ENABLE_DRVICU */
/* #define VGEN_ENABLE_DRVMCU */
/* #define VGEN_ENABLE_DRVPORT */
/* #define VGEN_ENABLE_DRVPWM */
/* #define VGEN_ENABLE_DRVSPI */
/* #define VGEN_ENABLE_DRVWD */

#endif /*INCLUDE_VGENENABLESWITCHES_H_*/
