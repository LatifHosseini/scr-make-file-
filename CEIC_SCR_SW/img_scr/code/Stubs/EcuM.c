
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
  \file  File:  EcuM.c
      Project:  Vector Basic Runtime System for MICROSAR4
       Module:  BrsAsr@Impl_Stubs

  \brief Description:  Stub of EcuM, to support simple projects w/o Ecu state handling.

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
  01.00.00  2014-10-08  visbwa  Initial creation with basic support for MCAL/OS PreIntegrations
  01.00.01  2015-04-08  visbwa  Added support of BRSASR_ENABLE_MCAL_TRUSTED_ONLY and DrvDio
  01.00.02  2015-10-09  visbwa  Removed call of BrsAsrInit_InitMemory()
  01.00.03  2016-05-24  visbwa  Introduced support for Os_CoreGen7
  01.01.00  2016-12-21  visbwa  Reworked revision header according to Brs_Template 2.00.03
  01.01.01  2017-01-09  visbwa  Added missing include of Dio.h
  01.01.02  2017-03-06  visbwa  Fixed Os_CoreGen7 support (Os_InitMemory and Os_Init called previously within main()),
                                introduced EcuM_StartOS() with a simple MultiCore support
  01.01.03  2017-05-23  visbwa  Renamed ECUMSTUB_OS-MASTERCORE-ID by ECUMSTUB_CORE_ID_STARTUP and
                                ECUMSTUB_OS-NO-OF-CORES by ECUMSTUB_NUMBER_OF_CORES (problems with some compilers),
                                changed default call of Mcu_InitClock() for RH850, optimized include sequence
  01.01.04  2017-06-26  visbwa  Added ECUM_CORE_ID_STARTUP
  01.01.05  2017-08-02  visbwa  Updated call of Det_Init (Det_Config_Ptr)
  01.01.06  2018-01-03  visbwa  Added call of BrsHw_EnableHwAccess() for MemoryProtection OS support
**********************************************************************************************************************/

/**********************************************************************************************************************
*  EXAMPLE CODE ONLY
*  -------------------------------------------------------------------------------------------------------------------
*  This Example Code is only intended for illustrating an example of a possible BSW integration and BSW configuration.
*  The Example Code has not passed any quality control measures and may be incomplete. The Example Code is neither
*  intended nor qualified for use in series production. The Example Code as well as any of its modifications and/or
*  implementations must be tested with diligent care and must comply with all quality requirements which are necessary
*  according to the state of the art before their use.
*********************************************************************************************************************/

/**********************************************************************************************************************
  INCLUDES
**********************************************************************************************************************/
/*
 * Description: The BrsCfg header provides all the necessary configuration switches of the BrsAsr4.
 *              It is either a template file or generated out of Configurator 5.
 */
#include "BrsCfg.h"

#include "EcuM.h"
#include "Os.h"
#include "Rte_Main.h"

#if defined (VGEN_ENABLE_SYSSERVICE_ASRDET)
  #include "Det.h"
#endif
#if defined (VGEN_ENABLE_DRVMCU)
  #include "Mcu.h"
#endif
#if defined (BRSASR_ENABLE_SAFECTXSUPPORT)
  #include "BrsHw.h"
#endif
#if defined (VGEN_ENABLE_DRVWD)
  #include "Wdg.h"
#endif
#if defined (VGEN_ENABLE_DRVPORT)
  #include "Port.h"
#endif
# if defined (VGEN_ENABLE_DRVDIO)
  #include "Dio.h"
# endif
#if defined (VGEN_ENABLE_DRVGPT)
  #include "Gpt.h"
#endif
#if defined (VGEN_ENABLE_DRVADC)
  #include "Adc.h"
#endif
#  if defined (VGEN_ENABLE_DRVICU)
  #include "Icu.h"
#endif
#if defined (VGEN_ENABLE_DRVPWM)
  #include "Pwm.h"
#endif
#if defined (VGEN_ENABLE_DRVSPI)
  #include "Spi.h"
#endif
#if defined (VGEN_ENABLE_DRVFLS)
  #include "Fls.h"
#endif
#if defined (VGEN_ENABLE_IF_ASRIFFEE)
  #include "Fee.h"
#endif

/**********************************************************************************************************************
  DEFINITION + MACROS
**********************************************************************************************************************/
#if defined (BRSASR_ENABLE_OS_MULTICORESUPPORT)
  #error "Please configure here your OS MultiCore configuration"

  /* set the valid Core-ID of the Master-Boot-Core */
  #define ECUMSTUB_CORE_ID_STARTUP (uint8)0

  /* set the valid number of Cores */
  #define ECUMSTUB_NUMBER_OF_CORES (uint8)3
#endif

/**********************************************************************************************************************
  PROTOTYPES OF LOCAL FUNCTIONS
**********************************************************************************************************************/
void EcuM_StartOS(AppModeType appMode);

/**********************************************************************************************************************
  FUNCTION DEFINITIONS
**********************************************************************************************************************/
void EcuM_Init(void)
{
#if defined (VGEN_ENABLE_SYSSERVICE_ASRDET)
  Det_Init(Det_Config_Ptr);
  Det_Start();
#endif

#if defined (VGEN_ENABLE_DRVMCU)
  Mcu_Init(Mcu_ConfigRoot);

# if defined (BRS_PLATFORM_RH850)
  /* Clock settings for RH850 are 1-based, not 0-based */
  Mcu_InitClock(1);
# else
  Mcu_InitClock(0);
# endif

  while (MCU_PLL_LOCKED != Mcu_GetPllStatus());
  Mcu_DistributePllClock();
#endif

#if defined (VGEN_ENABLE_DRVWD)
  Wdg_Init(Wdg_ConfigRoot);
#endif

#if defined (VGEN_ENABLE_DRVPORT)
  Port_Init(Port_ConfigRoot);
#endif

#if defined (BRSASR_ENABLE_SAFECTXSUPPORT)
  BrsHw_EnableHwAccess();
#endif

#if defined (BRSASR_ENABLE_MCAL_TRUSTED_ONLY)
# if defined (VGEN_ENABLE_DRVDIO)
  Dio_Init(Dio_ConfigRoot);
# endif

# if defined (VGEN_ENABLE_DRVGPT)
  Gpt_Init(Gpt_ConfigRoot);
# endif

# if defined (VGEN_ENABLE_DRVADC)
  Adc_Init(Adc_ConfigRoot);
# endif

# if defined (VGEN_ENABLE_DRVICU)
  Icu_Init(Icu_ConfigRoot);
# endif

# if defined (VGEN_ENABLE_DRVPWM)
  Pwm_Init(Pwm_ConfigRoot);
# endif

# if defined (VGEN_ENABLE_DRVFLS)
  Fls_Init(Fls_17_Pmu_ConfigRoot);
# endif

# if defined (VGEN_ENABLE_IF_ASRIFFEE)
  Fee_Init();
# endif

# if defined (VGEN_ENABLE_DRVSPI)
  Spi_Init(Spi_ConfigRoot);
# endif
#endif /*BRSASR_ENABLE_MCAL_TRUSTED_ONLY*/

  EcuM_StartOS(OSDEFAULTAPPMODE);
}

void EcuM_StartupTwo(void)
{
  SchM_Init();

#if !defined (BRSASR_ENABLE_MCAL_TRUSTED_ONLY)
# if defined (VGEN_ENABLE_DRVDIO)
  Dio_Init(Dio_ConfigRoot);
# endif

# if defined (VGEN_ENABLE_DRVGPT)
  Gpt_Init(Gpt_ConfigRoot);
# endif

# if defined (VGEN_ENABLE_DRVADC)
  Adc_Init(Adc_ConfigRoot);
# endif

# if defined (VGEN_ENABLE_DRVICU)
  Icu_Init(Icu_ConfigRoot);
# endif

# if defined (VGEN_ENABLE_DRVPWM)
  Pwm_Init(Pwm_ConfigRoot);
# endif

# if defined (VGEN_ENABLE_DRVFLS)
  Fls_Init(Fls_17_Pmu_ConfigRoot);
# endif

# if defined (VGEN_ENABLE_IF_ASRIFFEE)
  Fee_Init();
# endif

# if defined (VGEN_ENABLE_DRVSPI)
  Spi_Init(Spi_ConfigRoot);
# endif
#endif /*!BRSASR_ENABLE_MCAL_TRUSTED_ONLY*/

  Rte_Start();
}

void EcuM_Shutdown(void)
{

}

void EcuM_StartOS(AppModeType appMode)
{
#if defined (BRSASR_ENABLE_OS_MULTICORESUPPORT)
  uint8 coreId;
  StatusType status;
  if(GetCoreID()==ECUMSTUB_CORE_ID_STARTUP)
  {
    for(coreId=0; coreId < ECUMSTUB_NUMBER_OF_CORES ; coreId++)
    {
      if(coreId!=ECUMSTUB_CORE_ID_STARTUP)
      {
        StartCore(coreId, &status);
      }
    }
  }
#endif /*BRSASR_ENABLE_OS_MULTICORESUPPORT*/

  /* Start OS must be called for each core */
  StartOS(appMode);

  return;
}

