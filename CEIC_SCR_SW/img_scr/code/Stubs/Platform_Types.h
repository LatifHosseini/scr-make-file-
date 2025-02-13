/**********************************************************************************************************************
 *  COPYRIGHT
 *  -------------------------------------------------------------------------------------------------------------------
 *  \verbatim
 *  Copyright (c) 2011 by Vector Informatik GmbH.                                              All rights reserved.
 *
 *                This software is copyright protected and proprietary to Vector Informatik GmbH.
 *                Vector Informatik GmbH grants to you only those rights as set out in the license conditions.
 *                All other rights remain with Vector Informatik GmbH.
 *  \endverbatim
 *  -------------------------------------------------------------------------------------------------------------------
 *  FILE DESCRIPTION
 *  -------------------------------------------------------------------------------------------------------------------
 *         File:  Platform_Types.h
 *    Component:  -
 *       Module:  -
 *    Generator:  -
 *
 *  Description:  This file provides the AUTOSAR platform types for Freescale MCS08
 *  
 *  -------------------------------------------------------------------------------------------------------------------
 *  MISRA VIOLATIONS
 *  -------------------------------------------------------------------------------------------------------------------
 *      
 *  
 *********************************************************************************************************************/

/**********************************************************************************************************************
 *  AUTHOR IDENTITY
 *  -------------------------------------------------------------------------------------------------------------------
 *  Name                          Initials      Company
 *  -------------------------------------------------------------------------------------------------------------------
 *  Mihai Olariu                  Ou            Vector Informatik
 *  -------------------------------------------------------------------------------------------------------------------
 *  REVISION HISTORY
 *  -------------------------------------------------------------------------------------------------------------------
 *  Version   Date        Author  Change Id     Description
 *  -------------------------------------------------------------------------------------------------------------------
 *  01.00.00  2011-08-16  Ou                    Creation for MCS08/ Metrowerks
 *********************************************************************************************************************/

#ifndef PLATFORM_TYPES_H
# define PLATFORM_TYPES_H

/**********************************************************************************************************************
 * INCLUDES
 *********************************************************************************************************************/
 
/**********************************************************************************************************************
 *  GLOBAL CONSTANT MACROS
 *********************************************************************************************************************/
/* ##V_CFG_MANAGEMENT ##CQProject : CommonAsr_Mcs08 CQComponent : Impl_PlatformTypes */
# define COMMONASR_MCS08_IMPL_PLATFORMTYPES_VERSION         0x0100u
# define COMMONASR_MCS08_IMPL_PLATFORMTYPES_RELEASE_VERSION 0x00u

# define PLATFORM_VENDOR_ID            30u

/* AUTOSAR Software Specification Document Version Information */
/* part of AUTOSAR Release 3.0                                 */
# define PLATFORM_AR_MAJOR_VERSION     (2u)
# define PLATFORM_AR_MINOR_VERSION     (2u)
# define PLATFORM_AR_PATCH_VERSION     (1u)

/* Component Version Information */
# define PLATFORM_SW_MAJOR_VERSION     (1u)
# define PLATFORM_SW_MINOR_VERSION     (0u)
# define PLATFORM_SW_PATCH_VERSION     (0u) 

# define CPU_TYPE_8                    8
# define CPU_TYPE_16                   16
# define CPU_TYPE_32                   32

# define MSB_FIRST                     0    /* big endian bit ordering */
# define LSB_FIRST                     1    /* little endian bit ordering */

# define HIGH_BYTE_FIRST               0    /* big endian byte ordering */
# define LOW_BYTE_FIRST                1    /* little endian byte ordering */

# ifndef TRUE
#  define TRUE                         1
# endif

# ifndef FALSE
#  define FALSE                        0
# endif

# define CPU_TYPE                      CPU_TYPE_8      /* 8-bit platform */
# define CPU_BIT_ORDER                 MSB_FIRST       /* big endian bit ordering */
# define CPU_BYTE_ORDER                HIGH_BYTE_FIRST /* big endian byte ordering */

/**********************************************************************************************************************
 *  GLOBAL FUNCTION MACROS
 *********************************************************************************************************************/

/**********************************************************************************************************************
 *  GLOBAL DATA TYPES AND STRUCTURES
 *********************************************************************************************************************/
typedef unsigned  char                 boolean;       /*        TRUE .. FALSE           */

typedef signed    char                 sint8;         /*        -128 .. +127            */
typedef unsigned  char                 uint8;         /*           0 .. 255             */
typedef signed    short                sint16;        /*      -32768 .. +32767          */
typedef unsigned  short                uint16;        /*           0 .. 65535           */
typedef signed    long                 sint32;        /* -2147483648 .. +2147483647     */
typedef unsigned  long                 uint32;        /*           0 .. 4294967295      */                                        

typedef signed    char                 sint8_least;   /* at least 7 bit + 1 bit sign    */
typedef unsigned  char                 uint8_least;   /* at least 8 bit                 */
typedef signed    short                sint16_least;  /* at least 15 bit + 1 bit sign   */
typedef unsigned  short                uint16_least;  /* at least 16 bit                */
typedef signed    long                 sint32_least;  /* at least 31 bit + 1 bit sign   */
typedef unsigned  long                 uint32_least;  /* at least 32 bit                */

typedef float                          float32;
typedef double                         float64;

/**********************************************************************************************************************
 *  GLOBAL DATA PROTOTYPES
 *********************************************************************************************************************/

/**********************************************************************************************************************
 *  GLOBAL FUNCTION PROTOTYPES
 *********************************************************************************************************************/

#endif  /* PLATFORM_TYPES_H */

/**********************************************************************************************************************
 *  END OF FILE: Platform_Types.h
 *********************************************************************************************************************/
