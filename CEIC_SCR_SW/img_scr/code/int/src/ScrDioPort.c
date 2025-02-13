/*
 * DioPort.c
 *
 *  Created on: 27.07.2021
 *      Author: vikaagz
 */


/**********************************************************************************************************************
 INCLUDES
 **********************************************************************************************************************/
#include "ScrDioPort.h"
#include "BrsHw.h"
#include "Ifx_reg.h"
#include "IfxScr_bf.h"

/**********************************************************************************************************************
 DEFINITION + MACROS
 **********************************************************************************************************************/

/**********************************************************************************************************************
 GLOBAL VARIABLES
 **********************************************************************************************************************/

/**********************************************************************************************************************
 GLOBAL CONST
 **********************************************************************************************************************/

/**********************************************************************************************************************
 LOCAL VARIABLES & CONST
 **********************************************************************************************************************/

/**********************************************************************************************************************
 PROTOTYPES OF GLOBAL FUNCTIONS
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
 * @brief      Initializes the port input output registers
 * @pre        -
 * @param[in]  -
 *             -
 * @param[out] -
 * @return     -
 * @context    Function is called from state handling
 */
/*****************************************************************************/
void DioPortInit (void)
{
  /* clear output register */
  SCR_IO_PAGE.B.PAGE = 0u;
  SCR_P00_OUT.U = 0u;
  SCR_P01_OUT.U = 0u;

  /* P0.0, P0.2, P0.3, P0.5, P01.3, P01.5, P01.6 output direction*/
  SCR_IO_PAGE.B.PAGE = 1u;
  SCR_P00_IOCR0.U = 0x80u;  // SCR_P00.0 P33.0  W10  Output
  SCR_P00_IOCR1.U = 0x00u;  // SCR_P00.1 P33.1  Y10  Input
  SCR_P00_IOCR2.U = 0x80u;  // SCR_P00.2 P33.2  W11  Output
  SCR_P00_IOCR3.U = 0x80u;  // SCR_P00.3 P33.3  Y11  Output
  SCR_P00_IOCR4.U = 0x00u;  // SCR_P00.4 P33.4  W12  Input
  SCR_P00_IOCR5.U = 0x00u;  /* SCR_P00.5 P33.5  Y12  Input!!!
                                 In general, this is output pin, but it is connected together with
                                   "SCR_P00.5 P33.5" pin of CEIC_C (g12OUT_WAKE1). Thus, the control
                                   is different than the other pins. This one should be:
                                     1. Configured as INPUT on init
                                     2. Dynamically re-configured as OUTPUT, only during pulse generation.
                                     3. Re-configured back as INPUT after the pulse generation completes */
  SCR_P00_IOCR6.U = 0x00u;  // SCR_P00.6 P33.6  W13  Input
  SCR_P00_IOCR7.U = 0x00u;  // SCR_P00.7 P33.7  Y13  Input
  SCR_P01_IOCR0.U = 0x00u;  // SCR_P01.0 P34.1  U11  Input
  SCR_P01_IOCR1.U = 0x00u;  // SCR_P01.1 P33.9  Y14  Input
  SCR_P01_IOCR2.U = 0x00u;  // SCR_P01.2 P33.10   W15  Input
  SCR_P01_IOCR3.U = 0x80u;  // SCR_P01.3 P33.11   Y15  Output
  SCR_P01_IOCR4.U = 0x00u;  // SCR_P01.4 P33.12   W16  Input
  SCR_P01_IOCR5.U = 0x80u;  // SCR_P01.5 P33.13   Y16  Output
  SCR_P01_IOCR6.U = 0x80u;  // SCR_P01.6 P33.14   T14  Output
  SCR_P01_IOCR7.U = 0x00u;  // SCR_P01.7 P33.15   U14  Input

  /* decision register enabled*/
  SCR_IO_PAGE.B.PAGE = 2u;
//  SCR_P00_PDR0.B.PD0 = 3;   // driver mode selections medium
//  SCR_P00_PDR0.B.PL0 = 3;   // driver TTL modes
  SCR_P00_PDISC.U = 0u;    // enable digital input/ouput pads
  SCR_P01_PDISC.U = 0u;

  SCR_IO_PAGE.B.PAGE = 0u;
}

/*****************************************************************************/
/**
 * @brief      routine for set/get port pins to hi/low level.
 * @pre        -
 * @param[in]  -PortNr: port which will manipulate.
 *             -NewState: new level 1 or 0
 * @param[out] -
 * @return     -
 * @context    Function is called from e.g. ECU state handling
 */
/*****************************************************************************/
void DioPortWrite(uint8 PortNr, uint8 NewState)
{
  uint8 tmp, tmp1;

  if((g12OUT_WAKE1 == PortNr) && (0u != NewState))
  {
      //Request to switch on g12OUT_WAKE1 output line HIGH, so first switch port configuration to output
      SCR_IO_PAGE.B.PAGE = 1u;
      SCR_P00_IOCR5.U = 0x80u;  // SCR_P00.5 P33.5  Y12  Output
      SCR_IO_PAGE.B.PAGE = 0u;
  }

  if(PortNr < (uint8)PORT_P10)
  {
    tmp = 1u << PortNr;
    tmp1 = SCR_P00_OUT.U;
    if(NewState == 1u)
    {
      SCR_P00_OUT.U = tmp1 | tmp;
    }
    else
    {
      SCR_P00_OUT.U = tmp1 & (~tmp);
    }
  }
  else
  {
    tmp = 1u << (PortNr - (uint8)PORT_P10);
    tmp1 = SCR_P01_OUT.U;
    if(NewState == 1u)
    {
      SCR_P01_OUT.U = tmp1 | tmp;
    }
    else
    {
      SCR_P01_OUT.U = tmp1 & (~tmp);
    }
  }

  if((g12OUT_WAKE1 == PortNr) && (0u == NewState))
  {
      //Request to switch on g12OUT_WAKE1 output line LOW, so finally switch port configuration to input
      SCR_IO_PAGE.B.PAGE = 1u;
      SCR_P00_IOCR5.U = 0x00u;  // SCR_P00.5 P33.5  Y12  Input
      SCR_IO_PAGE.B.PAGE = 0u;
  }
}


/*****************************************************************************/
/**
 * @brief      Gets the level of given portnumber
 * @pre        -
 * @param[in]  - PortNr: number of the portpin in range PORT_P00...PORT_P17 *
 * @param[out] -
 * @return     - state of the portpin for hi=1 and low=0
 * @context    Function is called from state handling
 */
/*****************************************************************************/
uint8 DioPortRead (uint8 PortNr)
{
  uint8 tmp;
  if(PortNr < (uint8)PORT_P10)
  {
    tmp = SCR_P00_IN.U;
    tmp &= (1u << PortNr);
  }
  else
  {
    tmp = SCR_P01_IN.U;
    tmp &= (1u << (PortNr - (uint8)PORT_P10));
  }

  return tmp > 0u;  /* PRQA S 4404 */ /* MD_MSR_AutosarBoolean */
}

/*****************************************************************************/
/**
 * @brief      Sets the level of given port numbers required for normal operation
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from state handling
 */
/*****************************************************************************/
void SetDioPortsForNormalOperation (void)
{
    DioPortWrite (g1OUT_KL30_FLTR_SCR_AD_EN, 1u);
}

/*****************************************************************************/
/**
 * @brief      Sets the level of given port numbers required for sleep operation
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from state handling
 */
/*****************************************************************************/
void SetDioPortsForSleepOperation (void)
{
    DioPortWrite (g1OUT_KL30_FLTR_SCR_AD_EN, 0u);
}


/* PRQA L: LABEL_0303 */
