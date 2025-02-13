/*
 * DioPort.h
 *
 *  Created on: 27.07.2021
 *      Author: vikaagz
 */

#ifndef INCLUDE_DIOPORT_H_
#define INCLUDE_DIOPORT_H_

#include "Std_Types.h"


enum
{
  PORT_P00 = 0,
  PORT_P01,
  PORT_P02,
  PORT_P03,
  PORT_P04,
  PORT_P05,
  PORT_P06,
  PORT_P07,
  PORT_P10,
  PORT_P11,
  PORT_P12,
  PORT_P13,
  PORT_P14,
  PORT_P15,
  PORT_P16,
  PORT_P17
};

#define  g1OUT_PMIC1_WAKE     PORT_P00  // P33.0-> pin name on Tricore side
#define  g1IN_MUX_OUT         PORT_P01  // P33.1
#define  g1OUT_KL30_FLTR_SCR_AD_EN  PORT_P02  // P33.2
#define  g1OUT_MUX_SEL0       PORT_P03  // P33.3
#define  g1AD_KL30_FLTR_SCR   PORT_P04  // P33.4
#define  g12OUT_WAKE1         PORT_P05  // P33.5
#define  g1IN_CAN5_WAKE       PORT_P06  // P33.6
#define  not_connected0       PORT_P07  // P33.7

#define  WAKE_CAN_LIN_FLR_PMIC1     PORT_P10  // P34.1
#define  g1IN_WAKE2           PORT_P11  // P33.9
#define  g12IN_WAKE1          PORT_P12  // P33.10
#define  g1OUT_WAKE2          PORT_P13  // P33.11
#define  g1IN_LIN_WAKE        PORT_P14  // P33.12
#define  g1OUT_MUX_SEL1       PORT_P15  // P33.13
#define  g1OUT_MUX_SEL2       PORT_P16  // P33.14
#define  g1IN_FLR_WAKE        PORT_P17  // P33.15


/*****************************************************************************/
/**
 * @brief      Initialzes the port input output registers
 * @pre        -
 * @param[in]  -
 *             -
 * @param[out] -
 * @return     -
 * @context    Function is called from state handling
 */
/*****************************************************************************/
void DioPortInit (void);


/*****************************************************************************/
/**
 * @brief      Sets or cleares the given portnumber to hi or low
 * @pre        -
 * @param[in]  - PortNr: number of the portpin in range PORT_P00...PORT_P17
 *             - NewState: state of the portpin for hi=1 and low=0
 * @param[out] -
 * @return     -
 * @context    Function is called from state handling
 */
/*****************************************************************************/
void DioPortWrite (uint8 PortNr, uint8 NewState);


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
uint8 DioPortRead (uint8 PortNr);

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
void SetDioPortsForNormalOperation (void);

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
void SetDioPortsForSleepOperation (void);

#endif /* INCLUDE_DIOPORT_H_ */
