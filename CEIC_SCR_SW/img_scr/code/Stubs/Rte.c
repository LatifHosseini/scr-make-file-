
/**********************************************************************************************************************
  COPYRIGHT
-----------------------------------------------------------------------------------------------------------------------
  \par      copyright
  \verbatim
  Copyright (c) 2017 by Vector Informatik GmbH.                                                  All rights reserved.

                This software is copyright protected and proprietary to Vector Informatik GmbH.
                Vector Informatik GmbH grants to you only those rights as set out in the license conditions.
                All other rights remain with Vector Informatik GmbH.
  \endverbatim
-----------------------------------------------------------------------------------------------------------------------
  FILE DESCRIPTION
-----------------------------------------------------------------------------------------------------------------------
  \file  File:  Rte.c
      Project:  Vector Basic Runtime System for MICROSAR4
       Module:  BrsAsr@Impl_Stubs

  \brief Description:  Stub of Rte, to support simple projects w/o Rte/SchM.

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
  01.00.00  2014-10-21  visbwa  Initial creation
  01.00.01  2014-10-29  visbwa  encapsulated call of  mainTaskfunc().
  01.00.02  2015-03-30  visbwa  Added SchMTask implementation
  01.00.03  2016-05-24  visbwa  Fixed SchMTask, added ActivateTask to Rte_Start()
  01.00.04  2017-03-06  visbwa  Fixed used event within SchMTask
  01.00.05  2017-05-23  visbwa  Optimized include sequence
  01.00.06  2017-10-04  visbwa  Renamed mainTask into BrsAsrMainTask
**********************************************************************************************************************/

/**********************************************************************************************************************
*  SAMPLE CODE ONLY
*  -------------------------------------------------------------------------------------------------------------------
*  This implementation is sample code and only intended to illustrate an example of a possible BSW implementation.
*  The implementation may not be complete and is not provided for use in production
*  without any modifications. If this sample code is used in any way, the customer shall test
*  this implementation as well as any of its modifications with diligent care.
*********************************************************************************************************************/

/**********************************************************************************************************************
  INCLUDES
**********************************************************************************************************************/
/*
 * Description: The BrsCfg header provides all the necessary configuration switches of the BrsAsr4.
 *              It is either a template file or generated out of Configurator 5.
 */
#include "BrsCfg.h"

#include "Rte_Main.h"
#include "BrsAsrMain.h"

/**********************************************************************************************************************
  FUNCTION DEFINITIONS
**********************************************************************************************************************/
void SchM_Init(void)
{
  /* nothing to be done here yet */
}

void Rte_Start(void)
{
#if defined (BRSASR_ENABLE_OSSUPPORT)
  (void)ActivateTask(SchMTask);

#else
# if defined (BRS_ENABLE_SUPPORT_LEDS)
  /* just call the BrsAsrMain mainTask */
  BrsAsrMainTaskfunc();
# else
  SchMTaskfunc();
# endif
#endif /*else BRSASR_ENABLE_OSSUPPORT*/
}

/***********************************************************************************************************************
 *  SchMTask
 **********************************************************************************************************************/
/*! \brief      SchMTask executes the 1 millisecond handler if an operating system is used
 *              Feel free to enter MainFunction-calls according to your needs.
 *              
 *  \param[in]  -
 *  \param[out] -
 *  \return     -
 *  \context    The task is started once by the OS and activated by the OS event EvCyclicAlarm_1ms
 **********************************************************************************************************************/
TASK(SchMTask)
{
#if defined (BRSASR_ENABLE_OSSUPPORT)
  EventMaskType ev;

  (void)SetRelAlarm(SchMAlarm_1ms, OS_MS2TICKS_SystemTimer(1), OS_MS2TICKS_SystemTimer(1));
#endif /*BRSASR_ENABLE_OSSUPPORT*/

  for(;;)
  {
#if defined (BRSASR_ENABLE_OSSUPPORT)
    (void)WaitEvent(EvSchMAlarm_1ms);
    (void)GetEvent(SchMTask, &ev);
    (void)ClearEvent(ev);
    if(ev & EvSchMAlarm_1ms)
    {
#else
    if (gbBrsMainIsrMilliSecondFlag > 0u)
    {
      gbBrsMainIsrMilliSecondFlag = 0u;
#endif /*BRSASR_ENABLE_OSSUPPORT*/
    }
  }
}
