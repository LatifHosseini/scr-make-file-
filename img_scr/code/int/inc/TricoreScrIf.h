/**********************************************************************************************************************
 *  COPYRIGHT
 *  -------------------------------------------------------------------------------------------------------------------
 *  \verbatim
 *  Copyright (c) 2021 by Vector Informatik GmbH.                                              All rights reserved.
 *
 *                This software is copyright protected and proprietary to Vector Informatik GmbH.
 *                Vector Informatik GmbH grants to you only those rights as set out in the license conditions.
 *                All other rights remain with Vector Informatik GmbH.
 *  \endverbatim
 *  -------------------------------------------------------------------------------------------------------------------
 *  FILE DESCRIPTION
 *  -------------------------------------------------------------------------------------------------------------------
 *         File:  TricoreScrIf.h
 *    Component:  -
 *       Module:  -
 *    Generator:  -
 *
 *  Description:  Interface definitions for communication between Tricore and SCR
 *
 *********************************************************************************************************************/

/**********************************************************************************************************************
 *  REVISION HISTORY
 *  -------------------------------------------------------------------------------------------------------------------
 *  Version   Date        Author  Change Id     Description
 *  -------------------------------------------------------------------------------------------------------------------
 *  01.00.00  2021-06-02  vikaagz               Initial creation
*********************************************************************************************************************/

#ifndef TRICORESCRIF_H
#define TRICORESCRIF_H

/**********************************************************************************************************************
 * INCLUDES
 *********************************************************************************************************************/

/**********************************************************************************************************************
 *  GLOBAL CONSTANT MACROS
 *********************************************************************************************************************/
#define TRICORE_RESERVED_SIZE   (16u + (18u * 5u) + 2u) /* Size to match definition in CompTricoreScrIf.h */
typedef union {
  uint8 Reserved[TRICORE_RESERVED_SIZE];
  // Other members of union are defined in TriCore
} TriCoreXRAMDataType;
 
/* If you declare new variables keep in mind that word variables must be aligned, means don't use odd addresses for word*/
/* Tricore uses little endian mechanism differently to SCR. SCR uses big endian mechanism. Swap the bytes on Tricore side
 * if you read/write the word variable */
#ifdef DECLARE_SHRMEM_VARIABLES
DECLARE_SHRMEM(ECUResetReq, uint8, 100);
DECLARE_SHRMEM(WUL2Wakeup, uint8, 101);
DECLARE_SHRMEM(WUL1Wakeup, uint8, 102);
DECLARE_SHRMEM(FirstWakeup, uint8, 103);
DECLARE_SHRMEM(GenerateWakeup, uint8, 104);
DECLARE_SHRMEM(WUL1LineStatus, uint8, 105);
DECLARE_SHRMEM(WUL2LineStatus, uint8, 106);
DECLARE_SHRMEM(WUL1CntBad, uint8, 107);
DECLARE_SHRMEM(WUL2CntBad, uint8, 108);
DECLARE_SHRMEM(unused, uint8, 109);
DECLARE_SHRMEM(WUL1CntGood, uint16, 10a); // even address
DECLARE_SHRMEM(WUL2CntGood, uint16, 10c); // even address
DECLARE_SHRMEM(WULSignalLogicLevels, uint8, 10e);
DECLARE_SHRMEM(ADCcircuitDTC, uint8, 10f);
DECLARE_SHRMEM(ScrAliveCounter, uint8, 110);
DECLARE_SHRMEM(GenWULPulseDiag, uint8, 111);
DECLARE_SHRMEM(unused2, uint8, 112);
DECLARE_SHRMEM(WULOperationCondition, boolean, 113);
DECLARE_SHRMEM(TriCoreXRAMData, TriCoreXRAMDataType, 114); // Reserve 16 bytes in XRAM for TriCore internal use, align to 4 bytes
#else
extern uint8 ECUResetReq;
extern uint8 WUL2Wakeup;
extern uint8 WUL1Wakeup;
extern uint8 FirstWakeup;
extern uint8 GenerateWakeup;
extern uint8 WUL1LineStatus;
extern uint8 WUL2LineStatus;
extern uint8 WUL1CntBad;
extern uint8 WUL2CntBad;
extern uint16 WUL1CntGood;
extern uint16 WUL2CntGood;
extern uint8 WULSignalLogicLevels;
extern uint8 ADCcircuitDTC;
extern uint8 ScrAliveCounter;
extern uint8 GenWULPulseDiag;
extern boolean WULOperationCondition;
#endif
/**********************************************************************************************************************
 *  GLOBAL FUNCTION MACROS
 *********************************************************************************************************************/

/**********************************************************************************************************************
 *  GLOBAL DATA TYPES AND STRUCTURES
 *********************************************************************************************************************/
// Flags for communication btw Tricore<->SCR:
// ECUResetReq handling:
#define ECU_RST_REQ   0xAAu   //Tricore requests hardreset from SCR
#define ECU_RST_ACK   0x55u   //SCR confirms the hardreset-request from the Triore
#define ECU_RST_DONE  0xCCu   //SCR has done the ECU hardreset

// Eth wakeup (WUL1Wakeup, WUL2Wakeup) handling:
#define ETH_WAK_FLAG  0xAAu   //SCR is setting this value if its detecting EthX-wakeup

// FirstWakeup who woke up the system:
typedef enum
{
  EMPTY = 0u,
  BODY1,          // CAN0
  BODY2,          // CAN1
  BODY3,          // CAN2
  BODY4,          // CAN3
  PERIPHERY2,     // CAN4
  RESERVED1,      // CAN5
  PERIPHERY,      // CAN6
  HU1,            // CAN8
  HU2,            // CAN9
  ETH_WUL1,
  ETH_WUL2,
  LIN,
  FR
} WakeupSrc;

// GenerateWakeup: write following bytes to let generate SCR the wakeup pattern on the according line
#define GenSinglePulseWULxDiag   0x77u   // RID 0x025A Generate Wake up Line Pulse => Single pulse should be generated on WULx (x: WUL1 or WUL2 or WULBoth, depending on CEIC variant)
#define GenPermanentDiagHighAllWUL  0x99u   // DID 0x168 Ethernet Wake-up Line Activation => The Wakeup lines shall be set to permanent high level
#define GenWUL1   0xAAu   //SCR generates wakeup pattern on line 1
#define GenWUL2   0xBBu   //SCR generates wakeup pattern on line 2
#define GenBothWUL   0xCCu   //SCR generates wakeup pattern on line 1&2
#define GenBothWULAndTriggerSwitch 0x88u //SCR generates wakeup pattern on line 1&2 and triggers Switch to activate all ports
#define GenKeepSwitchAwake 0xDDu // SCR keeps switch awake
#define GenKeepSwitchAwakeOff 0xEEu // SCR keeps switch awake off

// WUL1LineStatus and WUL2LineStatus: status of short circuit line
#define ShortGND  0x11u    //Eth WUL line is short to GND
#define ShortUBAT 0x22u    //Eth WUL line is short to UBat
#define ShortWUL  0x33u    //Eth WUL1 and WUL2 line is short

// ADCcircuitDTC, measurement unit status
#define ADCdefectiv 0x12u  //Measurement circuit has a failure
#define UBatNotInRange  0x21u  //UBat is not in range 6v-16v

/**********************************************************************************************************************
 *  GLOBAL DATA PROTOTYPES
 *********************************************************************************************************************/

/**********************************************************************************************************************
 *  GLOBAL FUNCTION PROTOTYPES
 *********************************************************************************************************************/


#endif /* TRICORESCRIF_H */

/**********************************************************************************************************************
 *  END OF FILE: TricoreScrIf.h.h
 *********************************************************************************************************************/
