/**
 * \file Ifx_TypesReg.h
 * \brief
 * \copyright Copyright (c) 2020 Infineon Technologies AG. All rights reserved.
 *
 * Version: IFXREGTYPES_SCR_V1.0.R0
 *
 * MAY BE CHANGED BY USER [yes/no]: No
 *
 *                                 IMPORTANT NOTICE
 *
 *
 * Infineon Technologies AG (Infineon) is supplying this file for use
 * exclusively with Infineon's microcontroller products. This file can be freely
 * distributed within development tools that are supporting such microcontroller
 * products.
 *
 * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
 * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
 * INFINEON SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL,
 * OR CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 *
 *
 * Data type access rules for peripheral space
 * data type                               | Allowed access size   | Alignment of address in memory
 * ----------------------------------------|-----------------------|-----------------------------------
 * Ifx_UReg_8Bit, Ifx_SReg_8Bit            | Byte                  | Byte (1H)                         
 * Ifx_UReg_16Bit, Ifx_SReg_16Bit          | Byte, Half-Word       | 2 bytes (2H)                      
 * Ifx_UReg_32Bit, Ifx_SReg_32Bit          | Byte, Half-Word, Word | 4 bytes (4H)                      
 * Ifx_Strict_16Bit                        | Half-Word             | 2 bytes (2H)                      
 * Ifx_Strict_32Bit                        | Word                  | 4 bytes (4H)                      
 *                     
 * 
 * 
 */

#ifndef IFX_TYPESREG_H
#define IFX_TYPESREG_H
/******************************************************************************/

typedef unsigned char  Ifx_UReg_8Bit;
typedef unsigned int Ifx_UReg_16Bit;
typedef unsigned long   Ifx_UReg_32Bit;
typedef signed char    Ifx_SReg_8Bit;
typedef signed int   Ifx_SReg_16Bit;
typedef signed long     Ifx_SReg_32Bit;


/******************************************************************************/
#endif /* IFX_TYPESREG_H */
