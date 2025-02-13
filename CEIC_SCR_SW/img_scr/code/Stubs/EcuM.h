
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
  \file  File:  EcuM.h
      Project:  Vector Basic Runtime System for MICROSAR4
       Module:  BrsAsr@Impl_Stubs

  \brief Description:  Stub of EcuM, to support simple projects w/o Ecu state handling.

  \attention Please note:
    The demo and example programs only show special aspects of the software. With regard to the fact
    that these programs are meant for demonstration purposes only, Vector Informatik liability shall be
    expressly excluded in cases of ordinary negligence, to the extent admissible by law or statute.
**********************************************************************************************************************/

#ifndef INCLUDE_ECUM_H_
#define INCLUDE_ECUM_H_

/**********************************************************************************************************************
  GLOBAL CONSTANT MACROS
**********************************************************************************************************************/
#define ECUM_CORE_ID_MASTER OS_CORE_ID_MASTER
#define ECUM_CORE_ID_STARTUP ECUM_CORE_ID_MASTER

/**********************************************************************************************************************
  GLOBAL FUNCTION PROTOTYPES
**********************************************************************************************************************/
void EcuM_Init(void);
void EcuM_StartupTwo(void);
void EcuM_Shutdown(void);

#endif /*INCLUDE_ECUM_H_*/

