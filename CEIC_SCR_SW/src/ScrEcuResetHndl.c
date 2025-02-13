/*
 * ScrEcuResetHndl.c
 *
 *  Created on: 01.10.2021
 *      Author: vikaagz
 */


/**********************************************************************************************************************
 INCLUDES
 **********************************************************************************************************************/

#include "BrsHw.h"
#include "Ifx_reg.h"
#include "IfxScr_bf.h"
#define DECLARE_SHRMEM_VARIABLES
#include "ScrTricoreIf.h"
#undef DECLARE_SHRMEM_VARIABLES   /* PRQA S 0841 */ /* MD_MSR_Undef */
#include "ScrWakeupEcu.h"
#include "ScrEcuResetHndl.h"

/**********************************************************************************************************************
 DEFINITION + MACROS
 **********************************************************************************************************************/
#define RST_DLY_TIME  200  // Count down this time and than reset PMIC (ECU). RST_DLY_TIME*1ms

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

/*****************************************************************************/
/**
 * @brief      routine for checking the ECU hard reset request from Tricore.
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from e.g. ECU state handling
 */
/*****************************************************************************/
void ScrCheckEcuResetRequest (void)
{
  if (ECUResetReq == ECU_RST_REQ)
  {
    ECUResetReq = ECU_RST_ACK;  // ECUResetReq is shared mem with Tricore, if AA Tricore requests a hardreset, acknowledge it with 55
    ScrResetPmicHandler();
  }
}

/*****************************************************************************/
/**
 * @brief      routine for handling the ECU hard reset request from Tricore.
 * @pre        -
 * @param[in]  -
 * @param[out] -
 * @return     -
 * @context    Function is called from e.g. ECU state handling
 */
/*****************************************************************************/
void ScrEcuResetHndlTask1 (void)
{
  static uint8 RstDlyCnt = 0u;

  ScrCheckEcuResetRequest ();

  // wait until Tricore standby mode is entered
  if (SCR_SCU_SR.B.STBY == 1u)      /* PRQA S 0303 */ /* MD_FBL_0303_MemoryMappedRegAccess */
  {
    if (ECUResetReq == ECU_RST_ACK) // Has Tricore requested a hardreset and SCR acknowledged?
    {
      RstDlyCnt = RST_DLY_TIME;
      ECUResetReq = ECU_RST_DONE;   // Inform Tricore on the next startup, this was a hardreset
    }

    if (RstDlyCnt > 0u)
    {
      if (RstDlyCnt == 1u)
      {
        ScrWupCallback ();
      }
      RstDlyCnt--;
    }
  }
}


