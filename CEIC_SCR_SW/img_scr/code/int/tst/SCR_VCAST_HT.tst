-- VectorCAST 23.sp2 (07/19/23)
-- Test Case Script
--
-- Environment    : SCR_VCAST_HT
-- Unit(s) Under Test: BrsHw ScrDioPort ScrEcuResetHndl ScrGenEthWULPulse ScrMain ScrStateMngmt ScrTricoreIf ScrWakeUpDetection ScrWakeupEcu ScrWakeupHndl
--
-- Script Features
TEST.SCRIPT_FEATURE:C_DIRECT_ARRAY_INDEXING
TEST.SCRIPT_FEATURE:CPP_CLASS_OBJECT_REVISION
TEST.SCRIPT_FEATURE:MULTIPLE_UUT_SUPPORT
TEST.SCRIPT_FEATURE:REMOVED_CL_PREFIX
TEST.SCRIPT_FEATURE:MIXED_CASE_NAMES
TEST.SCRIPT_FEATURE:STATIC_HEADER_FUNCS_IN_UUTS
TEST.SCRIPT_FEATURE:VCAST_MAIN_NOT_RENAMED
--

-- Unit: BrsHw

-- Subprogram: BrsHwConfigureInterruptsAtPowerOn

-- Test Case: BrsHwConfigureInterruptsAtPowerOn_DummyTestForCoverage
TEST.UNIT:BrsHw
TEST.SUBPROGRAM:BrsHwConfigureInterruptsAtPowerOn
TEST.NEW
TEST.NAME:BrsHwConfigureInterruptsAtPowerOn_DummyTestForCoverage
TEST.NOTES:
DESCRIPTION:   This function has to be used to initialize the used interrupts.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the function is properly executed (currently unused/empty function).
TEST.END_NOTES:
TEST.FLOW
  BrsHw.c.BrsHwConfigureInterruptsAtPowerOn
  BrsHw.c.BrsHwConfigureInterruptsAtPowerOn
TEST.END_FLOW
TEST.END

-- Subprogram: BrsHwDisableInterrupt

-- Test Case: BrsHwDisableInterrupt_DisableInterrupt_NestedCalls
TEST.UNIT:BrsHw
TEST.SUBPROGRAM:BrsHwDisableInterrupt
TEST.NEW
TEST.NAME:BrsHwDisableInterrupt_DisableInterrupt_NestedCalls
TEST.NOTES:
DESCRIPTION:   Disables the global interrupt of the micro.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the global interrupt is correctly disabled in case of nested calls of the function
TEST.END_NOTES:
TEST.VALUE:BrsHw.<<GLOBAL>>.bBrsHwIntDiCounter:1
TEST.VALUE:BrsHw.<<GLOBAL>>.wBrsHwSavedPSW:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX0:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET0:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX1:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET1:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ES:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET2:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.reserved_6:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EA:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.bBrsHwIntDiCounter:2
TEST.EXPECTED:BrsHw.<<GLOBAL>>.wBrsHwSavedPSW:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX0:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET0:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX1:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET1:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ES:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET2:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.reserved_6:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EA:0x1
TEST.FLOW
  BrsHw.c.BrsHwDisableInterrupt
  BrsHw.c.BrsHwDisableInterrupt
TEST.END_FLOW
TEST.END

-- Test Case: BrsHwDisableInterrupt_DisableInterrupt_NoNestedCalls
TEST.UNIT:BrsHw
TEST.SUBPROGRAM:BrsHwDisableInterrupt
TEST.NEW
TEST.NAME:BrsHwDisableInterrupt_DisableInterrupt_NoNestedCalls
TEST.NOTES:
DESCRIPTION:   Disables the global interrupt of the micro.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the global interrupt is correctly disabled in case of single (not nested) call of the function
.
TEST.END_NOTES:
TEST.VALUE:BrsHw.<<GLOBAL>>.bBrsHwIntDiCounter:0
TEST.VALUE:BrsHw.<<GLOBAL>>.wBrsHwSavedPSW:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX0:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET0:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX1:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET1:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ES:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET2:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.reserved_6:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EA:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.bBrsHwIntDiCounter:1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.wBrsHwSavedPSW:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX0:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET0:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX1:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET1:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ES:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET2:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.reserved_6:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EA:0x0
TEST.FLOW
  BrsHw.c.BrsHwDisableInterrupt
  BrsHw.c.BrsHwDisableInterrupt
TEST.END_FLOW
TEST.END

-- Subprogram: BrsHwDisableInterruptAtPowerOn

-- Test Case: BrsHwDisableInterruptAtPowerOn_DisableInterrupts
TEST.UNIT:BrsHw
TEST.SUBPROGRAM:BrsHwDisableInterruptAtPowerOn
TEST.NEW
TEST.NAME:BrsHwDisableInterruptAtPowerOn_DisableInterrupts
TEST.NOTES:
DESCRIPTION:   Disable the global system interrupt and initialize the INT lock handler variables.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the global system interrupt is correctly disabled at PowerOn
TEST.END_NOTES:
TEST.VALUE:BrsHw.<<GLOBAL>>.bBrsHwIntDiCounter:0xFF
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX0:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET0:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX1:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET1:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ES:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET2:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.reserved_6:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EA:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.bBrsHwIntDiCounter:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX0:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET0:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX1:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET1:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ES:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET2:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.reserved_6:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EA:0x0
TEST.FLOW
  BrsHw.c.BrsHwDisableInterruptAtPowerOn
  BrsHw.c.BrsHwDisableInterruptAtPowerOn
TEST.END_FLOW
TEST.END

-- Subprogram: BrsHwEnableInterruptAtPowerOn

-- Test Case: BrsHwEnableInterruptAtPowerOn_EnableInterrupts
TEST.UNIT:BrsHw
TEST.SUBPROGRAM:BrsHwEnableInterruptAtPowerOn
TEST.NEW
TEST.NAME:BrsHwEnableInterruptAtPowerOn_EnableInterrupts
TEST.NOTES:
DESCRIPTION:   Enable the global system interrupt

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the global system interrupt is correctly enabled at PowerOn
TEST.END_NOTES:
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX0:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET0:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX1:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET1:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ES:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET2:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.reserved_6:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EA:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX0:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET0:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX1:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET1:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ES:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET2:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.reserved_6:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EA:0x1
TEST.FLOW
  BrsHw.c.BrsHwEnableInterruptAtPowerOn
  BrsHw.c.BrsHwEnableInterruptAtPowerOn
TEST.END_FLOW
TEST.END

-- Subprogram: BrsHwPllInitPowerOn

-- Test Case: BrsHwPllInitPowerOn_DummyTestForCoverage
TEST.UNIT:BrsHw
TEST.SUBPROGRAM:BrsHwPllInitPowerOn
TEST.NEW
TEST.NAME:BrsHwPllInitPowerOn_DummyTestForCoverage
TEST.NOTES:
DESCRIPTION:   This function has to be used to initialize the PLL.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the function is properly executed (currently unused/empty function).
TEST.END_NOTES:
TEST.FLOW
  BrsHw.c.BrsHwPllInitPowerOn
  BrsHw.c.BrsHwPllInitPowerOn
TEST.END_FLOW
TEST.END

-- Subprogram: BrsHwPortInitPowerOn

-- Test Case: BrsHwPortInitPowerOn_DioPort_Init
TEST.UNIT:BrsHw
TEST.SUBPROGRAM:BrsHwPortInitPowerOn
TEST.NEW
TEST.NAME:BrsHwPortInitPowerOn_DioPort_Init
TEST.NOTES:
DESCRIPTION:   This function has to be used to initialize the used ports.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the used ports are properly initialized.
TEST.END_NOTES:
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_PDISC.U:0xFF
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_PDISC.U:0xFF
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_OUT.U:0xFF
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_OUT.U:0xFF
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_IO_PAGE.B.PAGE:0x0
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR0.U:0xFF
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR1.U:0xFF
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR2.U:0xFF
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR3.U:0xFF
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR4.U:0xFF
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR5.U:0xFF
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR6.U:0xFF
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR7.U:0xFF
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR0.U:0xFF
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR1.U:0xFF
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR2.U:0xFF
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR3.U:0xFF
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR4.U:0xFF
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR5.U:0xFF
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR6.U:0x0
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR7.U:0xFF
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_PDISC.U:0x0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_PDISC.U:0x0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_OUT.U:0x0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_OUT.U:0x0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_IO_PAGE.B.PAGE:0x0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR0.U:0x80
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR1.U:0x0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR2.U:0x80
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR3.U:0x80
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR4.U:0x0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR5.U:0x0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR6.U:0x0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR7.U:0x0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR0.U:0x0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR1.U:0x0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR2.U:0x0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR3.U:0x80
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR4.U:0x0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR5.U:0x80
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR6.U:0x80
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR7.U:0x0
TEST.FLOW
  BrsHw.c.BrsHwPortInitPowerOn
  BrsHw.c.BrsHwPortInitPowerOn
TEST.END_FLOW
TEST.END

-- Subprogram: BrsHwRestoreInterrupt

-- Test Case: BrsHwRestoreInterrupt_IllegalCall
TEST.UNIT:BrsHw
TEST.SUBPROGRAM:BrsHwRestoreInterrupt
TEST.NEW
TEST.NAME:BrsHwRestoreInterrupt_IllegalCall
TEST.NOTES:
DESCRIPTION:   Restores the state of the global interrupt of the micro.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests function behavior in case if illegal call (if this function is called too often, the INT lock works incorrect.)
TEST.END_NOTES:
TEST.VALUE:BrsHw.<<GLOBAL>>.bBrsHwIntDiCounter:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.bBrsHwIntDiCounter:0xFF
TEST.EXPECTED:uut_prototype_stubs.BrsMainExceptionHandler.ErrorCode:MACRO=kBrsIllegalInterruptRestoration
TEST.EXPECTED:uut_prototype_stubs.BrsMainExceptionHandler.ModuleCode:MACRO=BRSERROR_MODULE_BRSHW
TEST.FLOW
  BrsHw.c.BrsHwRestoreInterrupt
  uut_prototype_stubs.BrsMainExceptionHandler
  BrsHw.c.BrsHwRestoreInterrupt
TEST.END_FLOW
TEST.END

-- Test Case: BrsHwRestoreInterrupt_InterruptRestored
TEST.UNIT:BrsHw
TEST.SUBPROGRAM:BrsHwRestoreInterrupt
TEST.NEW
TEST.NAME:BrsHwRestoreInterrupt_InterruptRestored
TEST.NOTES:
DESCRIPTION:   Restores the state of the global interrupt of the micro.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the state of the global interrupt is correctly restored.
TEST.END_NOTES:
TEST.VALUE:BrsHw.<<GLOBAL>>.bBrsHwIntDiCounter:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.wBrsHwSavedPSW:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX0:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET0:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX1:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET1:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ES:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET2:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.reserved_6:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EA:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.bBrsHwIntDiCounter:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.wBrsHwSavedPSW:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX0:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET0:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX1:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET1:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ES:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET2:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.reserved_6:0x0
TEST.FLOW
  BrsHw.c.BrsHwRestoreInterrupt
  BrsHw.c.BrsHwRestoreInterrupt
TEST.END_FLOW
TEST.EXPECTED_GLOBALS_USER_CODE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EA
{{ <<BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0>>.B.EA == ( <<BrsHw.<<GLOBAL>>.wBrsHwSavedPSW>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Subprogram: BrsHwTime100NOP

-- Test Case: BrsHwTime100NOP_TimeMeasurement
TEST.UNIT:BrsHw
TEST.SUBPROGRAM:BrsHwTime100NOP
TEST.NEW
TEST.NAME:BrsHwTime100NOP_TimeMeasurement
TEST.NOTES:
DESCRIPTION:   This API is used for the BRS time measurement support to get a default time value for all measurements with this platform to be able to compare time measurements on different dates based on this time result.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests BRS time measurement support.
TEST.END_NOTES:
TEST.VALUE:BrsHw.<<GLOBAL>>.bBrsHwIntDiCounter:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.wBrsHwSavedPSW:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX0:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET0:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX1:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET1:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ES:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET2:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.reserved_6:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EA:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.bBrsHwIntDiCounter:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.wBrsHwSavedPSW:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX0:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET0:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX1:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET1:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ES:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET2:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.reserved_6:0x1
TEST.FLOW
  BrsHw.c.BrsHwTime100NOP
  BrsHw.c.BrsHwTime100NOP
TEST.END_FLOW
TEST.EXPECTED_GLOBALS_USER_CODE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EA
{{ <<BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN0>>.B.EA == ( <<BrsHw.<<GLOBAL>>.wBrsHwSavedPSW>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Subprogram: BrsHwTimeBaseInitPowerOn

-- Test Case: BrsHwTimeBaseInitPowerOn_TiimerInit
TEST.UNIT:BrsHw
TEST.SUBPROGRAM:BrsHwTimeBaseInitPowerOn
TEST.NEW
TEST.NAME:BrsHwTimeBaseInitPowerOn_TiimerInit
TEST.NOTES:
DESCRIPTION:   Programmable Interrupt Timer, Timer initialization for 'FakeOS' 1ms time base generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the timer is initilized correctly.
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupInit
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.U:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CR0.U:0xFF
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CR1.U:0xFF
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CR2.U:0xFF
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CR3.U:0xFF
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_NMISR.U:0xFF
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CON.B.RTCC:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CON.B.RTCCLKSEL:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CON.B.RTPBYP:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CON.B.RTCCT:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CON.B.ECRTC:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CON.B.RTC32SEL:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CON.B.CFRTC:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CON.B.INIT32:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CNT0.U:0xFF
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CNT1.U:0xFF
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CNT2.U:0xFF
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CNT3.U:0xFF
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_SCU_PMCON1.B.SSC_DIS:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_SCU_PMCON1.B.T2CCU_DIS:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_SCU_PMCON1.B.RTC_DIS:0x1
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_SCU_PMCON1.B.WCAN_DIS:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_SCU_PMCON1.B.WDT_DIS:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_SCU_PMCON1.B.LIN_DIS:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_SCU_PMCON1.B.OCDS_DIS:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_SCU_PMCON1.B.reserved_7:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.EWCAN:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.ESSC:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.EX2:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.EXM:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.ECCIP0:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.ECCIP1:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.ECCIP2:0x0
TEST.VALUE:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.ECCIP3:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.U:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CR0.U:0x20
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CR1.U:0x4E
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CR2.U:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CR3.U:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_NMISR.U:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CON.B.RTCC:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CON.B.RTCCLKSEL:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CON.B.RTPBYP:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CON.B.RTCCT:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CON.B.ECRTC:0x1
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CON.B.RTC32SEL:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CON.B.CFRTC:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CON.B.INIT32:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CNT0.U:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CNT1.U:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CNT2.U:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_RTC_CNT3.U:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_SCU_PMCON1.B.SSC_DIS:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_SCU_PMCON1.B.T2CCU_DIS:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_SCU_PMCON1.B.RTC_DIS:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_SCU_PMCON1.B.WCAN_DIS:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_SCU_PMCON1.B.WDT_DIS:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_SCU_PMCON1.B.LIN_DIS:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_SCU_PMCON1.B.OCDS_DIS:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_SCU_PMCON1.B.reserved_7:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.EWCAN:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.ESSC:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.EX2:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.EXM:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.ECCIP0:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.ECCIP1:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.ECCIP2:0x0
TEST.EXPECTED:BrsHw.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.ECCIP3:0x1
TEST.FLOW
  BrsHw.c.BrsHwTimeBaseInitPowerOn
  ScrWakeUpDetection.c.WupInit
  BrsHw.c.BrsHwTimeBaseInitPowerOn
TEST.END_FLOW
TEST.END

-- Subprogram: BrsHwTimeBaseInterrupt

-- Test Case: BrsHwTimeBaseInterrupt_InterruptHandle
TEST.UNIT:BrsHw
TEST.SUBPROGRAM:BrsHwTimeBaseInterrupt
TEST.NEW
TEST.NAME:BrsHwTimeBaseInterrupt_InterruptHandle
TEST.NOTES:
DESCRIPTION:   Timer interrupt for the 'FakeOS' 1ms time base generation. This ISR function is not necessary if an OS is used!

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the interrupt is correctly handled.
TEST.END_NOTES:
TEST.VALUE:BrsHw.<<GLOBAL>>.gbBrsMainIsrMilliSecondFlag:0xA5
TEST.EXPECTED:BrsHw.<<GLOBAL>>.gbBrsMainIsrMilliSecondFlag:0xA6
TEST.FLOW
  BrsHw.c.BrsHwTimeBaseInterrupt
  BrsHw.c.BrsHwTimeBaseInterrupt
TEST.END_FLOW
TEST.END

-- Subprogram: BrsHwWatchdogInitPowerOn

-- Test Case: BrsHwWatchdogInitPowerOn_DummyTestForCoverage
TEST.UNIT:BrsHw
TEST.SUBPROGRAM:BrsHwWatchdogInitPowerOn
TEST.NEW
TEST.NAME:BrsHwWatchdogInitPowerOn_DummyTestForCoverage
TEST.NOTES:
DESCRIPTION:   This function has to be used to initialize the Watchdog.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the function is properly executed (currently unused/empty function).
TEST.END_NOTES:
TEST.FLOW
  BrsHw.c.BrsHwWatchdogInitPowerOn
  BrsHw.c.BrsHwWatchdogInitPowerOn
TEST.END_FLOW
TEST.END

-- Unit: ScrDioPort

-- Subprogram: DioPortInit

-- Test Case: ScrPortRegsInit
TEST.UNIT:ScrDioPort
TEST.SUBPROGRAM:DioPortInit
TEST.NEW
TEST.NAME:ScrPortRegsInit
TEST.NOTES:
DESCRIPTION:   Initializes the port input/output registers

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the SCR IN/OUT registers are correctly initialised
TEST.END_NOTES:
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_PDISC.U:1
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_PDISC.U:1
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_OUT.U:1
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_OUT.U:1
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR0.U:0x0
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR1.U:0x1
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR2.U:0x0
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR3.U:0x0
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR4.U:0x1
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR5.U:0x0
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR6.U:0x1
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR7.U:0x1
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR1.U:0x1
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR2.U:0x1
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR5.U:0x0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_PDISC.U:0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_PDISC.U:0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_OUT.U:0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_OUT.U:0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR0.U:0x80
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR1.U:0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR2.U:0x80
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR3.U:0x80
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR4.U:0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR5.U:0x0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR6.U:0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IOCR7.U:0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR1.U:0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR2.U:0x0
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IOCR5.U:0x80
TEST.FLOW
  ScrDioPort.c.DioPortInit
  ScrDioPort.c.DioPortInit
TEST.END_FLOW
TEST.END

-- Subprogram: DioPortRead

-- Test Case: ScrPortRegIn0_High
TEST.UNIT:ScrDioPort
TEST.SUBPROGRAM:DioPortRead
TEST.NEW
TEST.NAME:ScrPortRegIn0_High
TEST.NOTES:
DESCRIPTION:   Gets the level of given SCR port number

PARAMETERS:    PortNr - number of the portpin in range PORT_P00...PORT_P17

RETURN VALUE:  State of the port pin for hi=1 and low=0

TEST CASE:     Tests function returns High level for parameter port PORT_P07 if input register SCR_P00_IN's 7th bit is set to High 
TEST.END_NOTES:
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IN.B.P7:MACRO=STD_HIGH
TEST.VALUE:ScrDioPort.DioPortRead.PortNr:MACRO=PORT_P07
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IN.U:128
TEST.EXPECTED:ScrDioPort.DioPortRead.return:MACRO=STD_HIGH
TEST.FLOW
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
TEST.END_FLOW
TEST.VALUE_USER_CODE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IN.U
<<ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IN>>.U = ( 128u );
TEST.END_VALUE_USER_CODE:
TEST.END

-- Test Case: ScrPortRegIn0_Low
TEST.UNIT:ScrDioPort
TEST.SUBPROGRAM:DioPortRead
TEST.NEW
TEST.NAME:ScrPortRegIn0_Low
TEST.NOTES:
DESCRIPTION:   Gets the level of given SCR port number

PARAMETERS:    PortNr - number of the portpin in range PORT_P00...PORT_P17

RETURN VALUE:  State of the port pin for hi=1 and low=0

TEST CASE:     Tests function returns Low level for parameter port PORT_P07 if input register SCR_P00_IN's 7th bit is set to Low 
TEST.END_NOTES:
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IN.B.P7:MACRO=STD_HIGH
TEST.VALUE:ScrDioPort.DioPortRead.PortNr:MACRO=PORT_P07
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IN.U:127
TEST.EXPECTED:ScrDioPort.DioPortRead.return:MACRO=STD_LOW
TEST.FLOW
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
TEST.END_FLOW
TEST.VALUE_USER_CODE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IN.U
<<ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_IN>>.U = ( 127u );
TEST.END_VALUE_USER_CODE:
TEST.END

-- Test Case: ScrPortRegIn1_High
TEST.UNIT:ScrDioPort
TEST.SUBPROGRAM:DioPortRead
TEST.NEW
TEST.NAME:ScrPortRegIn1_High
TEST.NOTES:
DESCRIPTION:   Gets the level of given SCR port number

PARAMETERS:    PortNr - number of the portpin in range PORT_P00...PORT_P17

RETURN VALUE:  State of the port pin for hi=1 and low=0

TEST CASE:     Tests function returns High level for parameter port PORT_P10 if input register SCR_P01_IN's 0 bit is set to High 
TEST.END_NOTES:
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IN.B.P0:MACRO=STD_LOW
TEST.VALUE:ScrDioPort.DioPortRead.PortNr:MACRO=PORT_P10
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IN.U:1
TEST.EXPECTED:ScrDioPort.DioPortRead.return:MACRO=STD_HIGH
TEST.FLOW
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
TEST.END_FLOW
TEST.VALUE_USER_CODE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IN.U
<<ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IN>>.U = ( 1u );
TEST.END_VALUE_USER_CODE:
TEST.END

-- Test Case: ScrPortRegIn1_Low
TEST.UNIT:ScrDioPort
TEST.SUBPROGRAM:DioPortRead
TEST.NEW
TEST.NAME:ScrPortRegIn1_Low
TEST.NOTES:
DESCRIPTION:   Gets the level of given SCR port number

PARAMETERS:    PortNr - number of the portpin in range PORT_P00...PORT_P17

RETURN VALUE:  State of the port pin for hi=1 and low=0

TEST CASE:     Tests function returns Low level for parameter port PORT_P10 if input register SCR_P01_IN's 0 bit is set to Low 
TEST.END_NOTES:
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IN.B.P0:MACRO=STD_LOW
TEST.VALUE:ScrDioPort.DioPortRead.PortNr:MACRO=PORT_P10
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IN.U:0
TEST.EXPECTED:ScrDioPort.DioPortRead.return:MACRO=STD_LOW
TEST.FLOW
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
TEST.END_FLOW
TEST.VALUE_USER_CODE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IN.U
<<ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_IN>>.U = ( 0u );
TEST.END_VALUE_USER_CODE:
TEST.END

-- Subprogram: DioPortWrite

-- Test Case: ScrPortRegOut0_HighLvl
TEST.UNIT:ScrDioPort
TEST.SUBPROGRAM:DioPortWrite
TEST.NEW
TEST.NAME:ScrPortRegOut0_HighLvl
TEST.NOTES:
DESCRIPTION:   Sets the level of given SCR port number

PARAMETERS:    PortNr - number of the portpin in range PORT_P00...PORT_P17
               NewState - new level hi=1 or low=0

RETURN VALUE:  void

TEST CASE:     Tests whether the passed port level (HIGH) is correctly set for the specified port number from SCR port output register 0
TEST.END_NOTES:
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_OUT.U:0x40
TEST.VALUE:ScrDioPort.DioPortWrite.PortNr:MACRO=PORT_P07
TEST.VALUE:ScrDioPort.DioPortWrite.NewState:MACRO=STD_HIGH
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_OUT.U:0xC0
TEST.END

-- Test Case: ScrPortRegOut0_LowLvl
TEST.UNIT:ScrDioPort
TEST.SUBPROGRAM:DioPortWrite
TEST.NEW
TEST.NAME:ScrPortRegOut0_LowLvl
TEST.NOTES:
DESCRIPTION:   Sets the level of given SCR port number

PARAMETERS:    PortNr - number of the portpin in range PORT_P00...PORT_P17
               NewState - new level hi=1 or low=0

RETURN VALUE:  void

TEST CASE:     Tests whether the passed port level (LOW) is correctly set for the specified port number from SCR port output register 0
TEST.END_NOTES:
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_OUT.U:0xC0
TEST.VALUE:ScrDioPort.DioPortWrite.PortNr:MACRO=PORT_P07
TEST.VALUE:ScrDioPort.DioPortWrite.NewState:MACRO=STD_LOW
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_OUT.U:0x40
TEST.END

-- Test Case: ScrPortRegOut0_g12OUT_WAKE1_HighLvl
TEST.UNIT:ScrDioPort
TEST.SUBPROGRAM:DioPortWrite
TEST.NEW
TEST.NAME:ScrPortRegOut0_g12OUT_WAKE1_HighLvl
TEST.NOTES:
DESCRIPTION:   Sets the level of given SCR port number

PARAMETERS:    PortNr - number of the portpin in range PORT_P00...PORT_P17
               NewState - new level hi=1 or low=0

RETURN VALUE:  void

TEST CASE:     Tests whether the passed port level (HIGH) is correctly set for the specified port number from SCR port output register 0
TEST.END_NOTES:
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_OUT.U:0x0
TEST.VALUE:ScrDioPort.DioPortWrite.PortNr:MACRO=PORT_P05
TEST.VALUE:ScrDioPort.DioPortWrite.NewState:MACRO=STD_HIGH
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_OUT.U:0x20
TEST.END

-- Test Case: ScrPortRegOut0_g12OUT_WAKE1_LowLvl
TEST.UNIT:ScrDioPort
TEST.SUBPROGRAM:DioPortWrite
TEST.NEW
TEST.NAME:ScrPortRegOut0_g12OUT_WAKE1_LowLvl
TEST.NOTES:
DESCRIPTION:   Sets the level of given SCR port number

PARAMETERS:    PortNr - number of the portpin in range PORT_P00...PORT_P17
               NewState - new level hi=1 or low=0

RETURN VALUE:  void

TEST CASE:     Tests whether the passed port level (HIGH) is correctly set for the specified port number from SCR port output register 0
TEST.END_NOTES:
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_OUT.U:0x20
TEST.VALUE:ScrDioPort.DioPortWrite.PortNr:MACRO=PORT_P05
TEST.VALUE:ScrDioPort.DioPortWrite.NewState:MACRO=STD_LOW
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P0_OUT.U:0x0
TEST.END

-- Test Case: ScrPortRegOut1_HighLvl
TEST.UNIT:ScrDioPort
TEST.SUBPROGRAM:DioPortWrite
TEST.NEW
TEST.NAME:ScrPortRegOut1_HighLvl
TEST.NOTES:
DESCRIPTION:   Sets the level of given SCR port number

PARAMETERS:    PortNr - number of the portpin in range PORT_P00...PORT_P17
               NewState - new level hi=1 or low=0

RETURN VALUE:  void

TEST CASE:     Tests whether the passed port level (HIGH) is correctly set for the specified port number from SCR port output register 1
TEST.END_NOTES:
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_OUT.U:0x0
TEST.VALUE:ScrDioPort.DioPortWrite.PortNr:MACRO=PORT_P10
TEST.VALUE:ScrDioPort.DioPortWrite.NewState:MACRO=STD_HIGH
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_OUT.U:0x1
TEST.END

-- Test Case: ScrPortRegOut1_LowLvl
TEST.UNIT:ScrDioPort
TEST.SUBPROGRAM:DioPortWrite
TEST.NEW
TEST.NAME:ScrPortRegOut1_LowLvl
TEST.NOTES:
DESCRIPTION:   Sets the level of given SCR port number

PARAMETERS:    PortNr - number of the portpin in range PORT_P00...PORT_P17
               NewState - new level hi=1 or low=0

RETURN VALUE:  void

TEST CASE:     Tests whether the passed port level (LOW) is correctly set for the specified port number from SCR port output register 1
TEST.END_NOTES:
TEST.VALUE:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_OUT.U:0x1
TEST.VALUE:ScrDioPort.DioPortWrite.PortNr:MACRO=PORT_P10
TEST.VALUE:ScrDioPort.DioPortWrite.NewState:MACRO=STD_LOW
TEST.EXPECTED:ScrDioPort.<<GLOBAL>>.UT_Reg_SCR_P1_OUT.U:0x0
TEST.END

-- Unit: ScrEcuResetHndl

-- Subprogram: ScrCheckEcuResetRequest

-- Test Case: ScrCheckNoEcuResetRequestNoAck
TEST.UNIT:ScrEcuResetHndl
TEST.SUBPROGRAM:ScrCheckEcuResetRequest
TEST.NEW
TEST.NAME:ScrCheckNoEcuResetRequestNoAck
TEST.NOTES:
DESCRIPTION:   Start check routine for the ECU hard reset request from Tricore.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if no hardreset-request is received, SCR does not acknowledge it with ECU_RST_ACK.
TEST.END_NOTES:
TEST.VALUE:ScrEcuResetHndl.<<GLOBAL>>.ECUResetReq:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0x1
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0x1
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.CanWupDetected:0x1
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.FrWupDetected:0x1
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.LinWupDetected:0x1
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.unused:0x7
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:0xA5
TEST.EXPECTED:ScrEcuResetHndl.<<GLOBAL>>.ECUResetReq:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0x1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0x1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.CanWupDetected:0x1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.FrWupDetected:0x1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.LinWupDetected:0x1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.unused:0x7
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:0xA5
TEST.END

-- Test Case: ScrCheckOnEcuResetRequestAck
TEST.UNIT:ScrEcuResetHndl
TEST.SUBPROGRAM:ScrCheckEcuResetRequest
TEST.NEW
TEST.NAME:ScrCheckOnEcuResetRequestAck
TEST.NOTES:
DESCRIPTION:   Start check routine for the ECU hard reset request from Tricore.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that SCR confirms the hardreset-request from the Triore and acknowledges it with ECU_RST_ACK.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.VALUE:ScrEcuResetHndl.<<GLOBAL>>.ECUResetReq:MACRO=ECU_RST_REQ
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0x1
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0x1
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.CanWupDetected:0x1
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.FrWupDetected:0x1
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.LinWupDetected:0x1
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.unused:0x7
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:0x1
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_PMIC1_WAKE
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:0
TEST.EXPECTED:ScrEcuResetHndl.<<GLOBAL>>.ECUResetReq:MACRO=ECU_RST_ACK
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0x1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0x1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.CanWupDetected:0x1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.FrWupDetected:0x1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.LinWupDetected:0x1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.unused:0x7
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:0x0
TEST.FLOW
  ScrEcuResetHndl.c.ScrCheckEcuResetRequest
  ScrDioPort.c.DioPortWrite
  ScrEcuResetHndl.c.ScrCheckEcuResetRequest
TEST.END_FLOW
TEST.END

-- Subprogram: ScrEcuResetHndlTask1

-- Test Case: Comp_ScrEcuResetHndl_ScrWupCallback
TEST.UNIT:ScrEcuResetHndl
TEST.SUBPROGRAM:ScrEcuResetHndlTask1
TEST.NEW
TEST.NAME:Comp_ScrEcuResetHndl_ScrWupCallback
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Start handling routine for the ECU hard reset request from Tricore.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if SCU Standby Mode entered and hardreset acknowledged, RstDlyCnt is set to RST_DLY_TIME.
TEST.END_NOTES:
TEST.STUB:ScrEcuResetHndl.ScrCheckEcuResetRequest
TEST.VALUE:ScrEcuResetHndl.<<GLOBAL>>.ECUResetReq:MACRO=ECU_RST_ACK
TEST.VALUE:ScrEcuResetHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.CanWupDetected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.FrWupDetected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.LinWupDetected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.unused:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:0x0
TEST.EXPECTED:ScrEcuResetHndl.<<GLOBAL>>.ECUResetReq:MACRO=ECU_RST_DONE
TEST.EXPECTED:ScrEcuResetHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.CanWupDetected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.FrWupDetected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.LinWupDetected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.unused:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:0x0
TEST.END

-- Test Case: Comp_ScrEcuResetHndl_ScrWupCallback_Incr
TEST.UNIT:ScrEcuResetHndl
TEST.SUBPROGRAM:ScrEcuResetHndlTask1
TEST.NEW
TEST.NAME:Comp_ScrEcuResetHndl_ScrWupCallback_Incr
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Start handling routine for the ECU hard reset request from Tricore.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if RstDlyCnt is decremented to 1 (One) ScrWupCallback is called.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.VALUE:ScrEcuResetHndl.<<GLOBAL>>.ECUResetReq:MACRO=ECU_RST_DONE
TEST.VALUE:ScrEcuResetHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.CanWupDetected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.FrWupDetected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.LinWupDetected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.unused:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:0x0
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_PMIC1_WAKE
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrEcuResetHndl.<<GLOBAL>>.ECUResetReq:MACRO=ECU_RST_DONE
TEST.EXPECTED:ScrEcuResetHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.CanWupDetected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.FrWupDetected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.LinWupDetected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.unused:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:MACRO=PMIC_ON_TIME
TEST.END

-- Test Case: ScrEcuResetHndl_NormalMode
TEST.UNIT:ScrEcuResetHndl
TEST.SUBPROGRAM:ScrEcuResetHndlTask1
TEST.NEW
TEST.NAME:ScrEcuResetHndl_NormalMode
TEST.NOTES:
DESCRIPTION:   Start handling routine for the ECU hard reset request from Tricore.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if SCU Status Register for Standby Mode Status is not TRUE, handling does not continue.
TEST.END_NOTES:
TEST.STUB:ScrEcuResetHndl.ScrCheckEcuResetRequest
TEST.VALUE:ScrEcuResetHndl.<<GLOBAL>>.ECUResetReq:0
TEST.VALUE:ScrEcuResetHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.CanWupDetected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.FrWupDetected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.LinWupDetected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.unused:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:0x0
TEST.EXPECTED:ScrEcuResetHndl.<<GLOBAL>>.ECUResetReq:0
TEST.EXPECTED:ScrEcuResetHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.CanWupDetected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.FrWupDetected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.LinWupDetected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.unused:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:0x0
TEST.FLOW
  ScrEcuResetHndl.c.ScrEcuResetHndlTask1
  ScrEcuResetHndl.c.ScrCheckEcuResetRequest
  ScrEcuResetHndl.c.ScrEcuResetHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: ScrEcuResetHndl_StandbyMode_NoRstNoAckn
TEST.UNIT:ScrEcuResetHndl
TEST.SUBPROGRAM:ScrEcuResetHndlTask1
TEST.NEW
TEST.NAME:ScrEcuResetHndl_StandbyMode_NoRstNoAckn
TEST.NOTES:
DESCRIPTION:   Start handling routine for the ECU hard reset request from Tricore.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if SCU Standby Mode entered, but Tricore hardreset not acknowledged, handling does not continue.
TEST.END_NOTES:
TEST.STUB:ScrEcuResetHndl.ScrCheckEcuResetRequest
TEST.VALUE:ScrEcuResetHndl.<<GLOBAL>>.ECUResetReq:0
TEST.VALUE:ScrEcuResetHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.CanWupDetected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.FrWupDetected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.LinWupDetected:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.unused:0x0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:0x0
TEST.EXPECTED:ScrEcuResetHndl.<<GLOBAL>>.ECUResetReq:0
TEST.EXPECTED:ScrEcuResetHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.CanWupDetected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.FrWupDetected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.LinWupDetected:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.unused:0x0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:0x0
TEST.FLOW
  ScrEcuResetHndl.c.ScrEcuResetHndlTask1
  ScrEcuResetHndl.c.ScrCheckEcuResetRequest
  ScrEcuResetHndl.c.ScrEcuResetHndlTask1
TEST.END_FLOW
TEST.END

-- Unit: ScrGenEthWULPulse

-- Subprogram: CheckWulPulsLength

-- Test Case: Comp_Iter_WUL1_GenWULPattern
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:Comp_Iter_WUL1_GenWULPattern
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Cyclic task for checking the WUL pulse length

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test for incrementing a local counter (timer1000ms)
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.FLOW
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrWakeUpDetection.c.WupGetData
  ScrGenEthWULPulse.c.CheckWulPulsLength
TEST.END_FLOW
TEST.END

-- Test Case: Comp_ShToGND_WUL1_ErrorCleared
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:Comp_ShToGND_WUL1_ErrorCleared
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToGND_Processing" for full processing of ShToGND error, TS: Error Cleared.
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul1:750
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0x0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.END

-- Test Case: Comp_ShToGND_WUL1_ErrorDematuring
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:Comp_ShToGND_WUL1_ErrorDematuring
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToGND_Processing" for full processing of ShToGND error, TS: Error Dematuring ongoing.
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul1:750
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.END

-- Test Case: Comp_ShToGND_WUL2_ErrorCleared
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:Comp_ShToGND_WUL2_ErrorCleared
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToGND_Processing" for full processing of ShToGND error, TS: Error Cleared.
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0x0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.END

-- Test Case: Comp_ShToGND_WUL2_ErrorDematuring
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:Comp_ShToGND_WUL2_ErrorDematuring
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToGND_Processing" for full processing of ShToGND error, TS: Error Dematuring ongoing.
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.END

-- Test Case: Comp_WUL1_GenWULPattern_NoRetry
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:Comp_WUL1_GenWULPattern_NoRetry
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Cyclic task for checking the WUL pulse length

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test for checking whether no retry is made on generating WUL1 patterns if the pulse is valid
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.FLOW
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrWakeUpDetection.c.WupGetData
  ScrGenEthWULPulse.c.CheckWulPulsLength
TEST.END_FLOW
TEST.END

-- Test Case: Comp_WUL1_GenWULPattern_Retry
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:Comp_WUL1_GenWULPattern_Retry
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Cyclic task for checking the WUL pulse length

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test for checking whether a retry is made on generating WUL1 patterns if the pulse is invalid
TEST.END_NOTES:
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL_BOTH
TEST.FLOW
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrWakeUpDetection.c.WupGetData
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.CheckWulPulsLength
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_ShToGND_DematureCnt_NotReset
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:WUL1_ShToGND_DematureCnt_NotReset
TEST.NOTES:
DESCRIPTION:   Cyclic task for checking the WUL pulse length

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether the WUL1 Short-to-GND demature counter is not reset when there is no related fault on the line
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=WUL_BOTH
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul1:2000
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:1
TEST.FLOW
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrWakeUpDetection.c.WupGetData
  ScrGenEthWULPulse.c.CheckWulPulsLength
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_ShToGND_DematureCnt_Reset
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:WUL1_ShToGND_DematureCnt_Reset
TEST.NOTES:
DESCRIPTION:   Cyclic task for checking the WUL pulse length

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether the Short-to-GND demature counter is reset in case of an invalid pulse
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul1:100
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:MACRO=SH_TO_GND_DEMATURE_VALID_PULSES
TEST.FLOW
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrWakeUpDetection.c.WupGetData
  ScrGenEthWULPulse.c.CheckWulPulsLength
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_NoWupHandling_IgnoreDiagReq_GenWulPattern
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:WUL1_WUL2_NoWupHandling_IgnoreDiagReq_GenWulPattern
TEST.NOTES:
DESCRIPTION:   Cyclic task for checking the WUL pulse length

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether no WUP handling is done if diag reqs for generating WUL patterns are ignored
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.FLOW
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrWakeUpDetection.c.WupGetData
  ScrGenEthWULPulse.c.CheckWulPulsLength
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_NoWupHandling_LineBusy
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:WUL1_WUL2_NoWupHandling_LineBusy
TEST.NOTES:
DESCRIPTION:   Cyclic task for checking the WUL pulse length

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether no WUP handling is done if WUL1 is busy
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.FLOW
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrWakeUpDetection.c.WupGetData
  ScrGenEthWULPulse.c.CheckWulPulsLength
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_NoWupHandling_NoDiagReq
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:WUL1_WUL2_NoWupHandling_NoDiagReq
TEST.NOTES:
DESCRIPTION:   Cyclic task for checking the WUL pulse length

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether no WUP handling is done if there is no diag req for it
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.FLOW
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrWakeUpDetection.c.WupGetData
  ScrGenEthWULPulse.c.CheckWulPulsLength
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_NoWupHandling_ShToBat_Present
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:WUL1_WUL2_NoWupHandling_ShToBat_Present
TEST.NOTES:
DESCRIPTION:   Cyclic task for checking the WUL pulse length

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether no WUP handling is done if there is a Short-to-Battery fault present on WUL1
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.FLOW
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrWakeUpDetection.c.WupGetData
  ScrGenEthWULPulse.c.CheckWulPulsLength
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_ShToGND_ErrorCnt_AlreadyReset
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:WUL1_WUL2_ShToGND_ErrorCnt_AlreadyReset
TEST.NOTES:
DESCRIPTION:   Cyclic task for checking the WUL pulse length

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether the WUL1 and WUL2 Short-to-GND error counter is not reset as its corresponding demature counter has not expired yet
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul2:700
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.FLOW
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrWakeUpDetection.c.WupGetData
  ScrGenEthWULPulse.c.CheckWulPulsLength
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_ShToGND_ErrorCnt_NotReset
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:WUL1_WUL2_ShToGND_ErrorCnt_NotReset
TEST.NOTES:
DESCRIPTION:   Cyclic task for checking the WUL pulse length

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether the WUL1 and WUL2 Short-to-GND error counter is not reset as complete demature has not been reached yet
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:2
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:2
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul2:700
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:1
TEST.FLOW
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrWakeUpDetection.c.WupGetData
  ScrGenEthWULPulse.c.CheckWulPulsLength
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_ShToGND_ErrorCnt_Reset
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:WUL1_WUL2_ShToGND_ErrorCnt_Reset
TEST.NOTES:
DESCRIPTION:   Cyclic task for checking the WUL pulse length

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether the WUL1 and WUL2 Short-to-GND error counter is reset upon complete demature
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul2:700
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0x0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.FLOW
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrWakeUpDetection.c.WupGetData
  ScrGenEthWULPulse.c.CheckWulPulsLength
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_ShToGND_NotPresent
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:WUL1_WUL2_ShToGND_NotPresent
TEST.NOTES:
DESCRIPTION:   Cyclic task for checking the WUL pulse length

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether, in case the WUL1 status is different than Short-to-Ground, no related demature handling is done
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=WUL_BOTH
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=WUL_BOTH
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul2:700
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=WUL_BOTH
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=WUL_BOTH
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.FLOW
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrWakeUpDetection.c.WupGetData
  ScrGenEthWULPulse.c.CheckWulPulsLength
TEST.END_FLOW
TEST.END

-- Test Case: WUL2_ShToGND_DematureCnt_NotReset
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:WUL2_ShToGND_DematureCnt_NotReset
TEST.NOTES:
DESCRIPTION:   Cyclic task for checking the WUL pulse length

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether the WUL2 Short-to-GND demature counter is not reset when there is no related fault on the line
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=WUL_BOTH
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul2:2000
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:1
TEST.FLOW
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrWakeUpDetection.c.WupGetData
  ScrGenEthWULPulse.c.CheckWulPulsLength
TEST.END_FLOW
TEST.END

-- Test Case: WUL2_ShToGND_DematureCnt_Reset
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:CheckWulPulsLength
TEST.NEW
TEST.NAME:WUL2_ShToGND_DematureCnt_Reset
TEST.NOTES:
DESCRIPTION:   Cyclic task for checking the WUL pulse length

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether the Short-to-GND demature counter is reset in case of an invalid pulse
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul2:100
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:MACRO=SH_TO_GND_DEMATURE_VALID_PULSES
TEST.FLOW
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrWakeUpDetection.c.WupGetData
  ScrGenEthWULPulse.c.CheckWulPulsLength
TEST.END_FLOW
TEST.END

-- Subprogram: ScrGenEthWULTask10

-- Test Case: Comp_CheckPulseLen
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenEthWULTask10
TEST.NEW
TEST.NAME:Comp_CheckPulseLen
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test to test whether the pulse length is checked after the necessary point in time is reached.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL1
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL2
TEST.STUB:ScrGenEthWULPulse.ScrIsWakeupDiagRequested
TEST.STUB:ScrGenEthWULPulse.CheckWulPulsLength
TEST.VALUE:ScrDioPort.DioPortRead.return:(2)1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL1
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL2
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
TEST.END_FLOW
TEST.END

-- Test Case: Comp_CheckPulseLen_GenTimerWUL1_Expired_PulseGenAlreadyCompleated
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenEthWULTask10
TEST.NEW
TEST.NAME:Comp_CheckPulseLen_GenTimerWUL1_Expired_PulseGenAlreadyCompleated
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test to test whether the generated pulse on WUL1 is with correct length.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL1
TEST.STUB:ScrGenEthWULPulse.ScrIsWakeupDiagRequested
TEST.STUB:ScrGenEthWULPulse.CheckWulPulsLength
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g12OUT_WAKE1,MACRO=g1OUT_WAKE2
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:3
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL1
  ScrDioPort.c.DioPortRead
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
TEST.END_FLOW
TEST.END

-- Test Case: Comp_CheckPulseLen_GenTimerWUL1_Expired_PulseGenFinish
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenEthWULTask10
TEST.NEW
TEST.NAME:Comp_CheckPulseLen_GenTimerWUL1_Expired_PulseGenFinish
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test to test whether the generated pulse on WUL1 is with correct length.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL1
TEST.STUB:ScrGenEthWULPulse.ScrIsWakeupDiagRequested
TEST.STUB:ScrGenEthWULPulse.CheckWulPulsLength
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g12OUT_WAKE1,MACRO=g1OUT_WAKE2
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:3
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL1
  ScrDioPort.c.DioPortRead
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
TEST.END_FLOW
TEST.END

-- Test Case: Comp_CheckPulseLen_GenTimerWUL2_Expired_PulseGenAlreadyCompleated
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenEthWULTask10
TEST.NEW
TEST.NAME:Comp_CheckPulseLen_GenTimerWUL2_Expired_PulseGenAlreadyCompleated
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test to test whether the generated pulse on WUL1 is with correct length.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL1
TEST.STUB:ScrGenEthWULPulse.ScrIsWakeupDiagRequested
TEST.STUB:ScrGenEthWULPulse.CheckWulPulsLength
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g12OUT_WAKE1,MACRO=g1OUT_WAKE2
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:3
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL1
  ScrDioPort.c.DioPortRead
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
TEST.END_FLOW
TEST.END

-- Test Case: Comp_CheckPulseLen_GenTimerWUL2_Expired_PulseGenFinish
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenEthWULTask10
TEST.NEW
TEST.NAME:Comp_CheckPulseLen_GenTimerWUL2_Expired_PulseGenFinish
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test to test whether the generated pulse on WUL1 is with correct length.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL1
TEST.STUB:ScrGenEthWULPulse.ScrIsWakeupDiagRequested
TEST.STUB:ScrGenEthWULPulse.CheckWulPulsLength
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g12OUT_WAKE1,MACRO=g1OUT_WAKE2
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:3
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL1
  ScrDioPort.c.DioPortRead
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
TEST.END_FLOW
TEST.END

-- Test Case: Comp_Iter_CheckPulseLen
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenEthWULTask10
TEST.NEW
TEST.NAME:Comp_Iter_CheckPulseLen
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test to test whether the pulse length is checked after the necessary point in time is reached.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL1
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL2
TEST.STUB:ScrGenEthWULPulse.ScrIsWakeupDiagRequested
TEST.VALUE:ScrDioPort.DioPortRead.return:(18)1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PERMA_ACTIVE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2,MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2,MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2,MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2,MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2,MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2,MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2,MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2,MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL1
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL2
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
TEST.END_FLOW
TEST.END

-- Test Case: Comp_Iter_CheckPulseLen_GenTimerWUL1_NotExpired
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenEthWULTask10
TEST.NEW
TEST.NAME:Comp_Iter_CheckPulseLen_GenTimerWUL1_NotExpired
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test to test whether the generated pulse on WUL1 is with correct length.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL1
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL2
TEST.STUB:ScrGenEthWULPulse.ScrIsWakeupDiagRequested
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PULSE_LEN
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:3
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL1
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL2
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
TEST.END_FLOW
TEST.END

-- Test Case: Comp_Iter_CheckPulseLen_GenTimerWUL2_NotExpired
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenEthWULTask10
TEST.NEW
TEST.NAME:Comp_Iter_CheckPulseLen_GenTimerWUL2_NotExpired
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test to test whether the generated pulse on WUL1 is with correct length.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL1
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL2
TEST.STUB:ScrGenEthWULPulse.ScrIsWakeupDiagRequested
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PULSE_LEN_CS
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:3
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:1
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL1
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL2
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
TEST.END_FLOW
TEST.END

-- Test Case: Comp_NotCheckPulseLen_WU_Perma_Active
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenEthWULTask10
TEST.NEW
TEST.NAME:Comp_NotCheckPulseLen_WU_Perma_Active
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test to test whether the pulse length is checked after the necessary point in time is reached.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL1
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL2
TEST.STUB:ScrGenEthWULPulse.ScrIsWakeupDiagRequested
TEST.STUB:ScrGenEthWULPulse.CheckWulPulsLength
TEST.VALUE:ScrDioPort.DioPortRead.return:(2)1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PERMA_ACTIVE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PERMA_ACTIVE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
  ScrGenEthWULPulse.c.CheckWulPulsLength
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL1
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL2
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
TEST.END_FLOW
TEST.END

-- Test Case: PulseGenDiag_Complete_WUL1_WUL2_HIGH
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenEthWULTask10
TEST.NEW
TEST.NAME:PulseGenDiag_Complete_WUL1_WUL2_HIGH
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that covers the case where pulse generation diag status is 'complete' and WUL1/WUL2 level is HIGH
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL1
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL2
TEST.STUB:ScrGenEthWULPulse.ScrIsWakeupDiagRequested
TEST.VALUE:ScrDioPort.DioPortRead.return:(2)1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_Complete
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g12OUT_WAKE1,MACRO=g1OUT_WAKE2
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:(2)0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_Complete
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL1
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL2
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
TEST.END_FLOW
TEST.END

-- Test Case: PulseGenDiag_Complete_on_WUL1_WUL2.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenEthWULTask10
TEST.NEW
TEST.NAME:PulseGenDiag_Complete_on_WUL1_WUL2.001
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that covers the case where pulse generation has just finished on WUL1 and already finished on WUL2
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL1
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL2
TEST.STUB:ScrGenEthWULPulse.ScrIsWakeupDiagRequested
TEST.VALUE:ScrDioPort.DioPortRead.return:(2)0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:1
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g12OUT_WAKE1,MACRO=g1OUT_WAKE2
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:3
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_Complete
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL1
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL2
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
TEST.END_FLOW
TEST.VALUE_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag
<<ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag>> = ( GenWULPulse_DiagReq | GenWULPulse_WUL1InProgress | GenWULPulse_WUL2InProgress | GenWULPulse_WUL2Finish );
TEST.END_VALUE_USER_CODE:
TEST.END

-- Test Case: PulseGenDiag_Complete_on_WUL1_WUL2.003
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenEthWULTask10
TEST.NEW
TEST.NAME:PulseGenDiag_Complete_on_WUL1_WUL2.003
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that covers the case where pulse generation has just finished on WUL2 and already finished on WUL1
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL1
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL2
TEST.STUB:ScrGenEthWULPulse.ScrIsWakeupDiagRequested
TEST.VALUE:ScrDioPort.DioPortRead.return:(2)0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g12OUT_WAKE1,MACRO=g1OUT_WAKE2
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:3
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_Complete
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL1
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL2
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
TEST.END_FLOW
TEST.VALUE_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag
<<ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag>> = ( GenWULPulse_DiagReq | GenWULPulse_WUL1InProgress | GenWULPulse_WUL2InProgress | GenWULPulse_WUL1Finish );
TEST.END_VALUE_USER_CODE:
TEST.END

-- Test Case: PulseGenDiag_WUL1_Finish_WUL2_InProgress
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenEthWULTask10
TEST.NEW
TEST.NAME:PulseGenDiag_WUL1_Finish_WUL2_InProgress
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that covers the case where pulse generation has finished on WUL1, but still in progress on WUL2
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL1
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL2
TEST.STUB:ScrGenEthWULPulse.ScrIsWakeupDiagRequested
TEST.VALUE:ScrDioPort.DioPortRead.return:(2)0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:2
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g12OUT_WAKE1
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:3
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:1
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL1
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL2
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
TEST.END_FLOW
TEST.VALUE_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag
<<ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag>> = ( GenWULPulse_DiagReq | GenWULPulse_WUL1InProgress | GenWULPulse_WUL2InProgress );
TEST.END_VALUE_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag>> == ( GenWULPulse_DiagReq | GenWULPulse_WUL1InProgress | GenWULPulse_WUL2InProgress | GenWULPulse_WUL1Finish ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: PulseGenDiag_WUL1_InProgress_WUL2_Finish
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenEthWULTask10
TEST.NEW
TEST.NAME:PulseGenDiag_WUL1_InProgress_WUL2_Finish
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that covers the case where pulse generation has finished on WUL2, but still in progress on WUL1
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL1
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL2
TEST.STUB:ScrGenEthWULPulse.ScrIsWakeupDiagRequested
TEST.VALUE:ScrDioPort.DioPortRead.return:(2)0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:2
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_WAKE2
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:3
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL1
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL2
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
TEST.END_FLOW
TEST.VALUE_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag
<<ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag>> = ( GenWULPulse_DiagReq | GenWULPulse_WUL1InProgress | GenWULPulse_WUL2InProgress );
TEST.END_VALUE_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag>> == ( GenWULPulse_DiagReq | GenWULPulse_WUL1InProgress | GenWULPulse_WUL2InProgress | GenWULPulse_WUL2Finish ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: StartBothWULOffset_Expired
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenEthWULTask10
TEST.NEW
TEST.NAME:StartBothWULOffset_Expired
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that covers the case when both WUL pattern generations are started due to offset expiration
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL1
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL2
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.STUB:ScrGenEthWULPulse.ScrIsWakeupDiagRequested
TEST.VALUE:ScrDioPort.DioPortRead.return:(2)1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PERMA_ACTIVE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.StartBothWULwOffset:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PERMA_ACTIVE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.StartBothWULwOffset:0
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL2
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL1
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL2
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
TEST.END_FLOW
TEST.END

-- Test Case: StartBothWULOffset_NotExpired
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenEthWULTask10
TEST.NEW
TEST.NAME:StartBothWULOffset_NotExpired
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that covers the case when both WUL pattern generations are not started due to no offset expiration
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL1
TEST.STUB:ScrGenEthWULPulse.ScrHndlEthLineShortMonWUL2
TEST.STUB:ScrGenEthWULPulse.ScrIsWakeupDiagRequested
TEST.VALUE:ScrDioPort.DioPortRead.return:(2)1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PERMA_ACTIVE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.StartBothWULwOffset:2
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PERMA_ACTIVE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.StartBothWULwOffset:1
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL1
  ScrGenEthWULPulse.c.ScrHndlEthLineShortMonWUL2
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
TEST.END_FLOW
TEST.END

-- Subprogram: ScrGenReset

-- Test Case: ScrGenReset.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenReset
TEST.NEW
TEST.NAME:ScrGenReset.001
TEST.NOTES:
DESCRIPTION:   Event routine for resetting some variables.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that the intended variables are reset
TEST.END_NOTES:
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenReset
  ScrGenEthWULPulse.c.ScrGenReset
TEST.END_FLOW
TEST.END

-- Subprogram: ScrGenerateWULPattern

-- Test Case: GenWULPattern_Both_while_WUL1_ShortToBat
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenerateWULPattern
TEST.NEW
TEST.NAME:GenWULPattern_Both_while_WUL1_ShortToBat
TEST.NOTES:
DESCRIPTION:   Initiates the generation of Eth WUL pattern on the given channel

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that on request for pulse generation on both WULs, while Sh-To-BAT on WUL1 => generation will be started only on WUL2 (with offset), while on WUL1 it just will be mark as finished so not to block RID 025A execution

TEST.END_NOTES:
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.StartBothWULwOffset:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL_BOTH
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.StartBothWULwOffset:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
TEST.END_FLOW
TEST.VALUE_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag
<<ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag>> = ( GenWULPulse_DiagReq );
TEST.END_VALUE_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag>> == ( GenWULPulse_DiagReq | GenWULPulse_WUL1Finish ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: GenWULPattern_Both_while_WUL2_ShortToBat
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenerateWULPattern
TEST.NEW
TEST.NAME:GenWULPattern_Both_while_WUL2_ShortToBat
TEST.NOTES:
DESCRIPTION:   Initiates the generation of Eth WUL pattern on the given channel

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that on request for pulse generation on both WULs, while Sh-To-BAT on WUL1 => generation will be started only on WUL1, while on WUL2 it just will be mark as finished so not to block RID 025A execution

TEST.END_NOTES:
TEST.STUB:ScrGenEthWULPulse.ScrStartEthLineShortMon
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.StartBothWULwOffset:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL_BOTH
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PULSE_LEN
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.StartBothWULwOffset:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL1
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrStartEthLineShortMon
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
TEST.END_FLOW
TEST.VALUE_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag
<<ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag>> = ( GenWULPulse_DiagReq );
TEST.END_VALUE_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag>> == ( GenWULPulse_DiagReq | GenWULPulse_WUL1InProgress | GenWULPulse_WUL2Finish ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: InvalidWUL
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenerateWULPattern
TEST.NEW
TEST.NAME:InvalidWUL
TEST.NOTES:
DESCRIPTION:   Initiates the generation of Eth WUL pattern on the given channel

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that no WUL pulse generation is started if the WUL passed is invalid

TEST.END_NOTES:
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:10
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_GenTimer_NotExpired
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenerateWULPattern
TEST.NEW
TEST.NAME:WUL1_GenTimer_NotExpired
TEST.NOTES:
DESCRIPTION:   Initiates the generation of Eth WUL pattern on the given channel

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that the WUL1 pulse generation timer is not set if it has not expired yet
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrGenEthWULPulse.ScrStartEthLineShortMon
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:1
TEST.VALUE:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g12OUT_WAKE1
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL1
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrStartEthLineShortMon
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_PulseLen_Default
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenerateWULPattern
TEST.NEW
TEST.NAME:WUL1_PulseLen_Default
TEST.NOTES:
DESCRIPTION:   Initiates the generation of Eth WUL pattern on the given channel

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that the correct WUL1 pulse length is used when Short-to-GND is not detected
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrGenEthWULPulse.ScrStartEthLineShortMon
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortWUL
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g12OUT_WAKE1
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PULSE_LEN
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL1
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrStartEthLineShortMon
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_PulseLen_ShortToGND
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenerateWULPattern
TEST.NEW
TEST.NAME:WUL1_PulseLen_ShortToGND
TEST.NOTES:
DESCRIPTION:   Initiates the generation of Eth WUL pattern on the given channel

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that the correct WUL1 pulse length is used when Short-to-GND is detected
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrGenEthWULPulse.ScrStartEthLineShortMon
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g12OUT_WAKE1
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PULSE_LEN_SH_TO_GND
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL1
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrStartEthLineShortMon
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_ShortToBat
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenerateWULPattern
TEST.NEW
TEST.NAME:WUL1_ShortToBat
TEST.NOTES:
DESCRIPTION:   Initiates the generation of Eth WUL pattern on the given channel

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that no WUL1 pulse generation is started if the its status is Short-to-Battery

TEST.END_NOTES:
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL1
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_DiagPermActive
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenerateWULPattern
TEST.NEW
TEST.NAME:WUL1_WUL2_DiagPermActive
TEST.NOTES:
DESCRIPTION:   Initiates the generation of Eth WUL pattern on the given channel

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that both WULs are set to permanent active due to diag req

TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.VALUE:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL_DIAG_HIGH_ALL
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g12OUT_WAKE1,MACRO=g1OUT_WAKE2
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:(2)1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=WU_PERMA_ACTIVE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PERMA_ACTIVE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_GenTimer_NotExpired
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenerateWULPattern
TEST.NEW
TEST.NAME:WUL1_WUL2_GenTimer_NotExpired
TEST.NOTES:
DESCRIPTION:   Initiates the generation of Eth WUL pattern on the given channel

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that the WUL1 pulse generation timer is not set if it has not expired yet and that WUL2 pulse generation is started with an offset to prevent wrong Short-to-Battery detection
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrGenEthWULPulse.ScrStartEthLineShortMon
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_DiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:1
TEST.VALUE:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL_BOTH
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g12OUT_WAKE1
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.StartBothWULwOffset:1
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL1
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrStartEthLineShortMon
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
TEST.END_FLOW
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag>> == ( GenWULPulse_DiagReq | GenWULPulse_WUL1InProgress ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: WUL1_WUL2_PulseLen_Default
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenerateWULPattern
TEST.NEW
TEST.NAME:WUL1_WUL2_PulseLen_Default
TEST.NOTES:
DESCRIPTION:   Initiates the generation of Eth WUL pattern on the given channel

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that the correct WUL1 pulse length is used when Short-to-GND is not detected and that WUL2 pulse generation is not started with an offset due to Short-to-Battery fault
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrGenEthWULPulse.ScrStartEthLineShortMon
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortWUL
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_WUL1InProgress
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL_BOTH
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g12OUT_WAKE1
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_WUL1InProgress
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PULSE_LEN
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL1
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrStartEthLineShortMon
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_PulseLen_ShortToGND
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenerateWULPattern
TEST.NEW
TEST.NAME:WUL1_WUL2_PulseLen_ShortToGND
TEST.NOTES:
DESCRIPTION:   Initiates the generation of Eth WUL pattern on the given channel

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that the correct WUL1 pulse length is used when Short-to-GND is detected and that WUL2 pulse generation is not started with an offset due to Short-to-Battery fault
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrGenEthWULPulse.ScrStartEthLineShortMon
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_WUL1InProgress
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL_BOTH
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g12OUT_WAKE1
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_WUL1InProgress
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PULSE_LEN_SH_TO_GND
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL1
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrStartEthLineShortMon
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_RepetitionOfInvalidPulse
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenerateWULPattern
TEST.NEW
TEST.NAME:WUL1_WUL2_RepetitionOfInvalidPulse
TEST.NOTES:
DESCRIPTION:   Initiates the generation of Eth WUL pattern on the given channel

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that on request for pulse generation on both WULs, after invalid pulse has been detected, the pulses on both lines will be started with the correct offset. 
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrGenEthWULPulse.ScrStartEthLineShortMon
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_DiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.StartBothWULwOffset:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:1
TEST.VALUE:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL_BOTH
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g12OUT_WAKE1
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.StartBothWULwOffset:2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:1
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL1
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrStartEthLineShortMon
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
TEST.END_FLOW
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag>> == ( GenWULPulse_DiagReq | GenWULPulse_WUL1InProgress ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: WUL1_WUL2_ShortToBat
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenerateWULPattern
TEST.NEW
TEST.NAME:WUL1_WUL2_ShortToBat
TEST.NOTES:
DESCRIPTION:   Initiates the generation of Eth WUL pattern on the given channel

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that both WULs are not handled due to a present Short-to-Battery fault
TEST.END_NOTES:
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL_BOTH
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
TEST.END_FLOW
TEST.END

-- Test Case: WUL2_Diag_GenPulse
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenerateWULPattern
TEST.NEW
TEST.NAME:WUL2_Diag_GenPulse
TEST.NOTES:
DESCRIPTION:   Initiates the generation of Eth WUL pattern on the given channel

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that RID 025A is executed successfully and pulse is generated on WUL2 while Sh-To-BAT is detected on WUL1 
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrGenEthWULPulse.ScrStartEthLineShortMon
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_DiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.StartBothWULwOffset:0
TEST.VALUE:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_WAKE2
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PULSE_LEN_CS
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.StartBothWULwOffset:0
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL2
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrStartEthLineShortMon
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
TEST.END_FLOW
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag>> == ( GenWULPulse_DiagReq | GenWULPulse_WUL2InProgress ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: WUL2_GenTimer_NotExpired
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenerateWULPattern
TEST.NEW
TEST.NAME:WUL2_GenTimer_NotExpired
TEST.NOTES:
DESCRIPTION:   Initiates the generation of Eth WUL pattern on the given channel

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that the WUL2 pulse generation timer is not set if it has not expired yet
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrGenEthWULPulse.ScrStartEthLineShortMon
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:1
TEST.VALUE:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_WAKE2
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL2
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrStartEthLineShortMon
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
TEST.END_FLOW
TEST.END

-- Test Case: WUL2_PulseLen_Default
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenerateWULPattern
TEST.NEW
TEST.NAME:WUL2_PulseLen_Default
TEST.NOTES:
DESCRIPTION:   Initiates the generation of Eth WUL pattern on the given channel

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that the correct WUL2 pulse length is used when Short-to-GND is not detected
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrGenEthWULPulse.ScrStartEthLineShortMon
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortWUL
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_WAKE2
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:75
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL2
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrStartEthLineShortMon
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
TEST.END_FLOW
TEST.END

-- Test Case: WUL2_PulseLen_ShortToGND
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenerateWULPattern
TEST.NEW
TEST.NAME:WUL2_PulseLen_ShortToGND
TEST.NOTES:
DESCRIPTION:   Initiates the generation of Eth WUL pattern on the given channel

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that the correct WUL1 pulse length is used when Short-to-GND is detected
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrGenEthWULPulse.ScrStartEthLineShortMon
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_WAKE2
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PULSE_LEN_SH_TO_GND_CS
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL2
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrStartEthLineShortMon
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
TEST.END_FLOW
TEST.END

-- Test Case: WUL2_ShortToBat
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrGenerateWULPattern
TEST.NEW
TEST.NAME:WUL2_ShortToBat
TEST.NOTES:
DESCRIPTION:   Initiates the generation of Eth WUL pattern on the given channel

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that no WUL2 pulse generation is started if the its status is Short-to-Battery

TEST.END_NOTES:
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL2
TEST.FLOW
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
TEST.END_FLOW
TEST.END

-- Subprogram: ScrHndlEthLineShortMonWUL1

-- Test Case: Comp_ShToBAT_ErrorCleared
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:Comp_ShToBAT_ErrorCleared
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToBAT_Processing" for full processing of ShToBAT error, TS: Error cleared.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:99
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToBAT_ErrorConditionsDetected
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:Comp_ShToBAT_ErrorConditionsDetected
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToBAT_Processing" for full processing of ShToBAT error, TS: Error Conditions detected.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:499
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToBAT_ErrorConditionsDisappear
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:Comp_ShToBAT_ErrorConditionsDisappear
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToBAT_Processing" for full processing of ShToBAT error, TS: Error Conditions "disappear".
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToBAT_ErrorDematuring
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:Comp_ShToBAT_ErrorDematuring
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToBAT_Processing" for full processing of ShToBAT error, TS: Error Dematuring started.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:(10)1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:MACRO=SH_TO_BAT_DEMATURE_TIME
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:5900
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.END

-- Test Case: Comp_ShToBAT_ErrorDematuringInterrupted
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:Comp_ShToBAT_ErrorDematuringInterrupted
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToBAT_Processing" for full processing of ShToBAT error, TS: Error Dematuring interrupted (error condtions detected again).
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:5900
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:MACRO=SH_TO_BAT_DEMATURE_TIME
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.END

-- Test Case: Comp_ShToBAT_ErrorSet
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:Comp_ShToBAT_ErrorSet
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToBAT_Processing" for full processing of ShToBAT error, TS: Error set.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:MACRO=SH_TO_BAT_DEMATURE_TIME
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToBAT_ErrorStaysSet
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:Comp_ShToBAT_ErrorStaysSet
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToBAT_Processing" for full processing of ShToBAT error, TS: Error stays set.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.END

-- Test Case: Comp_ShToBAT_NoErrorConditions
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:Comp_ShToBAT_NoErrorConditions
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToBAT_Processing" for full processing of ShToBAT error, TS: Error Conditions still not detected.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0,1,0,1,0,1,0,1,0,1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToGND_DematureCntCheck
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:Comp_ShToGND_DematureCntCheck
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToGND_Processing" for full processing of ShToGND error, TS: Check Error Demature counter.
TEST.END_NOTES:
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:1
TEST.END

-- Test Case: Comp_ShToGND_ErrorConditionsDetected_PulseGenFinished
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:Comp_ShToGND_ErrorConditionsDetected_PulseGenFinished
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToGND_Processing" for full processing of ShToGND error, TS: Error Conditions still present after pulse generation finished.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:499
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToGND_ErrorConditionsDetected_PulseGenOngoing
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:Comp_ShToGND_ErrorConditionsDetected_PulseGenOngoing
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToGND_Processing" for full processing of ShToGND error, TS: Error Conditions detected while pulse generation is ongoing.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:70
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToGND_ErrorConditionsDisappear
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:Comp_ShToGND_ErrorConditionsDisappear
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToGND_Processing" for full processing of ShToGND error, TS: Error Conditions "disappear".
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToGND_ErrorSet
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:Comp_ShToGND_ErrorSet
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToGND_Processing" for full processing of ShToGND error, TS: Error Set.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:MACRO=SH_TO_GND_DEMATURE_VALID_PULSES
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToGND_ErrorStaysSet
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:Comp_ShToGND_ErrorStaysSet
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToGND_Processing" for full processing of ShToGND error, TS: Error stays set.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:MACRO=SH_TO_GND_DEMATURE_VALID_PULSES
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToGND_NoErrorConditions_PulseGenFinished
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:Comp_ShToGND_NoErrorConditions_PulseGenFinished
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToGND_Processing" for full processing of ShToGND error, TS: Pulse Generation finished, no error conditions detected.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToGND_NoErrorConditions_PulseGenOngoing
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:Comp_ShToGND_NoErrorConditions_PulseGenOngoing
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToGND_Processing" for full processing of ShToGND error, TS: Pulse Generation ongoing, no error conditions detected.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToGND_PulseGenNotStarted
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:Comp_ShToGND_PulseGenNotStarted
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToGND_Processing" for full processing of ShToGND error, TS: Pulse Generation still not started/requested.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToGND_PulseGenStarted_CheckTimerNotElapsed
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:Comp_ShToGND_PulseGenStarted_CheckTimerNotElapsed
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToGND_Processing" for full processing of ShToGND error, TS: Pulse Generation started/requested but error check timer not elapsed yet.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=SHORT_DET_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToBAT_01_while_WULs_PermanentActive.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToBAT_01_while_WULs_PermanentActive.001
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that ShToBAT monitoring is stopped if WUL1 is in permanent active state
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:ScrDioPort.DioPortRead.return:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PERMA_ACTIVE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PERMA_ACTIVE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.END

-- Test Case: ShToBAT_01_while_WULs_PermanentActive.002
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToBAT_01_while_WULs_PermanentActive.002
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that ShToBAT monitoring is stopped if WUL2 is in permanent active state 
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:ScrDioPort.DioPortRead.return:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.END

-- Test Case: ShToBAT_01_while_WULs_PermanentActive.003
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToBAT_01_while_WULs_PermanentActive.003
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that ShToBAT monitoring is stopped if both WULs are in permanent active state (set by DID 0168)
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:ScrDioPort.DioPortRead.return:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PERMA_ACTIVE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PERMA_ACTIVE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.END

-- Test Case: ShToBAT_02_NoErrorConditions.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToBAT_02_NoErrorConditions.001
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToBAT monitoring if error conditions are not present (NCS Line Old Status: 1, NCS Line New Status: 0)
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToBAT_02_NoErrorConditions.002
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToBAT_02_NoErrorConditions.002
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToBAT monitoring if error conditions are not present (NCS Line Old Status: 0, NCS Line New Status: 1)
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToBAT_03_ErrorConditionsDetected
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToBAT_03_ErrorConditionsDetected
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToBAT monitoring if error conditions are detected but ShToBAT Fault still not set 
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToBAT_04_ErrorSet.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToBAT_04_ErrorSet.001
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToBAT monitoring if error conditions are present for more than 5sec and ShToBAT error is set.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:MACRO=SH_TO_BAT_DEMATURE_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToBAT_04_ErrorSet.002
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToBAT_04_ErrorSet.002
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToBAT monitoring if ShToBAT error was set and error conditions are still present.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:501
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:MACRO=SH_TO_BAT_DEMATURE_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToBAT_05_ErrorSet_DematuringNotStarted.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToBAT_05_ErrorSet_DematuringNotStarted.001
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToBAT monitoring if ShToBAT error was set, error conditions are no more present, but still no conditions for dematuring (NCS Line Old Status: 1, NCS Line New Status: 0).
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.END

-- Test Case: ShToBAT_05_ErrorSet_DematuringNotStarted.002
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToBAT_05_ErrorSet_DematuringNotStarted.002
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToBAT monitoring if ShToBAT error was set, error conditions are no more present, but still no conditions for dematuring (NCS Line Old Status: 1, NCS Line New Status: 1).
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.END

-- Test Case: ShToBAT_06_ErrorDematuringStarted
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToBAT_06_ErrorDematuringStarted
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToBAT monitoring if error was already set, but error conditions are not present anymore and dematuring started.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.END

-- Test Case: ShToBAT_07_ErrorCleared
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToBAT_07_ErrorCleared
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToBAT monitoring if error was already set, but error conditions are not present anymore, dematuring has finished and error is cleared.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_01_PulseGenNotStarted
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToGND_01_PulseGenNotStarted
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring while pulse generation is still not started (check timer is still uninit).
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_02_PulseGenStarted_CheckTimerNotElapsed
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToGND_02_PulseGenStarted_CheckTimerNotElapsed
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring when pulse generation has started but check timer not elapsed yet.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_03_NoErrorConditions.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToGND_03_NoErrorConditions.001
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring when pulse generation has started, check timer has elapsed and error conditions are not present (NCS Line Old Status: 0, NCS Line New Status: 1).
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_03_NoErrorConditions.002
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToGND_03_NoErrorConditions.002
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring when pulse generation has started, check timer has elapsed and error conditions are not present (NCS Line Old Status: 1, NCS Line New Status: 0).
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_03_NoErrorConditions.003
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToGND_03_NoErrorConditions.003
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring when pulse generation has finished and error conditions were not detected.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_03_NoErrorConditions.004
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToGND_03_NoErrorConditions.004
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring when pulse generation has finished, error conditions were detected for a while, but now are not present.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_04_ErrorConditionsDetected.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToGND_04_ErrorConditionsDetected.001
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring if error conditions are detected but ShToGND Fault still not set
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_04_ErrorConditionsDetected.002
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToGND_04_ErrorConditionsDetected.002
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring if error conditions are detected, error counter incremented, but ShToGND Fault still not set
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_05_ErrorSet.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToGND_05_ErrorSet.001
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring if error conditions are present for more than 5sec and ShToGND error is set.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:MACRO=SH_TO_GND_DEMATURE_VALID_PULSES
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_05_ErrorSet.002
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL1
TEST.NEW
TEST.NAME:ShToGND_05_ErrorSet.002
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring if ShToGND error was set and error conditions are still present.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:MACRO=SH_TO_GND_DEMATURE_VALID_PULSES
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Subprogram: ScrHndlEthLineShortMonWUL2

-- Test Case: Comp_ShToBAT_ErrorCleared
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShToBAT_ErrorCleared
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToBAT_Processing" for full processing of ShToBAT error, TS: Error cleared.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:99
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToBAT_ErrorConditionsDetected
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShToBAT_ErrorConditionsDetected
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToBAT_Processing" for full processing of ShToBAT error, TS: Error Conditions detected.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:499
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToBAT_ErrorConditionsDisappear
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShToBAT_ErrorConditionsDisappear
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToBAT_Processing" for full processing of ShToBAT error, TS: Error Conditions "disappear".
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToBAT_ErrorDematuring
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShToBAT_ErrorDematuring
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToBAT_Processing" for full processing of ShToBAT error, TS: Error Dematuring started.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:(10)1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:MACRO=SH_TO_BAT_DEMATURE_TIME
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:5900
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.END

-- Test Case: Comp_ShToBAT_ErrorDematuringInterrupted
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShToBAT_ErrorDematuringInterrupted
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToBAT_Processing" for full processing of ShToBAT error, TS: Error Dematuring interrupted (error condtions detected again).
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:5900
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:MACRO=SH_TO_BAT_DEMATURE_TIME
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.END

-- Test Case: Comp_ShToBAT_ErrorSet
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShToBAT_ErrorSet
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToBAT_Processing" for full processing of ShToBAT error, TS: Error set.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:MACRO=SH_TO_BAT_DEMATURE_TIME
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToBAT_ErrorStaysSet
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShToBAT_ErrorStaysSet
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToBAT_Processing" for full processing of ShToBAT error, TS: Error stays set.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.END

-- Test Case: Comp_ShToBAT_NoErrorConditions
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShToBAT_NoErrorConditions
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToBAT_Processing" for full processing of ShToBAT error, TS: Error Conditions still not detected.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0,1,0,1,0,1,0,1,0,1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToGND_DematureCntCheck
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShToGND_DematureCntCheck
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToGND_Processing" for full processing of ShToGND error, TS: Check Error Demature counter.
TEST.END_NOTES:
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:1
TEST.END

-- Test Case: Comp_ShToGND_ErrorConditionsDetected_PulseGenFinished
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShToGND_ErrorConditionsDetected_PulseGenFinished
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToGND_Processing" for full processing of ShToGND error, TS: Error Conditions still present after pulse generation finished.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:499
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToGND_ErrorConditionsDetected_PulseGenOngoing
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShToGND_ErrorConditionsDetected_PulseGenOngoing
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToGND_Processing" for full processing of ShToGND error, TS: Error Conditions detected while pulse generation is ongoing.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:70
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToGND_ErrorConditionsDisappear
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShToGND_ErrorConditionsDisappear
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToGND_Processing" for full processing of ShToGND error, TS: Error Conditions "disappear".
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToGND_ErrorSet
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShToGND_ErrorSet
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToGND_Processing" for full processing of ShToGND error, TS: Error Set.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:MACRO=SH_TO_GND_DEMATURE_VALID_PULSES
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToGND_ErrorStaysSet
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShToGND_ErrorStaysSet
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToGND_Processing" for full processing of ShToGND error, TS: Error stays set.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:MACRO=SH_TO_GND_DEMATURE_VALID_PULSES
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToGND_NoErrorConditions_PulseGenFinished
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShToGND_NoErrorConditions_PulseGenFinished
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToGND_Processing" for full processing of ShToGND error, TS: Pulse Generation finished, no error conditions detected.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToGND_NoErrorConditions_PulseGenOngoing
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShToGND_NoErrorConditions_PulseGenOngoing
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToGND_Processing" for full processing of ShToGND error, TS: Pulse Generation ongoing, no error conditions detected.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToGND_PulseGenNotStarted
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShToGND_PulseGenNotStarted
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToGND_Processing" for full processing of ShToGND error, TS: Pulse Generation still not started/requested.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShToGND_PulseGenStarted_CheckTimerNotElapsed
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShToGND_PulseGenStarted_CheckTimerNotElapsed
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL2_ShToGND_Processing" for full processing of ShToGND error, TS: Pulse Generation started/requested but error check timer not elapsed yet.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=SHORT_DET_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShTogether_ErrSet_WUL1_WUL2_PulsesDurationEqual
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShTogether_ErrSet_WUL1_WUL2_PulsesDurationEqual
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL1_WUL2_ShTogether_Processing" for full processing of Short-Bwetween-Wakeup-Lines error, TS: Error Set since both pulses have equal length.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=SHORT_DET_TIME
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortWUL
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortWUL
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShTogether_ErrSet_WUL1_WUL2_PulsesDuration_5ms
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShTogether_ErrSet_WUL1_WUL2_PulsesDuration_5ms
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL1_WUL2_ShTogether_Processing" for full processing of Short-Bwetween-Wakeup-Lines error, TS: Error Set since the difference between pulse duration is 5ms.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=SHORT_DET_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:745
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortWUL
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortWUL
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShTogether_ErrorCleared
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShTogether_ErrorCleared
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL1_WUL2_ShTogether_Processing" for full processing of Short-Bwetween-Wakeup-Lines error, TS: Error Clared.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=SHORT_DET_TIME
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShTogether_NoErrCond_WUL1PulseLongerThanWUL2Pulse
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShTogether_NoErrCond_WUL1PulseLongerThanWUL2Pulse
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL1_WUL2_ShTogether_Processing" for full processing of Short-Bwetween-Wakeup-Lines error, TS: WUL1 pulse length is greater than WUL2 pulse length, no error conditions detected.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=SHORT_DET_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:694
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShTogether_NoErrCond_WUL2PulseLongerThanWUL1Pulse
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShTogether_NoErrCond_WUL2PulseLongerThanWUL1Pulse
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL1_WUL2_ShTogether_Processing" for full processing of Short-Bwetween-Wakeup-Lines error, TS: WUL2 pulse length is greater than WUL1 pulse length, no error conditions detected.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=SHORT_DET_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShTogether_ProcessingStopped_WUL1_ShToBAT
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShTogether_ProcessingStopped_WUL1_ShToBAT
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL1_WUL2_ShTogether_Processing" for full processing of Short-Bwetween-Wakeup-Lines error, TS: Processing Stopped since ShToBAT detected on WUL1
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=SHORT_DET_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:1
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShTogether_ProcessingStopped_WUL1_ShToGND
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShTogether_ProcessingStopped_WUL1_ShToGND
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL1_WUL2_ShTogether_Processing" for full processing of Short-Bwetween-Wakeup-Lines error, TS: Processing Stopped since ShToGND detected on WUL1
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=SHORT_DET_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:1
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShTogether_ProcessingStopped_WUL2_ShToBAT
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShTogether_ProcessingStopped_WUL2_ShToBAT
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL1_WUL2_ShTogether_Processing" for full processing of Short-Bwetween-Wakeup-Lines error, TS: Processing Stopped since ShToBAT detected on WUL2
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=SHORT_DET_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:1
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShTogether_ProcessingStopped_WUL2_ShToGND
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShTogether_ProcessingStopped_WUL2_ShToGND
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL1_WUL2_ShTogether_Processing" for full processing of Short-Bwetween-Wakeup-Lines error, TS: Processing Stopped since ShToGND detected on WUL2
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=SHORT_DET_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:1
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShTogether_WUL1_PulseGenOngoing
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShTogether_WUL1_PulseGenOngoing
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL1_WUL2_ShTogether_Processing" for full processing of Short-Bwetween-Wakeup-Lines error, TS: WUL1 Pulse Generation ongoing, no error conditions detected.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=SHORT_DET_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:1
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShTogether_WUL1_WUL2_PulseGenOngoing
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShTogether_WUL1_WUL2_PulseGenOngoing
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL1_WUL2_ShTogether_Processing" for full processing of Short-Bwetween-Wakeup-Lines error, TS: WUL1 & WUL2 Pulse Generation ongoing, no error conditions detected.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=SHORT_DET_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:1
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:1
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Comp_ShTogether_WUL2_PulseGenOngoing
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:Comp_ShTogether_WUL2_PulseGenOngoing
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL2__WUL1_WUL2_ShTogether_Processing" for full processing of Short-Bwetween-Wakeup-Lines error, TS: WUL2 Pulse Generation ongoing, no error conditions detected.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=SHORT_DET_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:1
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:1
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToBAT_01_while_WULs_PermanentActive.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToBAT_01_while_WULs_PermanentActive.001
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that ShToBAT monitoring is stopped if WUL2 is in permanent active state
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:ScrDioPort.DioPortRead.return:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.END

-- Test Case: ShToBAT_01_while_WULs_PermanentActive.002
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToBAT_01_while_WULs_PermanentActive.002
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that ShToBAT monitoring is stopped if WUL1 is in permanent active state 
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:ScrDioPort.DioPortRead.return:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PERMA_ACTIVE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PERMA_ACTIVE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.END

-- Test Case: ShToBAT_01_while_WULs_PermanentActive.003
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToBAT_01_while_WULs_PermanentActive.003
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that ShToBAT monitoring is stopped if both WULs are in permanent active state (set by DID 0168)
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:ScrDioPort.DioPortRead.return:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PERMA_ACTIVE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PERMA_ACTIVE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.END

-- Test Case: ShToBAT_02_NoErrorConditions.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToBAT_02_NoErrorConditions.001
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToBAT monitoring if error conditions are not present (CS Line Old Status: 1, CS Line New Status: 0)
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToBAT_02_NoErrorConditions.002
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToBAT_02_NoErrorConditions.002
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToBAT monitoring if error conditions are not present (CS Line Old Status: 0, CS Line New Status: 1)
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToBAT_03_ErrorConditionsDetected
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToBAT_03_ErrorConditionsDetected
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToBAT monitoring if error conditions are detected but ShToBAT Fault still not set 
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToBAT_04_ErrorSet.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToBAT_04_ErrorSet.001
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToBAT monitoring if error conditions are present for more than 5sec and ShToBAT error is set.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:MACRO=SH_TO_BAT_DEMATURE_TIME
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToBAT_04_ErrorSet.002
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToBAT_04_ErrorSet.002
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToBAT monitoring if ShToBAT error was set and error conditions are still present.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:501
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:MACRO=SH_TO_BAT_DEMATURE_TIME
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToBAT_05_ErrorSet_DematuringNotStarted.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToBAT_05_ErrorSet_DematuringNotStarted.001
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToBAT monitoring if ShToBAT error was set, error conditions are no more present, but still no conditions for dematuring (CS Line Old Status: 1, CS Line New Status: 0).
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.END

-- Test Case: ShToBAT_05_ErrorSet_DematuringNotStarted.002
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToBAT_05_ErrorSet_DematuringNotStarted.002
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToBAT monitoring if ShToBAT error was set, error conditions are no more present, but still no conditions for dematuring (CS Line Old Status: 1, CS Line New Status: 1).
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.END

-- Test Case: ShToBAT_06_ErrorDematuringStarted
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToBAT_06_ErrorDematuringStarted
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToBAT monitoring if error was already set, but error conditions are not present anymore and dematuring started.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:1
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.END

-- Test Case: ShToBAT_07_ErrorCleared
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToBAT_07_ErrorCleared
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToBAT monitoring if error was already set, but error conditions are not present anymore, dematuring has finished and error is cleared.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_01_PulseGenNotStarted
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToGND_01_PulseGenNotStarted
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring while pulse generation is still not started (check timer is still uninit).
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=ShToGnd_ShTogether_CHECK_TIMER_UNINIT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_02_PulseGenStarted_CheckTimerNotElapsed.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToGND_02_PulseGenStarted_CheckTimerNotElapsed.001
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring when pulse generation has started and check timer decremented once.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=SHORT_DET_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:4
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_02_PulseGenStarted_CheckTimerNotElapsed.002
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToGND_02_PulseGenStarted_CheckTimerNotElapsed.002
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring when pulse generation has started but check timer not elapsed yet.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_03_NoErrorConditions.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToGND_03_NoErrorConditions.001
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring when pulse generation has started, check timer has elapsed and error conditions are not present (CS Line Old Status: 0, CS Line New Status: 1).
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_03_NoErrorConditions.002
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToGND_03_NoErrorConditions.002
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring when pulse generation has started, check timer has elapsed and error conditions are not present (CS Line Old Status: 1, CS Line New Status: 0).
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_03_NoErrorConditions.003
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToGND_03_NoErrorConditions.003
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring when pulse generation has finished and error conditions were not detected.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_03_NoErrorConditions.004
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToGND_03_NoErrorConditions.004
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring when pulse generation has finished, error conditions were detected for a while, but now are not present.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_04_ErrorConditionsDetected.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToGND_04_ErrorConditionsDetected.001
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring if error conditions are detected but ShToGND Fault still not set
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_04_ErrorConditionsDetected.002
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToGND_04_ErrorConditionsDetected.002
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring if error conditions are detected, error counter incremented, but ShToGND Fault still not set
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_05_ErrorSet.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToGND_05_ErrorSet.001
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring if error conditions are present for more than 5sec and ShToGND error is set.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:MACRO=EL_FAULT_TIME
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:MACRO=SH_TO_GND_DEMATURE_VALID_PULSES
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShToGND_05_ErrorSet.002
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShToGND_05_ErrorSet.002
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test ShToGND monitoring if ShToGND error was set and error conditions are still present.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:MACRO=SH_TO_GND_DEMATURE_VALID_PULSES
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShTogether_01_while_ShToBAT_on_WUL1
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShTogether_01_while_ShToBAT_on_WUL1
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that Short-Between-WULs is stopped if ShToBAT is set to WUL1 
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShTogether_01_while_ShToBAT_on_WUL2
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShTogether_01_while_ShToBAT_on_WUL2
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that Short-Between-WULs is stopped if ShToBAT is set to WUL1 
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShTogether_01_while_ShToBAT_on_WULBoth
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShTogether_01_while_ShToBAT_on_WULBoth
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that Short-Between-WULs is stopped if ShToBAT is set to WUL1 and WUL2
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortUBAT
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShTogether_01_while_ShToGND_on_WUL1
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShTogether_01_while_ShToGND_on_WUL1
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that Short-Between-WULs is stopped if ShToGND is set to WUL1 
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShTogether_01_while_ShToGND_on_WUL2
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShTogether_01_while_ShToGND_on_WUL2
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that Short-Between-WULs is stopped if ShToGND is set to WUL2 
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShTogether_01_while_ShToGND_on_WULBoth
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShTogether_01_while_ShToGND_on_WULBoth
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that Short-Between-WULs is stopped if ShToBATGND is set to WUL1 and WUL2
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortGND
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShTogether_02_while_OngoingPulseGen_on_WUL1
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShTogether_02_while_OngoingPulseGen_on_WUL1
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test Short-Between-WULs monitoring during ongoing pulse generation on WUL1
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:650
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:5
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:5
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:650
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShTogether_02_while_OngoingPulseGen_on_WUL2
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShTogether_02_while_OngoingPulseGen_on_WUL2
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test Short-Between-WULs monitoring during ongoing pulse generation on WUL2
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:650
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:1
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:5
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:5
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:650
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:1
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShTogether_02_while_OngoingPulseGen_on_WULBoth
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShTogether_02_while_OngoingPulseGen_on_WULBoth
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test Short-Between-WULs monitoring during ongoing pulse generation on WUL1 and WUL2
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:650
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:650
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:1
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:5
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:5
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:650
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:650
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:1
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShTogether_03_NoErrorConditions.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShTogether_03_NoErrorConditions.001
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test Short-Between-WULs monitoring if error conditions are not present (WUL1 PulseLen > WUL2 PulseLen)
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:5
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:5
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:750
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:700
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShTogether_03_NoErrorConditions.002
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShTogether_03_NoErrorConditions.002
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test Short-Between-WULs monitoring if error conditions are not present (WUL2 PulseLen > WUL1 PulseLen)
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:5
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:5
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShTogether_03_NoErrorConditions.003
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShTogether_03_NoErrorConditions.003
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test Short-Between-WULs monitoring if error conditions are present for a single pulse only and error is still not set
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:6
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:6
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:5
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:750
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShTogether_03_NoErrorConditions.004
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShTogether_03_NoErrorConditions.004
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test Short-Between-WULs monitoring if error conditions are not present: Both pulses have started together, but the length difference between them is higher than 5ms.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:5
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:5
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShTogether_03_NoErrorConditions.005
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShTogether_03_NoErrorConditions.005
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test Short-Between-WULs monitoring if error conditions are not present: Both pulses have the same length, but did not start together.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:7
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:760
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:760
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:5
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:7
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:760
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:760
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShTogether_04_ErrorSet
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShTogether_04_ErrorSet
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test Short-Between-WULs monitoring if error conditions are present for at least 2 consequtive pulses and error is set
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:5
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortWUL
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortWUL
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShTogether_ErrorCnt:2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:2
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:5
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:5
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:750
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: ShTogether_05_ErrorCleared
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrHndlEthLineShortMonWUL2
TEST.NEW
TEST.NAME:ShTogether_05_ErrorCleared
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test Short-Between-WULs monitoring if error was already set, but error conditions are not present anymore and error is cleared.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:MACRO=ShortWUL
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:MACRO=ShortWUL
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=TRUE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1:1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2LineStatus:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WULSignalLogicLevels:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_DematureCnt_WUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.bCheck_ShortBetweenWULs:MACRO=FALSE
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToBAT_DematureCnt_WUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:700
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:750
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.STUB_VAL_USER_CODE:ScrDioPort.DioPortRead.return
<<ScrDioPort.DioPortRead.return>> = ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> );
TEST.END_STUB_VAL_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old
{{ <<ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old>> == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Subprogram: ScrIsWakeupDiagRequested

-- Test Case: Comp_ShToGND_WUL1_GenPulseRequest
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:Comp_ShToGND_WUL1_GenPulseRequest
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL1_ShToGND_Processing" for full processing of ShToGND error, TS: New Pulse generation started/requested.
TEST.END_NOTES:
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenBothWUL
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL_BOTH
TEST.END

-- Test Case: Comp_ShToGND_WUL2_GenPulseRequest
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:Comp_ShToGND_WUL2_GenPulseRequest
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Used in compound test "ScrHndlEthLineShortMonWUL1__WUL2_ShToGND_Processing" for full processing of ShToGND error, TS: New Pulse generation started/requested.
TEST.END_NOTES:
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenWUL2
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL2
TEST.END

-- Test Case: KeepSwitchAwake
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:KeepSwitchAwake
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether the switch is kept awake if there is such a request
TEST.END_NOTES:
TEST.STUB:ScrWakeupEcu.ScrKeepSwitchAwake
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenKeepSwitchAwake
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrWakeupEcu.c.ScrKeepSwitchAwake
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: KeepSwitchAwakeOff
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:KeepSwitchAwakeOff
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether the switch is kept awake if there is such a request
TEST.END_NOTES:
TEST.STUB:ScrWakeupEcu.ScrResetPmicHandler
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenKeepSwitchAwakeOff
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrWakeupEcu.c.ScrResetPmicHandler
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_GenWU_BlpaReq
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_GenWU_BlpaReq
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test checks that WU pattern is generated on WUL1 if such was requested from BLPA
TEST.END_NOTES:
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenWUL1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL1
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_AlreadyPermaActive_ReleaseWULs.001
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_AlreadyPermaActive_ReleaseWULs.001
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether both WUL are released from perma HIGH due to no active diag req
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenWUL1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=WU_PERMA_ACTIVE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:MACRO=WU_PERMA_ACTIVE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:1
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g12OUT_WAKE1,MACRO=g1OUT_WAKE2
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:(2)0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_AlreadyPermaActive_ReleaseWULs.002
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_AlreadyPermaActive_ReleaseWULs.002
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether both WUL are released from perma HIGH due to no active diag req
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenWUL1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenWULPulseDiag:MACRO=GenWULPulse_NoActDiagReq
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:MACRO=WU_PERMA_ACTIVE
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:1
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g12OUT_WAKE1,MACRO=g1OUT_WAKE2
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:(2)0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test checks that single pulse is generated if such was requested by RID 025A
TEST.END_NOTES:
TEST.STUB:BrsHw.BrsHwDisableInterrupt
TEST.STUB:BrsHw.BrsHwRestoreInterrupt
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL_BOTH
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  BrsHw.c.BrsHwDisableInterrupt
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  BrsHw.c.BrsHwRestoreInterrupt
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq_OngoingPulseWUL1
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq_OngoingPulseWUL1
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test checks that single pulse is NOT generated immediately on RID 025A request if another pulse is currently ongoing on WUL1
TEST.END_NOTES:
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq_OngoingPulseWUL2
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq_OngoingPulseWUL2
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test checks that single pulse is NOT generated immediately on RID 025A request if another pulse is currently ongoing on WUL2
TEST.END_NOTES:
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq_OngoingPulseWULBoth
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq_OngoingPulseWULBoth
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test checks that single pulse is NOT generated immediately on RID 025A request if another pulse is currently ongoing on both WULs
TEST.END_NOTES:
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq_PulseValidationInProgressWUL1
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq_PulseValidationInProgressWUL1
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test checks that single pulse is NOT generated immediately on RID 025A request if external pulse validation on WUL1 is not yet completed.
TEST.END_NOTES:
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq_PulseValidationInProgressWUL2
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq_PulseValidationInProgressWUL2
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test checks that single pulse is NOT generated immediately on RID 025A request if external pulse validation on WUL2 is not yet completed.
TEST.END_NOTES:
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq_PulseValidationInProgressWULBoth
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq_PulseValidationInProgressWULBoth
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test checks that single pulse is NOT generated immediately on RID 025A request if external pulse validations on th WULs are not yet completed.
TEST.END_NOTES:
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq_WUL1_Busy
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq_WUL1_Busy
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test checks that single pulse is NOT generated immediately on RID 025A request if there is an external pulse ongoing on WUL1.
TEST.END_NOTES:
TEST.STUB:BrsHw.BrsHwDisableInterrupt
TEST.STUB:BrsHw.BrsHwRestoreInterrupt
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  BrsHw.c.BrsHwDisableInterrupt
  BrsHw.c.BrsHwRestoreInterrupt
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq_WUL1_WUL2_Busy
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq_WUL1_WUL2_Busy
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test checks that single pulse is NOT generated immediately on RID 025A request if there are external pulses ongoing on both: WUL1 and WUL2.
TEST.END_NOTES:
TEST.STUB:BrsHw.BrsHwDisableInterrupt
TEST.STUB:BrsHw.BrsHwRestoreInterrupt
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  BrsHw.c.BrsHwDisableInterrupt
  BrsHw.c.BrsHwRestoreInterrupt
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq_WUL2_Busy
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_GenSinglePulseWULxDiag_DiagReq_WUL2_Busy
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test checks that single pulse is NOT generated immediately on RID 025A request if there is an external pulse ongoing on WUL2.
TEST.END_NOTES:
TEST.STUB:BrsHw.BrsHwDisableInterrupt
TEST.STUB:BrsHw.BrsHwRestoreInterrupt
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenSinglePulseWULxDiag
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  BrsHw.c.BrsHwDisableInterrupt
  BrsHw.c.BrsHwRestoreInterrupt
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_GenWU_BlpaReq
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_GenWU_BlpaReq
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test checks that WU pattern is generated on both: WUL1 and WUL2 if this was requested from BLPA
TEST.END_NOTES:
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenBothWUL
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL_BOTH
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_GenWU_BlpaReq_and_TriggerSwitch
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_GenWU_BlpaReq_and_TriggerSwitch
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test checks that WU pattern is generated on both: WUL1 and WUL2 and Eth switch is triggered if this was requested from BLPA 
TEST.END_NOTES:
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.STUB:ScrWakeupEcu.ScrKeepSwitchAwake
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenBothWULAndTriggerSwitch
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL_BOTH
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrWakeupEcu.c.ScrKeepSwitchAwake
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_GenWU_InvalidBlpaReq
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_GenWU_InvalidBlpaReq
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test checks that WU pattern is NOT generated neither on WUL1 nor on WUL2 in case of invalid/unsupported request from BLPA
TEST.END_NOTES:
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:0x66
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:0x66
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_NotPermaActive_ExtPulsePresent
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_NotPermaActive_ExtPulsePresent
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether both WUL are not set to perma HIGH due to a present external pulse
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenPermanentDiagHighAllWUL
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrWakeUpDetection.c.WupGetData
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_NotPermaActive_WUL1_Busy
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_NotPermaActive_WUL1_Busy
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether both WUL are not set to perma HIGH due to WUL1 being busy
TEST.END_NOTES:
TEST.STUB:BrsHw.BrsHwDisableInterrupt
TEST.STUB:BrsHw.BrsHwRestoreInterrupt
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenPermanentDiagHighAllWUL
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrWakeUpDetection.c.WupGetData
  BrsHw.c.BrsHwDisableInterrupt
  BrsHw.c.BrsHwRestoreInterrupt
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_NotPermaActive_WUL2_Busy
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_NotPermaActive_WUL2_Busy
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether both WUL are not set to perma HIGH due to WUL2 being busy
TEST.END_NOTES:
TEST.STUB:BrsHw.BrsHwDisableInterrupt
TEST.STUB:BrsHw.BrsHwRestoreInterrupt
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenPermanentDiagHighAllWUL
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:1
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrWakeUpDetection.c.WupGetData
  BrsHw.c.BrsHwDisableInterrupt
  BrsHw.c.BrsHwRestoreInterrupt
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_PermaActive_DiagReq
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL1_WUL2_PermaActive_DiagReq
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test that checks whether both WUL are set to perma HIGH due to Tricore diag request
TEST.END_NOTES:
TEST.STUB:BrsHw.BrsHwDisableInterrupt
TEST.STUB:BrsHw.BrsHwRestoreInterrupt
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenPermanentDiagHighAllWUL
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL_DIAG_HIGH_ALL
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrWakeUpDetection.c.WupGetData
  BrsHw.c.BrsHwDisableInterrupt
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  BrsHw.c.BrsHwRestoreInterrupt
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Test Case: WUL2_GenWU_BlpaReq
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrIsWakeupDiagRequested
TEST.NEW
TEST.NAME:WUL2_GenWU_BlpaReq
TEST.NOTES:
DESCRIPTION:   Routine foe handling diagnostic reqs from Tricore to generate the wakeup patterns on WUL1 or WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Test checks that WU pattern is generated on WUL2 if such was requested from BLPA
TEST.END_NOTES:
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:MACRO=GenWUL2
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IgnoreDiagReqGenWulPattern:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenerateWakeup:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.IsDiagReqWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL2
TEST.FLOW
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrGenEthWULPulse.c.ScrIsWakeupDiagRequested
TEST.END_FLOW
TEST.END

-- Subprogram: ScrStartEthLineShortMon

-- Test Case: InvalidWUL
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrStartEthLineShortMon
TEST.NEW
TEST.NAME:InvalidWUL
TEST.NOTES:
DESCRIPTION:   Start monitoring the Ethernet wake-up lines

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that Ethernet wake-up line monitoring for El.Faults does not start if an invalid channel is passed
TEST.END_NOTES:
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL_BOTH
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL_BOTH
TEST.END

-- Test Case: WUL1_GenTimer_Expired_ShToGND_condAlreadyDetected
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrStartEthLineShortMon
TEST.NEW
TEST.NAME:WUL1_GenTimer_Expired_ShToGND_condAlreadyDetected
TEST.NOTES:
DESCRIPTION:   Start monitoring the Ethernet wake-up lines

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that Ethernet WUL1 monitoring for El.Faults starts if the pulse generation timer has expired and Sh-To-GND conditions have been detected before

TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:ScrDioPort.DioPortRead.return:(2)0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL1
TEST.END

-- Test Case: WUL1_GenTimer_Expired_ShToGND_condStillNotDetected
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrStartEthLineShortMon
TEST.NEW
TEST.NAME:WUL1_GenTimer_Expired_ShToGND_condStillNotDetected
TEST.NOTES:
DESCRIPTION:   Start monitoring the Ethernet wake-up lines

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that Ethernet WUL1 monitoring for El.Faults starts if the pulse generation timer has expired and Sh-To-GND conditions are detected for the first time
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:ScrDioPort.DioPortRead.return:(2)0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1,MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:MACRO=SHORT_DET_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL1
TEST.END

-- Test Case: WUL1_GenTimer_NotExpired
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrStartEthLineShortMon
TEST.NEW
TEST.NAME:WUL1_GenTimer_NotExpired
TEST.NOTES:
DESCRIPTION:   Start monitoring the Ethernet wake-up lines

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that Ethernet WUL1 monitoring for El.Faults does not start if the pulse generation timer has not expired yet
TEST.END_NOTES:
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL1
TEST.END

-- Test Case: WUL2_GenTimer_Expired_ShToGND_condAlreadyDetected
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrStartEthLineShortMon
TEST.NEW
TEST.NAME:WUL2_GenTimer_Expired_ShToGND_condAlreadyDetected
TEST.NOTES:
DESCRIPTION:   Start monitoring the Ethernet wake-up lines

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that Ethernet WUL2 monitoring for El.Faults starts if the pulse generation timer has expired and Sh-To-GND conditions have been detected before
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:ScrDioPort.DioPortRead.return:(2)0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:1
TEST.VALUE:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2,MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL2
TEST.END

-- Test Case: WUL2_GenTimer_Expired_ShToGND_condStillNotDetected
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrStartEthLineShortMon
TEST.NEW
TEST.NAME:WUL2_GenTimer_Expired_ShToGND_condStillNotDetected
TEST.NOTES:
DESCRIPTION:   Start monitoring the Ethernet wake-up lines

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that Ethernet WUL2 monitoring for El.Faults starts if the pulse generation timer has expired and Sh-To-GND conditions are detected for the first time
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.VALUE:ScrDioPort.DioPortRead.return:(2)0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2,MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:MACRO=SHORT_DET_TIME
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL2
TEST.END

-- Test Case: WUL2_GenTimer_NotExpired
TEST.UNIT:ScrGenEthWULPulse
TEST.SUBPROGRAM:ScrStartEthLineShortMon
TEST.NEW
TEST.NAME:WUL2_GenTimer_NotExpired
TEST.NOTES:
DESCRIPTION:   Start monitoring the Ethernet wake-up lines

PARAMETERS:    uint8 EthWUchannel

RETURN VALUE:  void

TEST CASE:     Test that Ethernet WUL1 monitoring for El.Faults does not start if the pulse generation timer has not expired yet
TEST.END_NOTES:
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.VALUE:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.VALUE:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.GenTimerWUL2:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL1MonShToBAT_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2Mon_StatusNCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.WUL2MonShToBAT_StatusCS_Old:1
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ShTogether_CheckTimerWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL1:0
TEST.EXPECTED:ScrGenEthWULPulse.<<GLOBAL>>.ShToGND_ErrorCntWUL2:0
TEST.EXPECTED:ScrGenEthWULPulse.ScrStartEthLineShortMon.EthWUchannel:MACRO=WUL2
TEST.END

-- Unit: ScrMain

-- Subprogram: Scr10msTask

-- Test Case: Scr10msTask_Execution
TEST.UNIT:ScrMain
TEST.SUBPROGRAM:Scr10msTask
TEST.NEW
TEST.NAME:Scr10msTask_Execution
TEST.NOTES:
DESCRIPTION:   Testing Main task routines.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that ScrAliveCounter does not increment after ScrStateMngmtTask10 and ScrGenEthWULTask10 execution.
TEST.END_NOTES:
TEST.STUB:ScrGenEthWULPulse.ScrGenEthWULTask10
TEST.STUB:ScrStateMngmt.ScrStateMngmtTask10
TEST.FLOW
  ScrMain.c.Scr10msTask
  ScrStateMngmt.c.ScrStateMngmtTask10
  ScrGenEthWULPulse.c.ScrGenEthWULTask10
  ScrMain.c.Scr10msTask
TEST.END_FLOW
TEST.END

-- Subprogram: Scr1msTask

-- Test Case: Scr1msTask_Execution_IndicateScrAliveness
TEST.UNIT:ScrMain
TEST.SUBPROGRAM:Scr1msTask
TEST.NEW
TEST.NAME:Scr1msTask_Execution_IndicateScrAliveness
TEST.NOTES:
DESCRIPTION:   Testing Main task routines.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that ScrAliveCounter increments after ScrWakeupHndlTask1 and ScrEcuResetHndlTask1 execution, indicating SCR aliveness to Tricore.
TEST.END_NOTES:
TEST.STUB:ScrEcuResetHndl.ScrEcuResetHndlTask1
TEST.STUB:ScrWakeupHndl.ScrWakeupHndlTask1
TEST.VALUE:ScrMain.<<GLOBAL>>.ScrAliveCounter:0
TEST.EXPECTED:ScrMain.<<GLOBAL>>.ScrAliveCounter:1
TEST.FLOW
  ScrMain.c.Scr1msTask
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrEcuResetHndl.c.ScrEcuResetHndlTask1
  ScrMain.c.Scr1msTask
TEST.END_FLOW
TEST.END

-- Subprogram: Scr50msTask

-- Test Case: Scr50msTask_Execution
TEST.UNIT:ScrMain
TEST.SUBPROGRAM:Scr50msTask
TEST.NEW
TEST.NAME:Scr50msTask_Execution
TEST.NOTES:
DESCRIPTION:   Testing Main task routines.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that ScrAliveCounter does not increment after ScrWakeupEcuTask50 execution.
TEST.END_NOTES:
TEST.STUB:ScrWakeupEcu.ScrWakeupEcuTask50
TEST.FLOW
  ScrMain.c.Scr50msTask
  ScrWakeupEcu.c.ScrWakeupEcuTask50
  ScrMain.c.Scr50msTask
TEST.END_FLOW
TEST.END

-- Unit: ScrStateMngmt

-- Subprogram: ScrStateMngmtStandby

-- Test Case: ScrStateMngmtStandby_TricoreNotStandby
TEST.UNIT:ScrStateMngmt
TEST.SUBPROGRAM:ScrStateMngmtStandby
TEST.NEW
TEST.NAME:ScrStateMngmtStandby_TricoreNotStandby
TEST.NOTES:
DESCRIPTION:   Start setting the SCR state to standby.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if Tricore is not in STANDBY mode, SCR state is not set to STANDBY.
TEST.END_NOTES:
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.ScrState:NORMAL
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.ScrState:NORMAL
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:0
TEST.FLOW
  ScrStateMngmt.c.ScrStateMngmtStandby
  ScrStateMngmt.c.ScrStateMngmtStandby
TEST.END_FLOW
TEST.END

-- Test Case: ScrStateMngmtStandby_TricoreStandby_NoTransitionFromNormal
TEST.UNIT:ScrStateMngmt
TEST.SUBPROGRAM:ScrStateMngmtStandby
TEST.NEW
TEST.NAME:ScrStateMngmtStandby_TricoreStandby_NoTransitionFromNormal
TEST.NOTES:
DESCRIPTION:   Start setting the SCR state to standby.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if Tricore is in STANDBY mode, SCR state is also set to STANDBY. In case of transition from state other than NORMAL to STANDBY, gbNormalToStbyTransition flag shall NOT be set.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.SetDioPortsForSleepOperation
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.ScrState:SLEEP
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.gbNormalToStbyTransition:MACRO=FALSE
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.ScrState:STANDBY
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:MACRO=RUN_OUT_TIME
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.gbNormalToStbyTransition:MACRO=FALSE
TEST.FLOW
  ScrStateMngmt.c.ScrStateMngmtStandby
  ScrDioPort.c.SetDioPortsForSleepOperation
  ScrStateMngmt.c.ScrStateMngmtStandby
TEST.END_FLOW
TEST.END

-- Test Case: ScrStateMngmtStandby_TricoreStandby_TransitionFromNormal
TEST.UNIT:ScrStateMngmt
TEST.SUBPROGRAM:ScrStateMngmtStandby
TEST.NEW
TEST.NAME:ScrStateMngmtStandby_TricoreStandby_TransitionFromNormal
TEST.NOTES:
DESCRIPTION:   Start setting the SCR state to standby.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if Tricore is in STANDBY mode, SCR state is also set to STANDBY. In case of transition from NORMAL to STANDBY, gbNormalToStbyTransition flag shall be set.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.SetDioPortsForSleepOperation
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.ScrState:NORMAL
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.gbNormalToStbyTransition:MACRO=FALSE
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.ScrState:STANDBY
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:MACRO=RUN_OUT_TIME
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.gbNormalToStbyTransition:MACRO=TRUE
TEST.FLOW
  ScrStateMngmt.c.ScrStateMngmtStandby
  ScrDioPort.c.SetDioPortsForSleepOperation
  ScrStateMngmt.c.ScrStateMngmtStandby
TEST.END_FLOW
TEST.END

-- Subprogram: ScrStateMngmtTask10

-- Test Case: Comp_ScrStateMngmtTask10_ScrState_Normal
TEST.UNIT:ScrStateMngmt
TEST.SUBPROGRAM:ScrStateMngmtTask10
TEST.NEW
TEST.NAME:Comp_ScrStateMngmtTask10_ScrState_Normal
TEST.NOTES:
DESCRIPTION:   Start Main state management routine.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if ScrState is INITIALISED and Tricore standby mode is not entered, SCR lowpower mode is not triggered.
TEST.END_NOTES:
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.ScrState:NORMAL
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.ScrState:NORMAL
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.FLOW
  ScrStateMngmt.c.ScrStateMngmtTask10
  ScrStateMngmt.c.ScrStateMngmtTask10
TEST.END_FLOW
TEST.END

-- Test Case: Comp_ScrStateMngmtTask10_ScrState_NormalToStandby
TEST.UNIT:ScrStateMngmt
TEST.SUBPROGRAM:ScrStateMngmtTask10
TEST.NEW
TEST.NAME:Comp_ScrStateMngmtTask10_ScrState_NormalToStandby
TEST.NOTES:
DESCRIPTION:   Start Main state management routine.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if ScrState is INITIALISED and Tricore standby mode is entered, SCR lowpower mode is triggered.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:1
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.ScrState:NORMAL
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.gbNormalToStbyTransition:MACRO=FALSE
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_KL30_FLTR_SCR_AD_EN
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.ScrState:STANDBY
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:500
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.gbNormalToStbyTransition:MACRO=TRUE
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0x0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.FLOW
  ScrStateMngmt.c.ScrStateMngmtTask10
  ScrDioPort.c.DioPortWrite
  ScrStateMngmt.c.ScrStateMngmtTask10
TEST.END_FLOW
TEST.END

-- Test Case: Comp_ScrStateMngmtTask10_ScrState_Sleep
TEST.UNIT:ScrStateMngmt
TEST.SUBPROGRAM:ScrStateMngmtTask10
TEST.NEW
TEST.NAME:Comp_ScrStateMngmtTask10_ScrState_Sleep
TEST.NOTES:
DESCRIPTION:   Start Main state management routine.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if ScrState is SLEEP and Tricore in normal mode, ScrState is set to NORMAL.
TEST.END_NOTES:
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.ScrState:SLEEP
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:2
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.ScrState:SLEEP
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:2
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.FLOW
  ScrStateMngmt.c.ScrStateMngmtTask10
  ScrStateMngmt.c.ScrStateMngmtTask10
TEST.END_FLOW
TEST.END

-- Test Case: Comp_ScrStateMngmtTask10_ScrState_SleepToNormal
TEST.UNIT:ScrStateMngmt
TEST.SUBPROGRAM:ScrStateMngmtTask10
TEST.NEW
TEST.NAME:Comp_ScrStateMngmtTask10_ScrState_SleepToNormal
TEST.NOTES:
DESCRIPTION:   Start Main state management routine.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if ScrState is SLEEP and Tricore not in normal mode, ScrState is not set to NORMAL.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:1
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:1
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.ScrState:SLEEP
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:1
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PCON.B.IDLE:1
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:1
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:1
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_KL30_FLTR_SCR_AD_EN
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:1
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.ScrState:NORMAL
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0xC7
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PCON.B.IDLE:1
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.FLOW
  ScrStateMngmt.c.ScrStateMngmtTask10
  ScrDioPort.c.DioPortWrite
  ScrStateMngmt.c.ScrStateMngmtTask10
TEST.END_FLOW
TEST.END

-- Test Case: Comp_ScrStateMngmtTask10_ScrState_Standby
TEST.UNIT:ScrStateMngmt
TEST.SUBPROGRAM:ScrStateMngmtTask10
TEST.NEW
TEST.NAME:Comp_ScrStateMngmtTask10_ScrState_Standby
TEST.NOTES:
DESCRIPTION:   Start Main state management routine.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if ScrState is STANDBY and RunOutTimeCnt is not 0 (Zero), ScrState is not set to SLEEP.
TEST.END_NOTES:
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.ScrState:STANDBY
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:2
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.ScrState:STANDBY
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:1
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.END

-- Test Case: Comp_ScrStateMngmtTask10_ScrState_StandbyToSleep
TEST.UNIT:ScrStateMngmt
TEST.SUBPROGRAM:ScrStateMngmtTask10
TEST.NEW
TEST.NAME:Comp_ScrStateMngmtTask10_ScrState_StandbyToSleep
TEST.NOTES:
DESCRIPTION:   Start Main state management routine.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if ScrState is STANDBY and RunOutTimeCnt is 0 (Zero), ScrState is set to SLEEP.
TEST.END_NOTES:
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:1
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.ScrState:STANDBY
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:1
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PCON.B.IDLE:1
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:1
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:1
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.ScrState:SLEEP
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0xC7
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PCON.B.IDLE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:1
TEST.FLOW
  ScrStateMngmt.c.ScrStateMngmtTask10
  ScrStateMngmt.c.ScrStateMngmtTask10
TEST.END_FLOW
TEST.END

-- Test Case: Comp_ScrStateMngmtTask10_ScrState_Standby_5sec
TEST.UNIT:ScrStateMngmt
TEST.SUBPROGRAM:ScrStateMngmtTask10
TEST.NEW
TEST.NAME:Comp_ScrStateMngmtTask10_ScrState_Standby_5sec
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Start Main state management routine.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if ScrState is STANDBY and RunOutTimeCnt is not 0 (Zero), ScrState is not set to SLEEP.
TEST.END_NOTES:
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.ScrState:STANDBY
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.ScrState:STANDBY
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.END

-- Test Case: Comp_ScrStateMngmtTask10_ScrState_Standby_OnEntryFromNormal
TEST.UNIT:ScrStateMngmt
TEST.SUBPROGRAM:ScrStateMngmtTask10
TEST.NEW
TEST.NAME:Comp_ScrStateMngmtTask10_ScrState_Standby_OnEntryFromNormal
TEST.NOTES:
DESCRIPTION:   Start Main state management routine.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if ScrState STANDBY is entered as a transition from NORMAL INH pins will be polled to detect and handle late wakeup events.
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.Multiplexer
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.WUL2Wakeup:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.WUL1Wakeup:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.ScrState:STANDBY
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:500
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.gbNormalToStbyTransition:MACRO=TRUE
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.ScrState:STANDBY
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:499
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.gbNormalToStbyTransition:MACRO=FALSE
TEST.FLOW
  ScrStateMngmt.c.ScrStateMngmtTask10
  ScrWakeUpDetection.c.Multiplexer
  ScrStateMngmt.c.ScrStateMngmtTask10
TEST.END_FLOW
TEST.END

-- Test Case: Comp_ScrStateMngmtTask10_ScrState_Standby_OnEntryFromNormal_EthWul1_WakeEvent
TEST.UNIT:ScrStateMngmt
TEST.SUBPROGRAM:ScrStateMngmtTask10
TEST.NEW
TEST.NAME:Comp_ScrStateMngmtTask10_ScrState_Standby_OnEntryFromNormal_EthWul1_WakeEvent
TEST.NOTES:
DESCRIPTION:   Start Main state management routine.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that, if ScrState STANDBY is entered as a transition from NORMAL and there is an unprocessed ETH WUL event, SCR will restart PMIC WAK pulse and restore FirstWakeup var.
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.Multiplexer
TEST.STUB:ScrWakeupEcu.ScrResetPmicHandler
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.WUL2Wakeup:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.WUL1Wakeup:MACRO=ETH_WAK_FLAG
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.ScrState:STANDBY
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:500
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.gbNormalToStbyTransition:MACRO=TRUE
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.gbRestartPMICWakPulse:MACRO=FALSE
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.WUL2Wakeup:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.WUL1Wakeup:MACRO=ETH_WAK_FLAG
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:MACRO=ETH_WUL1
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.ScrState:STANDBY
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:499
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.gbNormalToStbyTransition:MACRO=FALSE
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.gbRestartPMICWakPulse:MACRO=TRUE
TEST.FLOW
  ScrStateMngmt.c.ScrStateMngmtTask10
  ScrWakeupEcu.c.ScrResetPmicHandler
  ScrStateMngmt.c.ScrStateMngmtTask10
TEST.END_FLOW
TEST.END

-- Test Case: Comp_ScrStateMngmtTask10_ScrState_Standby_OnEntryFromNormal_EthWul2_WakeEvent
TEST.UNIT:ScrStateMngmt
TEST.SUBPROGRAM:ScrStateMngmtTask10
TEST.NEW
TEST.NAME:Comp_ScrStateMngmtTask10_ScrState_Standby_OnEntryFromNormal_EthWul2_WakeEvent
TEST.NOTES:
DESCRIPTION:   Start Main state management routine.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that, if ScrState STANDBY is entered as a transition from NORMAL and there is an unprocessed ETH WUL event, SCR will restart PMIC WAK pulse and restore FirstWakeup var.
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.Multiplexer
TEST.STUB:ScrWakeupEcu.ScrResetPmicHandler
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.WUL2Wakeup:MACRO=ETH_WAK_FLAG
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.WUL1Wakeup:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.ScrState:STANDBY
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:500
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.gbNormalToStbyTransition:MACRO=TRUE
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.gbRestartPMICWakPulse:MACRO=FALSE
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.WUL2Wakeup:MACRO=ETH_WAK_FLAG
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.WUL1Wakeup:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:MACRO=ETH_WUL2
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.ScrState:STANDBY
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:499
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.gbNormalToStbyTransition:MACRO=FALSE
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.gbRestartPMICWakPulse:MACRO=TRUE
TEST.FLOW
  ScrStateMngmt.c.ScrStateMngmtTask10
  ScrWakeupEcu.c.ScrResetPmicHandler
  ScrStateMngmt.c.ScrStateMngmtTask10
TEST.END_FLOW
TEST.END

-- Test Case: Comp_ScrStateMngmtTask10_ScrState_Standby_OnEntryFromNormal_TricoreNotStandby
TEST.UNIT:ScrStateMngmt
TEST.SUBPROGRAM:ScrStateMngmtTask10
TEST.NEW
TEST.NAME:Comp_ScrStateMngmtTask10_ScrState_Standby_OnEntryFromNormal_TricoreNotStandby
TEST.NOTES:
DESCRIPTION:   Start Main state management routine.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if ScrState STANDBY is entered as a transition from NORMAL INH pins will not be polled, if Aurix has exited Standby mode.
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.Multiplexer
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.WUL2Wakeup:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.WUL1Wakeup:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.ScrState:STANDBY
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:500
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.gbNormalToStbyTransition:MACRO=TRUE
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.ScrState:STANDBY
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:499
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.gbNormalToStbyTransition:MACRO=FALSE
TEST.FLOW
  ScrStateMngmt.c.ScrStateMngmtTask10
  ScrStateMngmt.c.ScrStateMngmtTask10
TEST.END_FLOW
TEST.END

-- Test Case: Comp_ScrStateMngmtTask10_ScrState_Standby_WAKPulseRestart
TEST.UNIT:ScrStateMngmt
TEST.SUBPROGRAM:ScrStateMngmtTask10
TEST.NEW
TEST.NAME:Comp_ScrStateMngmtTask10_ScrState_Standby_WAKPulseRestart
TEST.NOTES:
DESCRIPTION:   Start Main state management routine.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if SCR WAK pulse to PMIC needs to be restarted, ScrWupCallback() will be called
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.Multiplexer
TEST.STUB:ScrWakeupEcu.ScrWupCallback
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.ScrState:STANDBY
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:500
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.gbNormalToStbyTransition:MACRO=FALSE
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.gbRestartPMICWakPulse:MACRO=TRUE
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.ScrState:STANDBY
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:499
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.gbNormalToStbyTransition:MACRO=FALSE
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.gbRestartPMICWakPulse:MACRO=FALSE
TEST.FLOW
  ScrStateMngmt.c.ScrStateMngmtTask10
  ScrWakeupEcu.c.ScrWupCallback
  ScrStateMngmt.c.ScrStateMngmtTask10
TEST.END_FLOW
TEST.END

-- Test Case: ScrStateMngmtTask10_ScrNoState
TEST.UNIT:ScrStateMngmt
TEST.SUBPROGRAM:ScrStateMngmtTask10
TEST.NEW
TEST.NAME:ScrStateMngmtTask10_ScrNoState
TEST.NOTES:
DESCRIPTION:   Start Main state management routine.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if ScrState is not from ENUM, ScrStateMngmtTask10 does not continue execution.
TEST.END_NOTES:
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.ScrState:5
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.ScrState:5
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.FLOW
  ScrStateMngmt.c.ScrStateMngmtTask10
  ScrStateMngmt.c.ScrStateMngmtTask10
TEST.END_FLOW
TEST.END

-- Test Case: ScrStateMngmtTask10_ScrStateUninit
TEST.UNIT:ScrStateMngmt
TEST.SUBPROGRAM:ScrStateMngmtTask10
TEST.NEW
TEST.NAME:ScrStateMngmtTask10_ScrStateUninit
TEST.NOTES:
DESCRIPTION:   Start Main state management routine.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if ScrState is UNINIT, ScrStateMngmtTask10 does not continue execution.
TEST.END_NOTES:
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.ScrState:UNINIT
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.ScrState:UNINIT
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.FLOW
  ScrStateMngmt.c.ScrStateMngmtTask10
  ScrStateMngmt.c.ScrStateMngmtTask10
TEST.END_FLOW
TEST.END

-- Test Case: ScrStateMngmtTask10_ScrState_InitializedToNormal
TEST.UNIT:ScrStateMngmt
TEST.SUBPROGRAM:ScrStateMngmtTask10
TEST.NEW
TEST.NAME:ScrStateMngmtTask10_ScrState_InitializedToNormal
TEST.NOTES:
DESCRIPTION:   Start Main state management routine.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Check that if ScrState is INITIALISED, ScrState changes to NORMAL.
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.ScrState:INITIALISED
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:2
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:0
TEST.VALUE:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_KL30_FLTR_SCR_AD_EN
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_PAGE.B.PAGE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.FirstWakeup:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.ScrState:NORMAL
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.RunOutTimeCnt:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCWAKE:0
TEST.EXPECTED:ScrStateMngmt.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.FLOW
  ScrStateMngmt.c.ScrStateMngmtTask10
  ScrDioPort.c.DioPortWrite
  ScrStateMngmt.c.ScrStateMngmtTask10
TEST.END_FLOW
TEST.END

-- Unit: ScrWakeUpDetection

-- Subprogram: Ext0IntWakeupLine1

-- Test Case: Eth_WUL1_Wakeup_FallingEdge_PatternNotOngoing
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Ext0IntWakeupLine1
TEST.NEW
TEST.NAME:Eth_WUL1_Wakeup_FallingEdge_PatternNotOngoing
TEST.NOTES:
DESCRIPTION:   External 0 interrupt is used for edge detecting the eth. wake-up line 1; if rising/falling edge detected, the time measurement is started.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether external interrupt 0 is handled correctly upon a falling edge on WUL1 and pattern generation is not ongoing
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.ScrActivate100MHz
TEST.STUB:ScrWakeupHndl.StartTimerValidateWUL1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_P1_IN.B.P1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.IE0:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TR0:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TL0.U:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TH0.U:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON0.B.EXINT0:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_P1_IN.B.P1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.PatternGenOngoingWUL1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.IE0:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TR0:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TL0.U:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TH0.U:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON0.B.EXINT0:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.FLOW
  ScrWakeUpDetection.c.Ext0IntWakeupLine1
  ScrWakeUpDetection.c.ScrActivate100MHz
  ScrWakeupHndl.c.StartTimerValidateWUL1
  ScrWakeUpDetection.c.Ext0IntWakeupLine1
TEST.END_FLOW
TEST.END

-- Test Case: Eth_WUL1_Wakeup_FallingEdge_PatternOngoing
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Ext0IntWakeupLine1
TEST.NEW
TEST.NAME:Eth_WUL1_Wakeup_FallingEdge_PatternOngoing
TEST.NOTES:
DESCRIPTION:   External 0 interrupt is used for edge detecting the eth. wake-up line 1; if rising/falling edge detected, the time measurement is started.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether external interrupt 0 is handled correctly upon a falling edge on WUL1 and pattern generation is ongoing
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.ScrActivate100MHz
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_P1_IN.B.P1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.IE0:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TR0:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TL0.U:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TH0.U:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON0.B.EXINT0:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_P1_IN.B.P1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.PatternGenOngoingWUL1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.IE0:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TR0:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TL0.U:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TH0.U:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON0.B.EXINT0:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.FLOW
  ScrWakeUpDetection.c.Ext0IntWakeupLine1
  ScrWakeUpDetection.c.ScrActivate100MHz
  ScrWakeUpDetection.c.Ext0IntWakeupLine1
TEST.END_FLOW
TEST.END

-- Test Case: Eth_WUL1_Wakeup_RisingEdge
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Ext0IntWakeupLine1
TEST.NEW
TEST.NAME:Eth_WUL1_Wakeup_RisingEdge
TEST.NOTES:
DESCRIPTION:   External 0 interrupt is used for edge detecting the eth. wake-up line 1; if rising/falling edge detected, the time measurement is started.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether external interrupt 0 is handled correctly upon a rising edge on WUL1
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.ScrActivate100MHz
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_P1_IN.B.P2:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.IE0:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TR0:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TF0:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TL0.U:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TH0.U:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON0.B.EXINT0:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_P1_IN.B.P2:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.IE0:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TR0:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TF0:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TL0.U:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TH0.U:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON0.B.EXINT0:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.FLOW
  ScrWakeUpDetection.c.Ext0IntWakeupLine1
  ScrWakeUpDetection.c.ScrActivate100MHz
  ScrWakeUpDetection.c.Ext0IntWakeupLine1
TEST.END_FLOW
TEST.VALUE_USER_CODE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1
<<ScrWakeUpDetection.<<GLOBAL>>.WupData>>.fineTimeWul1 = ((<<ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TH0>>.U << 8) + (<<ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TL0>>.U));
TEST.END_VALUE_USER_CODE:
TEST.VALUE_USER_CODE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1
<<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> = ( ((<<ScrWakeUpDetection.<<GLOBAL>>.WupData>>.rawTimeWul1 * 0xFFFF) + (<<ScrWakeUpDetection.<<GLOBAL>>.WupData>>.fineTimeWul1)) / TICKS_PER_MS );
TEST.END_VALUE_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1
{{ <<ScrWakeUpDetection.<<GLOBAL>>.WupData>>.msTimeWul1 == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Eth_WUL1_Wakeup_RisingEdge_UnconsumedTimerOvrflw
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Ext0IntWakeupLine1
TEST.NEW
TEST.NAME:Eth_WUL1_Wakeup_RisingEdge_UnconsumedTimerOvrflw
TEST.NOTES:
DESCRIPTION:   External 0 interrupt is used for edge detecting the eth. wake-up line 1; if rising/falling edge detected, the time measurement is started.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether external interrupt 0 is handled correctly upon a rising edge on WUL1
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.ScrActivate100MHz
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_P1_IN.B.P2:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.IE0:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TR0:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TF0:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TL0.U:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TH0.U:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON0.B.EXINT0:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_P1_IN.B.P2:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.IE0:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TR0:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TF0:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TL0.U:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TH0.U:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON0.B.EXINT0:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.FLOW
  ScrWakeUpDetection.c.Ext0IntWakeupLine1
  ScrWakeUpDetection.c.ScrActivate100MHz
  ScrWakeUpDetection.c.Ext0IntWakeupLine1
TEST.END_FLOW
TEST.VALUE_USER_CODE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1
<<ScrWakeUpDetection.<<GLOBAL>>.WupData>>.fineTimeWul1 = ((<<ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TH0>>.U << 8) + (<<ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TL0>>.U));
TEST.END_VALUE_USER_CODE:
TEST.VALUE_USER_CODE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1
<<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> = ( (((<<ScrWakeUpDetection.<<GLOBAL>>.WupData>>.rawTimeWul1+1) * 0xFFFF) + (<<ScrWakeUpDetection.<<GLOBAL>>.WupData>>.fineTimeWul1)) / TICKS_PER_MS );
TEST.END_VALUE_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1
{{ <<ScrWakeUpDetection.<<GLOBAL>>.WupData>>.msTimeWul1 == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Subprogram: Ext11IntLinWakeup

-- Test Case: Ext11IntLinWakeup
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Ext11IntLinWakeup
TEST.NEW
TEST.NAME:Ext11IntLinWakeup
TEST.NOTES:
DESCRIPTION:   External 11 interrupt is used for edge detecting of LIN wake INH line

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether external interrupt 11 is handled correctly upon a LIN wake-up, by activating the SCR 100MHz oscillator and continuing the wake-up procedure
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.ScrActivate100MHz
TEST.STUB:ScrWakeupEcu.ScrLinWupCallback
TEST.STUB:ScrWakeupHndl.SetFirstWakeupSource
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON2.B.EXINT11:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON2.B.EXINT11:0
TEST.EXPECTED:ScrWakeupHndl.SetFirstWakeupSource.Wevent:LIN
TEST.FLOW
  ScrWakeUpDetection.c.Ext11IntLinWakeup
  ScrWakeUpDetection.c.ScrActivate100MHz
  ScrWakeupEcu.c.ScrLinWupCallback
  ScrWakeupHndl.c.SetFirstWakeupSource
  ScrWakeUpDetection.c.Ext11IntLinWakeup
TEST.END_FLOW
TEST.END

-- Test Case: Ext11IntLinWakeup_IntNotDetected
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Ext11IntLinWakeup
TEST.NEW
TEST.NAME:Ext11IntLinWakeup_IntNotDetected
TEST.NOTES:
DESCRIPTION:   External 11 interrupt is used for edge detecting of LIN wake INH line

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether external interrupt 11 is not handled since it has not been registered by the SCR
TEST.END_NOTES:
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON2.B.EXINT11:0
TEST.FLOW
  ScrWakeUpDetection.c.Ext11IntLinWakeup
  ScrWakeUpDetection.c.Ext11IntLinWakeup
TEST.END_FLOW
TEST.END

-- Subprogram: Ext14IntFrWakeup

-- Test Case: Ext14IntFrWakeup
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Ext14IntFrWakeup
TEST.NEW
TEST.NAME:Ext14IntFrWakeup
TEST.NOTES:
DESCRIPTION:   External 14 interrupt is used for edge detecting of FR wake INH line

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether external interrupt 14 is handled correctly upon a FlexRay wake-up, by activating the SCR 100MHz oscillator and continuing the wake-up procedure
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.ScrActivate100MHz
TEST.STUB:ScrWakeupEcu.ScrFrWupCallback
TEST.STUB:ScrWakeupHndl.SetFirstWakeupSource
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON2.B.EXINT14:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON2.B.EXINT14:0
TEST.EXPECTED:ScrWakeupHndl.SetFirstWakeupSource.Wevent:FR
TEST.FLOW
  ScrWakeUpDetection.c.Ext14IntFrWakeup
  ScrWakeUpDetection.c.ScrActivate100MHz
  ScrWakeupEcu.c.ScrFrWupCallback
  ScrWakeupHndl.c.SetFirstWakeupSource
  ScrWakeUpDetection.c.Ext14IntFrWakeup
TEST.END_FLOW
TEST.END

-- Test Case: Ext14IntFrWakeup_IntNotDetected
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Ext14IntFrWakeup
TEST.NEW
TEST.NAME:Ext14IntFrWakeup_IntNotDetected
TEST.NOTES:
DESCRIPTION:   External 14 interrupt is used for edge detecting of FR wake INH line

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether external interrupt 14 is not handled if it has not been detected according to the respective SCR register
TEST.END_NOTES:
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON2.B.EXINT14:0
TEST.FLOW
  ScrWakeUpDetection.c.Ext14IntFrWakeup
  ScrWakeUpDetection.c.Ext14IntFrWakeup
TEST.END_FLOW
TEST.END

-- Subprogram: Ext2IntCan5Wakeup

-- Test Case: Ext2IntCan5Wakeup
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Ext2IntCan5Wakeup
TEST.NEW
TEST.NAME:Ext2IntCan5Wakeup
TEST.NOTES:
DESCRIPTION:   External 2 interrupt is used for edge detecting of CAN wake INH line

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether external interrupt 2 is handled correctly upon a CAN wake-up, by activating the SCR 100MHz oscillator and continuing the wake-up procedure
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.ScrActivate100MHz
TEST.STUB:ScrWakeupEcu.ScrCanWupCallback
TEST.STUB:ScrWakeupHndl.SetFirstWakeupSource
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.B.EXINT2:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.B.EXINT2:0
TEST.EXPECTED:ScrWakeupHndl.SetFirstWakeupSource.Wevent:RESERVED1
TEST.FLOW
  ScrWakeUpDetection.c.Ext2IntCan5Wakeup
  ScrWakeUpDetection.c.ScrActivate100MHz
  ScrWakeupEcu.c.ScrCanWupCallback
  ScrWakeupHndl.c.SetFirstWakeupSource
  ScrWakeUpDetection.c.Ext2IntCan5Wakeup
TEST.END_FLOW
TEST.END

-- Test Case: Ext2IntCan5Wakeup_IntNotDetected
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Ext2IntCan5Wakeup
TEST.NEW
TEST.NAME:Ext2IntCan5Wakeup_IntNotDetected
TEST.NOTES:
DESCRIPTION:   External 2 interrupt is used for edge detecting of CAN wake INH line

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether external interrupt 2 is not handled since it has not been registered by the SCR
TEST.END_NOTES:
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.B.EXINT2:0
TEST.FLOW
  ScrWakeUpDetection.c.Ext2IntCan5Wakeup
  ScrWakeUpDetection.c.Ext2IntCan5Wakeup
TEST.END_FLOW
TEST.END

-- Subprogram: Ext4IntWakeupLine2

-- Test Case: Eth_WUL2_Wakeup_FallingEdge_PatternNotOngoing
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Ext4IntWakeupLine2
TEST.NEW
TEST.NAME:Eth_WUL2_Wakeup_FallingEdge_PatternNotOngoing
TEST.NOTES:
DESCRIPTION:   External 4 interrupt is used for edge detecting the eth. wake-up line 2; if rising/falling edge detected, the time measurement is started.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether external interrupt 4 is handled correctly upon a falling edge on WUL2 and pattern generation is not ongoing
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.ScrActivate100MHz
TEST.STUB:ScrWakeupHndl.StartTimerValidateWUL2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_P1_IN.B.P1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.PatternGenOngoingWUL2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.B.EXINT4:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TR1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TL1.U:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TH1.U:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.B.EXINT4:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON1.B.EXINT4:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.FLOW
  ScrWakeUpDetection.c.Ext4IntWakeupLine2
  ScrWakeUpDetection.c.ScrActivate100MHz
  ScrWakeupHndl.c.StartTimerValidateWUL2
  ScrWakeUpDetection.c.Ext4IntWakeupLine2
TEST.END_FLOW
TEST.END

-- Test Case: Eth_WUL2_Wakeup_FallingEdge_PatternOngoing
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Ext4IntWakeupLine2
TEST.NEW
TEST.NAME:Eth_WUL2_Wakeup_FallingEdge_PatternOngoing
TEST.NOTES:
DESCRIPTION:   External 4 interrupt is used for edge detecting the eth. wake-up line 1; if rising/falling edge detected, the time measurement is started.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether external interrupt 4 is handled correctly upon a falling edge on WUL2 and pattern generation is not ongoing
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.ScrActivate100MHz
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_P1_IN.B.P1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.PatternGenOngoingWUL2:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.B.EXINT4:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TR1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TL1.U:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TH1.U:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.B.EXINT4:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON1.B.EXINT4:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.FLOW
  ScrWakeUpDetection.c.Ext4IntWakeupLine2
  ScrWakeUpDetection.c.ScrActivate100MHz
  ScrWakeUpDetection.c.Ext4IntWakeupLine2
TEST.END_FLOW
TEST.END

-- Test Case: Eth_WUL2_Wakeup_RisingEdge
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Ext4IntWakeupLine2
TEST.NEW
TEST.NAME:Eth_WUL2_Wakeup_RisingEdge
TEST.NOTES:
DESCRIPTION:   External 4 interrupt is used for edge detecting the eth. wake-up line 2; if rising/falling edge detected, the time measurement is started.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether external interrupt 4 is handled correctly upon a rising edge on WUL2
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.ScrActivate100MHz
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_P1_IN.B.P1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TR1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TF1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TL1.U:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TH1.U:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.B.EXINT4:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_P1_IN.B.P1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TR1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TF1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TL1.U:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TH1.U:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.B.EXINT4:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON1.B.EXINT4:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.FLOW
  ScrWakeUpDetection.c.Ext4IntWakeupLine2
  ScrWakeUpDetection.c.ScrActivate100MHz
  ScrWakeUpDetection.c.Ext4IntWakeupLine2
TEST.END_FLOW
TEST.VALUE_USER_CODE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2
<<ScrWakeUpDetection.<<GLOBAL>>.WupData>>.fineTimeWul2 = ((<<ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TH1>>.U << 8) + (<<ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TL1>>.U));
TEST.END_VALUE_USER_CODE:
TEST.VALUE_USER_CODE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2
<<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> = ( ((<<ScrWakeUpDetection.<<GLOBAL>>.WupData>>.rawTimeWul2 * 0xFFFF) + (<<ScrWakeUpDetection.<<GLOBAL>>.WupData>>.fineTimeWul2)) / TICKS_PER_MS );
TEST.END_VALUE_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2
{{ <<ScrWakeUpDetection.<<GLOBAL>>.WupData>>.msTimeWul2 == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Eth_WUL2_Wakeup_RisingEdge_UnconsumedTimerOvrflw
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Ext4IntWakeupLine2
TEST.NEW
TEST.NAME:Eth_WUL2_Wakeup_RisingEdge_UnconsumedTimerOvrflw
TEST.NOTES:
DESCRIPTION:   External 4 interrupt is used for edge detecting the eth. wake-up line 2; if rising/falling edge detected, the time measurement is started.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether external interrupt 4 is handled correctly upon a rising edge on WUL2
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.ScrActivate100MHz
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_P1_IN.B.P1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TR1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TF1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TL1.U:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TH1.U:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.B.EXINT4:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_P1_IN.B.P1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TR1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.TF1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TL1.U:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TH1.U:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.B.EXINT4:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON1.B.EXINT4:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.FLOW
  ScrWakeUpDetection.c.Ext4IntWakeupLine2
  ScrWakeUpDetection.c.ScrActivate100MHz
  ScrWakeUpDetection.c.Ext4IntWakeupLine2
TEST.END_FLOW
TEST.VALUE_USER_CODE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2
<<ScrWakeUpDetection.<<GLOBAL>>.WupData>>.fineTimeWul2 = ((<<ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TH1>>.U << 8) + (<<ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TL1>>.U));
TEST.END_VALUE_USER_CODE:
TEST.VALUE_USER_CODE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2
<<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> = ( (((<<ScrWakeUpDetection.<<GLOBAL>>.WupData>>.rawTimeWul2+1) * 0xFFFF) + (<<ScrWakeUpDetection.<<GLOBAL>>.WupData>>.fineTimeWul2)) / TICKS_PER_MS );
TEST.END_VALUE_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2
{{ <<ScrWakeUpDetection.<<GLOBAL>>.WupData>>.msTimeWul2 == ( <<USER_GLOBALS_VCAST.<<GLOBAL>>.VECTORCAST_INT1>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: Ext3Int_ScrNotInStandby
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Ext4IntWakeupLine2
TEST.NEW
TEST.NAME:Ext3Int_ScrNotInStandby
TEST.NOTES:
DESCRIPTION:   External 3 interrupt is used for CAN/LIN/FLR/PMIC wake-up

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether external interrupt 3 is handled correctly in case of SCR not in standby mode, by starting SCR 100MHz oscillator, but not multiplexing to get actual wake-up source
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.ScrActivate100MHz
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.B.EXINT3:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.B.EXINT4:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.B.EXINT3:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.FLOW
  ScrWakeUpDetection.c.Ext4IntWakeupLine2
  ScrWakeUpDetection.c.ScrActivate100MHz
  ScrWakeUpDetection.c.Ext4IntWakeupLine2
TEST.END_FLOW
TEST.END

-- Test Case: Ext3Int_WAKE_CAN_LIN_FLR_PMIC
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Ext4IntWakeupLine2
TEST.NEW
TEST.NAME:Ext3Int_WAKE_CAN_LIN_FLR_PMIC
TEST.NOTES:
DESCRIPTION:   External 3 interrupt is used for CAN/LIN/FLR/PMIC wake-up

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether external interrupt 3 is handled correctly in case of SCR in standby mode, by starting SCR 100MHz oscillator and multiplexing to get actual wake-up source
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.Multiplexer
TEST.STUB:ScrWakeUpDetection.ScrActivate100MHz
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.B.EXINT3:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.B.EXINT4:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.B.EXINT3:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.FLOW
  ScrWakeUpDetection.c.Ext4IntWakeupLine2
  ScrWakeUpDetection.c.ScrActivate100MHz
  ScrWakeUpDetection.c.Multiplexer
  ScrWakeUpDetection.c.Ext4IntWakeupLine2
TEST.END_FLOW
TEST.END

-- Subprogram: Multiplexer

-- Test Case: Can5_Reserved1_Wakeup
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Multiplexer
TEST.NEW
TEST.NAME:Can5_Reserved1_Wakeup
TEST.NOTES:
DESCRIPTION:   We need to free ports on the SCR to use more IOs, to free ports we need to use an additional HW-Multiplexer.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that CAN 5 wake-up is detected and RESERVED1 is set as a source of it
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrWakeupEcu.ScrWupCallback
TEST.STUB:ScrWakeupHndl.SetFirstWakeupSource
TEST.STUB:ScrWakeupHndl.GetFirstWakeupSource
TEST.VALUE:ScrDioPort.DioPortRead.return:0,1
TEST.VALUE:ScrWakeupHndl.GetFirstWakeupSource.return:RESERVED1
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_FLR_WAKE,MACRO=g1IN_CAN5_WAKE
TEST.EXPECTED:ScrWakeupHndl.SetFirstWakeupSource.Wevent:RESERVED1
TEST.FLOW
  ScrWakeUpDetection.c.Multiplexer
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrWakeupHndl.c.SetFirstWakeupSource
  ScrWakeupHndl.c.GetFirstWakeupSource
  ScrWakeupEcu.c.ScrWupCallback
  ScrWakeUpDetection.c.Multiplexer
TEST.END_FLOW
TEST.END

-- Test Case: Can_Body1_Wakeup
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Multiplexer
TEST.NEW
TEST.NAME:Can_Body1_Wakeup
TEST.NOTES:
DESCRIPTION:   We need to free ports on the SCR to use more IOs, to free ports we need to use an additional HW-Multiplexer.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that CAN wake-up is detected and BODY1 is set as a source of it
TEST.END_NOTES:
TEST.STUB:BrsHw.BrsHwTime100NOP
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrWakeupEcu.ScrWupCallback
TEST.STUB:ScrWakeupHndl.SetFirstWakeupSource
TEST.STUB:ScrWakeupHndl.GetFirstWakeupSource
TEST.VALUE:ScrDioPort.DioPortWrite.NewState:(3)0
TEST.VALUE:ScrDioPort.DioPortRead.return:(2)0,1
TEST.VALUE:ScrWakeupHndl.GetFirstWakeupSource.return:BODY1
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_FLR_WAKE,MACRO=g1IN_CAN5_WAKE,MACRO=g1IN_MUX_OUT
TEST.EXPECTED:ScrWakeupHndl.SetFirstWakeupSource.Wevent:BODY1
TEST.FLOW
  ScrWakeUpDetection.c.Multiplexer
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrWakeupHndl.c.SetFirstWakeupSource
  ScrWakeupHndl.c.GetFirstWakeupSource
  ScrWakeupEcu.c.ScrWupCallback
  ScrWakeUpDetection.c.Multiplexer
TEST.END_FLOW
TEST.END

-- Test Case: Can_Body2_Wakeup
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Multiplexer
TEST.NEW
TEST.NAME:Can_Body2_Wakeup
TEST.NOTES:
DESCRIPTION:   We need to free ports on the SCR to use more IOs, to free ports we need to use an additional HW-Multiplexer.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that CAN wake-up is detected and BODY2 is set as a source of it
TEST.END_NOTES:
TEST.STUB:BrsHw.BrsHwTime100NOP
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrWakeupEcu.ScrWupCallback
TEST.STUB:ScrWakeupHndl.SetFirstWakeupSource
TEST.STUB:ScrWakeupHndl.GetFirstWakeupSource
TEST.VALUE:ScrDioPort.DioPortWrite.NewState:(3)0,1,(2)0
TEST.VALUE:ScrDioPort.DioPortRead.return:(3)0,1
TEST.VALUE:ScrWakeupHndl.GetFirstWakeupSource.return:BODY2
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_FLR_WAKE,MACRO=g1IN_CAN5_WAKE,(2)MACRO=g1IN_MUX_OUT
TEST.EXPECTED:ScrWakeupHndl.SetFirstWakeupSource.Wevent:BODY2
TEST.FLOW
  ScrWakeUpDetection.c.Multiplexer
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrWakeupHndl.c.SetFirstWakeupSource
  ScrWakeupHndl.c.GetFirstWakeupSource
  ScrWakeupEcu.c.ScrWupCallback
  ScrWakeUpDetection.c.Multiplexer
TEST.END_FLOW
TEST.END

-- Test Case: Can_Body3_Wakeup
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Multiplexer
TEST.NEW
TEST.NAME:Can_Body3_Wakeup
TEST.NOTES:
DESCRIPTION:   We need to free ports on the SCR to use more IOs, to free ports we need to use an additional HW-Multiplexer.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that CAN wake-up is detected and BODY3 is set as a source of it
TEST.END_NOTES:
TEST.STUB:BrsHw.BrsHwTime100NOP
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrWakeupEcu.ScrWupCallback
TEST.STUB:ScrWakeupHndl.SetFirstWakeupSource
TEST.STUB:ScrWakeupHndl.GetFirstWakeupSource
TEST.VALUE:ScrDioPort.DioPortWrite.NewState:(3)0,1,(3)0,1,0
TEST.VALUE:ScrDioPort.DioPortRead.return:(4)0,1
TEST.VALUE:ScrWakeupHndl.GetFirstWakeupSource.return:BODY3
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_FLR_WAKE,MACRO=g1IN_CAN5_WAKE,(3)MACRO=g1IN_MUX_OUT
TEST.EXPECTED:ScrWakeupHndl.SetFirstWakeupSource.Wevent:BODY3
TEST.FLOW
  ScrWakeUpDetection.c.Multiplexer
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrWakeupHndl.c.SetFirstWakeupSource
  ScrWakeupHndl.c.GetFirstWakeupSource
  ScrWakeupEcu.c.ScrWupCallback
  ScrWakeUpDetection.c.Multiplexer
TEST.END_FLOW
TEST.END

-- Test Case: Can_Body4_Wakeup
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Multiplexer
TEST.NEW
TEST.NAME:Can_Body4_Wakeup
TEST.NOTES:
DESCRIPTION:   We need to free ports on the SCR to use more IOs, to free ports we need to use an additional HW-Multiplexer.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that CAN wake-up is detected and BODY4 is set as a source of it
TEST.END_NOTES:
TEST.STUB:BrsHw.BrsHwTime100NOP
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrWakeupEcu.ScrWupCallback
TEST.STUB:ScrWakeupHndl.SetFirstWakeupSource
TEST.STUB:ScrWakeupHndl.GetFirstWakeupSource
TEST.VALUE:ScrDioPort.DioPortWrite.NewState:(3)0,1,(3)0,1,0,(2)1,0
TEST.VALUE:ScrDioPort.DioPortRead.return:(5)0,1
TEST.VALUE:ScrWakeupHndl.GetFirstWakeupSource.return:BODY4
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_FLR_WAKE,MACRO=g1IN_CAN5_WAKE,(4)MACRO=g1IN_MUX_OUT
TEST.EXPECTED:ScrWakeupHndl.SetFirstWakeupSource.Wevent:BODY4
TEST.FLOW
  ScrWakeUpDetection.c.Multiplexer
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrWakeupHndl.c.SetFirstWakeupSource
  ScrWakeupHndl.c.GetFirstWakeupSource
  ScrWakeupEcu.c.ScrWupCallback
  ScrWakeUpDetection.c.Multiplexer
TEST.END_FLOW
TEST.END

-- Test Case: Can_HeadUnit1_Wakeup
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Multiplexer
TEST.NEW
TEST.NAME:Can_HeadUnit1_Wakeup
TEST.NOTES:
DESCRIPTION:   We need to free ports on the SCR to use more IOs, to free ports we need to use an additional HW-Multiplexer.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that CAN wake-up is detected and HU1 is set as a source of it
TEST.END_NOTES:
TEST.STUB:BrsHw.BrsHwTime100NOP
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrWakeupEcu.ScrWupCallback
TEST.STUB:ScrWakeupHndl.SetFirstWakeupSource
TEST.STUB:ScrWakeupHndl.GetFirstWakeupSource
TEST.VALUE:ScrDioPort.DioPortWrite.NewState:(3)0,1,(3)0,1,0,(2)1,(3)0,(2)1,0,1,0,(2)1
TEST.VALUE:ScrDioPort.DioPortRead.return:(8)0,1
TEST.VALUE:ScrWakeupHndl.GetFirstWakeupSource.return:HU1
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_FLR_WAKE,MACRO=g1IN_CAN5_WAKE,(7)MACRO=g1IN_MUX_OUT
TEST.EXPECTED:ScrWakeupHndl.SetFirstWakeupSource.Wevent:HU1
TEST.FLOW
  ScrWakeUpDetection.c.Multiplexer
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrWakeupHndl.c.SetFirstWakeupSource
  ScrWakeupHndl.c.GetFirstWakeupSource
  ScrWakeupEcu.c.ScrWupCallback
  ScrWakeUpDetection.c.Multiplexer
TEST.END_FLOW
TEST.END

-- Test Case: Can_HeadUnit2_Wakeup
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Multiplexer
TEST.NEW
TEST.NAME:Can_HeadUnit2_Wakeup
TEST.NOTES:
DESCRIPTION:   We need to free ports on the SCR to use more IOs, to free ports we need to use an additional HW-Multiplexer.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that CAN wake-up is detected and HU2 is set as a source of it
TEST.END_NOTES:
TEST.STUB:BrsHw.BrsHwTime100NOP
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrWakeupEcu.ScrWupCallback
TEST.STUB:ScrWakeupHndl.SetFirstWakeupSource
TEST.STUB:ScrWakeupHndl.GetFirstWakeupSource
TEST.VALUE:ScrDioPort.DioPortWrite.NewState:(3)0,1,(3)0,1,0,(2)1,(3)0,(2)1,0,1,0,(5)1
TEST.VALUE:ScrDioPort.DioPortRead.return:(9)0,1
TEST.VALUE:ScrWakeupHndl.GetFirstWakeupSource.return:HU2
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_FLR_WAKE,MACRO=g1IN_CAN5_WAKE,(8)MACRO=g1IN_MUX_OUT
TEST.EXPECTED:ScrWakeupHndl.SetFirstWakeupSource.Wevent:HU2
TEST.FLOW
  ScrWakeUpDetection.c.Multiplexer
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrWakeupHndl.c.SetFirstWakeupSource
  ScrWakeupHndl.c.GetFirstWakeupSource
  ScrWakeupEcu.c.ScrWupCallback
  ScrWakeUpDetection.c.Multiplexer
TEST.END_FLOW
TEST.END

-- Test Case: Can_Periphery2_Wakeup
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Multiplexer
TEST.NEW
TEST.NAME:Can_Periphery2_Wakeup
TEST.NOTES:
DESCRIPTION:   We need to free ports on the SCR to use more IOs, to free ports we need to use an additional HW-Multiplexer.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that CAN wake-up is detected and PERIPHERY2 is set as a source of it
TEST.END_NOTES:
TEST.STUB:BrsHw.BrsHwTime100NOP
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrWakeupEcu.ScrWupCallback
TEST.STUB:ScrWakeupHndl.SetFirstWakeupSource
TEST.STUB:ScrWakeupHndl.GetFirstWakeupSource
TEST.VALUE:ScrDioPort.DioPortWrite.NewState:(3)0,1,(3)0,1,0,(2)1,(3)0,1
TEST.VALUE:ScrDioPort.DioPortRead.return:(6)0,1
TEST.VALUE:ScrWakeupHndl.GetFirstWakeupSource.return:PERIPHERY2
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_FLR_WAKE,MACRO=g1IN_CAN5_WAKE,(5)MACRO=g1IN_MUX_OUT
TEST.EXPECTED:ScrWakeupHndl.SetFirstWakeupSource.Wevent:PERIPHERY2
TEST.FLOW
  ScrWakeUpDetection.c.Multiplexer
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrWakeupHndl.c.SetFirstWakeupSource
  ScrWakeupHndl.c.GetFirstWakeupSource
  ScrWakeupEcu.c.ScrWupCallback
  ScrWakeUpDetection.c.Multiplexer
TEST.END_FLOW
TEST.END

-- Test Case: Can_Periphery_Wakeup
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Multiplexer
TEST.NEW
TEST.NAME:Can_Periphery_Wakeup
TEST.NOTES:
DESCRIPTION:   We need to free ports on the SCR to use more IOs, to free ports we need to use an additional HW-Multiplexer.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that CAN wake-up is detected and PERIPHERY is set as a source of it
TEST.END_NOTES:
TEST.STUB:BrsHw.BrsHwTime100NOP
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrWakeupEcu.ScrWupCallback
TEST.STUB:ScrWakeupHndl.SetFirstWakeupSource
TEST.STUB:ScrWakeupHndl.GetFirstWakeupSource
TEST.VALUE:ScrDioPort.DioPortWrite.NewState:(3)0,1,(3)0,1,0,(2)1,(3)0,(2)1,0,1
TEST.VALUE:ScrDioPort.DioPortRead.return:(7)0,1
TEST.VALUE:ScrWakeupHndl.GetFirstWakeupSource.return:PERIPHERY
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_FLR_WAKE,MACRO=g1IN_CAN5_WAKE,(6)MACRO=g1IN_MUX_OUT
TEST.EXPECTED:ScrWakeupHndl.SetFirstWakeupSource.Wevent:PERIPHERY
TEST.FLOW
  ScrWakeUpDetection.c.Multiplexer
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrWakeupHndl.c.SetFirstWakeupSource
  ScrWakeupHndl.c.GetFirstWakeupSource
  ScrWakeupEcu.c.ScrWupCallback
  ScrWakeUpDetection.c.Multiplexer
TEST.END_FLOW
TEST.END

-- Test Case: Flexray_Wakeup
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Multiplexer
TEST.NEW
TEST.NAME:Flexray_Wakeup
TEST.NOTES:
DESCRIPTION:   We need to free ports on the SCR to use more IOs, to free ports we need to use an additional HW-Multiplexer.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that Flexray wake-up is detected and is set as a source of it
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrWakeupEcu.ScrWupCallback
TEST.STUB:ScrWakeupHndl.SetFirstWakeupSource
TEST.STUB:ScrWakeupHndl.GetFirstWakeupSource
TEST.VALUE:ScrDioPort.DioPortRead.return:1
TEST.VALUE:ScrWakeupHndl.GetFirstWakeupSource.return:FR
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_FLR_WAKE
TEST.EXPECTED:ScrWakeupHndl.SetFirstWakeupSource.Wevent:FR
TEST.FLOW
  ScrWakeUpDetection.c.Multiplexer
  ScrDioPort.c.DioPortRead
  ScrWakeupHndl.c.SetFirstWakeupSource
  ScrWakeupHndl.c.GetFirstWakeupSource
  ScrWakeupEcu.c.ScrWupCallback
  ScrWakeUpDetection.c.Multiplexer
TEST.END_FLOW
TEST.END

-- Test Case: NoWakeupSource
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Multiplexer
TEST.NEW
TEST.NAME:NoWakeupSource
TEST.NOTES:
DESCRIPTION:   We need to free ports on the SCR to use more IOs, to free ports we need to use an additional HW-Multiplexer.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that no wake-up source is set
TEST.END_NOTES:
TEST.STUB:BrsHw.BrsHwTime100NOP
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrStateMngmt.ScrStateMngmtStandby
TEST.STUB:ScrWakeupEcu.ScrWupCallback
TEST.STUB:ScrWakeupHndl.GetFirstWakeupSource
TEST.VALUE:ScrDioPort.DioPortWrite.NewState:(3)0,1,(3)0,1,0,(2)1,(3)0,(2)1,0,1,0,(5)1
TEST.VALUE:ScrDioPort.DioPortRead.return:(10)0
TEST.VALUE:ScrWakeupHndl.GetFirstWakeupSource.return:EMPTY
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2,MACRO=g1OUT_MUX_SEL0,MACRO=g1OUT_MUX_SEL1,MACRO=g1OUT_MUX_SEL2
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_FLR_WAKE,MACRO=g1IN_CAN5_WAKE,(8)MACRO=g1IN_MUX_OUT
TEST.FLOW
  ScrWakeUpDetection.c.Multiplexer
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  ScrDioPort.c.DioPortWrite
  BrsHw.c.BrsHwTime100NOP
  ScrDioPort.c.DioPortRead
  ScrWakeupHndl.c.GetFirstWakeupSource
  ScrStateMngmt.c.ScrStateMngmtStandby
  ScrWakeUpDetection.c.Multiplexer
TEST.END_FLOW
TEST.END

-- Subprogram: ScrActivate100MHz

-- Test Case: ScrInStandby_Activate100MHz
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:ScrActivate100MHz
TEST.NEW
TEST.NAME:ScrInStandby_Activate100MHz
TEST.NOTES:
DESCRIPTION:   Activates the 100MHz oscillator of the SCR (if it is currently in Standby mode) to handle the incoming wake-up interrupt

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether 100 MHz oscillator is successfully activated if the SCR is in Standby (low-power) mode
TEST.END_NOTES:
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0x0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0xC7
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:0
TEST.FLOW
  ScrWakeUpDetection.c.ScrActivate100MHz
  ScrWakeUpDetection.c.ScrActivate100MHz
TEST.END_FLOW
TEST.END

-- Test Case: ScrNotInStandby_NotActivate100MHz
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:ScrActivate100MHz
TEST.NEW
TEST.NAME:ScrNotInStandby_NotActivate100MHz
TEST.NOTES:
DESCRIPTION:   Activates the 100MHz oscillator of the SCR (if it is currently in Standby mode) to handle the incoming wake-up interrupt

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether 100 MHz oscillator is not activated if the SCR is not in Standby (low-power) mode
TEST.END_NOTES:
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0x0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_PASSWD.U:0x0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_Ifx_SCR_SCU_CMCON.B.OSCPD:1
TEST.FLOW
  ScrWakeUpDetection.c.ScrActivate100MHz
  ScrWakeUpDetection.c.ScrActivate100MHz
TEST.END_FLOW
TEST.END

-- Subprogram: Timer0OverflowInt

-- Test Case: Timer0_Increment
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Timer0OverflowInt
TEST.NEW
TEST.NAME:Timer0_Increment
TEST.NOTES:
DESCRIPTION:   Timer 0 is used for pulse width measurement of the ethernet wake-up line 1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the pulse width timer is successfully incremented
TEST.END_NOTES:
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:20
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:21
TEST.FLOW
  ScrWakeUpDetection.c.Timer0OverflowInt
  ScrWakeUpDetection.c.Timer0OverflowInt
TEST.END_FLOW
TEST.END

-- Subprogram: Timer1OverflowInt

-- Test Case: Timer1OverflowInt
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:Timer1OverflowInt
TEST.NEW
TEST.NAME:Timer1OverflowInt
TEST.NOTES:
DESCRIPTION:   Timer 1 is used for pulse width measurement of the ethernet wake-up line 2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the pulse width timer is successfully incremented
TEST.END_NOTES:
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:20
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:21
TEST.FLOW
  ScrWakeUpDetection.c.Timer1OverflowInt
  ScrWakeUpDetection.c.Timer1OverflowInt
TEST.END_FLOW
TEST.END

-- Subprogram: WupGetData

-- Test Case: WupGetData
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:WupGetData
TEST.NEW
TEST.NAME:WupGetData
TEST.NOTES:
DESCRIPTION:   Returns a pointer to the address of the wake-up pulse data structure

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the address pointer of the WUP data structure is correctly returned
TEST.END_NOTES:
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.fineTimeWul2:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.rawTimeWul2:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.msTimeWul2:2
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:1
TEST.EXPECTED:ScrWakeUpDetection.WupGetData.return[0].fineTimeWul2:2
TEST.EXPECTED:ScrWakeUpDetection.WupGetData.return[0].rawTimeWul2:2
TEST.EXPECTED:ScrWakeUpDetection.WupGetData.return[0].msTimeWul2:2
TEST.EXPECTED:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:1
TEST.FLOW
  ScrWakeUpDetection.c.WupGetData
  ScrWakeUpDetection.c.WupGetData
TEST.END_FLOW
TEST.END

-- Subprogram: WupInit

-- Test Case: WupInit
TEST.UNIT:ScrWakeUpDetection
TEST.SUBPROGRAM:WupInit
TEST.NEW
TEST.NAME:WupInit
TEST.NOTES:
DESCRIPTION:   Main initialization routine for SCR wake-up interrupt registers

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the SCR wake-up interrupt registers are correctly initialized
TEST.END_NOTES:
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX0:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET0:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.EXM:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.ECCIP1:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.ECCIP2:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.IT0:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TMOD.B.T0M:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TMOD.B.T1M:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IPH.B.PX0H:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IPH1.B.PX2H:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IPH1.B.PXMH:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IPH1.B.PCCIP1H:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IPH1.B.PCCIP2H:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IP1.B.PX2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IP1.B.PXM:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IP1.B.PCCIP1:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IP1.B.PCCIP2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IP.B.PX0:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.U:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_MODPISEL1.B.EXINT0IS:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_MODPISEL1.B.EXINT2IS:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON1.U:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_MODPISEL2.B.T2CC0EXINT3IS:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_MODPISEL2.B.T2CC1EXINT4IS:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON2.U:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON0.B.EXINT0:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON0.B.EXINT2:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON0.B.EXINT3:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON1.B.EXINT4:1
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON2.B.EXINT11:0
TEST.VALUE:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON3.B.EXINT14:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.EX0:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET0:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IEN0.B.ET1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.EXM:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.ECCIP1:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IEN1.B.ECCIP2:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.WupData.isBusyWul2:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TCON.B.IT0:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TMOD.B.T0M:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_T01_TMOD.B.T1M:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IPH.B.PX0H:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IPH1.B.PX2H:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IPH1.B.PXMH:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IPH1.B.PCCIP1H:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IPH1.B.PCCIP2H:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IP1.B.PX2:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IP1.B.PXM:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IP1.B.PCCIP1:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IP1.B.PCCIP2:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IP.B.PX0:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON0.U:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_MODPISEL1.B.EXINT0IS:3
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_MODPISEL1.B.EXINT2IS:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON1.U:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_MODPISEL2.B.T2CC0EXINT3IS:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_MODPISEL2.B.T2CC1EXINT4IS:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_IRCON2.U:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON0.B.EXINT0:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON0.B.EXINT2:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON0.B.EXINT3:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON1.B.EXINT4:0
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON2.B.EXINT11:1
TEST.EXPECTED:ScrWakeUpDetection.<<GLOBAL>>.UT_Reg_SCR_EXICON3.B.EXINT14:1
TEST.FLOW
  ScrWakeUpDetection.c.WupInit
  ScrWakeUpDetection.c.WupInit
TEST.END_FLOW
TEST.END

-- Unit: ScrWakeupEcu

-- Subprogram: ScrCanWupCallback

-- Test Case: Can_WakeupPattern
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrCanWupCallback
TEST.NEW
TEST.NAME:Can_WakeupPattern
TEST.NOTES:
DESCRIPTION:   CAN wake-up pattern callback

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the CAN wake-up pattern is detected and handled properly
TEST.END_NOTES:
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.CanWupDetected:0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.CanWupDetected:1
TEST.FLOW
  ScrWakeupEcu.c.ScrCanWupCallback
  ScrWakeupEcu.c.ScrCanWupCallback
TEST.END_FLOW
TEST.END

-- Subprogram: ScrEthWupCallback

-- Test Case: Eth_WUL1_WakeupPattern
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrEthWupCallback
TEST.NEW
TEST.NAME:Eth_WUL1_WakeupPattern
TEST.NOTES:
DESCRIPTION:   Ethernet wake-up pattern callback

PARAMETERS:    uint8 EthWUchannel - Ethernet wake-up channel

RETURN VALUE:  void

TEST CASE:     Tests whether the ETH wake-up pattern for WUL1 is detected and handled properly
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:0
TEST.VALUE:ScrWakeupEcu.ScrEthWupCallback.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_PMIC1_WAKE
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:MACRO=PMIC_ON_TIME
TEST.FLOW
  ScrWakeupEcu.c.ScrEthWupCallback
  ScrDioPort.c.DioPortWrite
  ScrWakeupEcu.c.ScrEthWupCallback
TEST.END_FLOW
TEST.END

-- Test Case: Eth_WUL2_WakeupPattern
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrEthWupCallback
TEST.NEW
TEST.NAME:Eth_WUL2_WakeupPattern
TEST.NOTES:
DESCRIPTION:   Ethernet wake-up pattern callback

PARAMETERS:    uint8 EthWUchannel - Ethernet wake-up channel

RETURN VALUE:  void

TEST CASE:     Tests whether the ETH wake-up pattern for WUL2 is not detected (only WUL1 is supported for CEIC C) and handled properly (PMIC still triggered)
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:0
TEST.VALUE:ScrWakeupEcu.ScrEthWupCallback.EthWUchannel:2
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_PMIC1_WAKE
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:MACRO=PMIC_ON_TIME
TEST.FLOW
  ScrWakeupEcu.c.ScrEthWupCallback
  ScrDioPort.c.DioPortWrite
  ScrWakeupEcu.c.ScrEthWupCallback
TEST.END_FLOW
TEST.END

-- Subprogram: ScrFrWupCallback

-- Test Case: ScrFrWupCallback
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrFrWupCallback
TEST.NEW
TEST.NAME:ScrFrWupCallback
TEST.NOTES:
DESCRIPTION:   Flexray wake-up pattern callback

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the Flexray wake-up pattern is detected and handled properly
TEST.END_NOTES:
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.FrWupDetected:0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.FrWupDetected:1
TEST.FLOW
  ScrWakeupEcu.c.ScrFrWupCallback
  ScrWakeupEcu.c.ScrFrWupCallback
TEST.END_FLOW
TEST.END

-- Subprogram: ScrHandlePmic

-- Test Case: ScrHandlePmic_TimerExpired
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrHandlePmic
TEST.NEW
TEST.NAME:ScrHandlePmic_TimerExpired
TEST.NOTES:
DESCRIPTION:   Starts the handling of PMIC with given time value

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the PMIC wakeup output pin is set to LOW(0) if the PMIC timer has expired 
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:0
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_PMIC1_WAKE
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:0
TEST.FLOW
  ScrWakeupEcu.c.ScrHandlePmic
  ScrDioPort.c.DioPortWrite
  ScrWakeupEcu.c.ScrHandlePmic
TEST.END_FLOW
TEST.END

-- Test Case: ScrHandlePmic_TimerNotExpired
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrHandlePmic
TEST.NEW
TEST.NAME:ScrHandlePmic_TimerNotExpired
TEST.NOTES:
DESCRIPTION:   Starts the handling of PMIC with given time value

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the PMIC wakeup output pin is set to HIGH(1) if the PMIC timer has not expired 
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:1
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_PMIC1_WAKE
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:0
TEST.FLOW
  ScrWakeupEcu.c.ScrHandlePmic
  ScrDioPort.c.DioPortWrite
  ScrWakeupEcu.c.ScrHandlePmic
TEST.END_FLOW
TEST.END

-- Subprogram: ScrHandleWakeup

-- Test Case: WUL1_Activity_PulseNotTooLong
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrHandleWakeup
TEST.NEW
TEST.NAME:WUL1_Activity_PulseNotTooLong
TEST.NOTES:
DESCRIPTION:   Checks the wakeup signal timings and reports DTC if out of limits

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether wake-up is handled properly if WUL1 activity has been detected and pulse width is not too long
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul1:MACRO=MAX_PULSE
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.WUL1CntBad:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.WUL1CntBad:0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0
TEST.FLOW
  ScrWakeupEcu.c.ScrHandleWakeup
  ScrWakeUpDetection.c.WupGetData
  ScrWakeupEcu.c.ScrHandleWakeup
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_Activity_PulseTooLong
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrHandleWakeup
TEST.NEW
TEST.NAME:WUL1_Activity_PulseTooLong
TEST.NOTES:
DESCRIPTION:   Checks the wakeup signal timings and reports DTC if out of limits

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether wake-up is handled properly if WUL1 activity has been detected and pulse is too long
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.WUL1CntBad:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.WUL1CntBad:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0
TEST.FLOW
  ScrWakeupEcu.c.ScrHandleWakeup
  ScrWakeUpDetection.c.WupGetData
  ScrWakeupEcu.c.ScrHandleWakeup
TEST.END_FLOW
TEST.STUB_VAL_USER_CODE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul1
#define MAX_PULSE 1000u
<<ScrWakeUpDetection.WupGetData.return>>[0].msTimeWul1 = ( MAX_PULSE + 1 );
TEST.END_STUB_VAL_USER_CODE:
TEST.END

-- Test Case: WUL1_Activity_PulseTooLong_BadCntMaxReached
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrHandleWakeup
TEST.NEW
TEST.NAME:WUL1_Activity_PulseTooLong_BadCntMaxReached
TEST.NOTES:
DESCRIPTION:   Checks the wakeup signal timings and reports DTC if out of limits

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether wake-up is handled properly if WUL1 activity has been detected and pulse is too long, but bad counter max has been reached
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.WUL1CntBad:0xFF
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.WUL1CntBad:0xFF
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0
TEST.FLOW
  ScrWakeupEcu.c.ScrHandleWakeup
  ScrWakeUpDetection.c.WupGetData
  ScrWakeupEcu.c.ScrHandleWakeup
TEST.END_FLOW
TEST.STUB_VAL_USER_CODE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul1
#define MAX_PULSE 1000u
<<ScrWakeUpDetection.WupGetData.return>>[0].msTimeWul1 = ( MAX_PULSE + 1 );
TEST.END_STUB_VAL_USER_CODE:
TEST.END

-- Test Case: WUL1_NoActivity
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrHandleWakeup
TEST.NEW
TEST.NAME:WUL1_NoActivity
TEST.NOTES:
DESCRIPTION:   Checks the wakeup signal timings and reports DTC if out of limits

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether wake-up is handled properly if no WUL1 activity has been detected
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:0
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0
TEST.FLOW
  ScrWakeupEcu.c.ScrHandleWakeup
  ScrWakeUpDetection.c.WupGetData
  ScrWakeupEcu.c.ScrHandleWakeup
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_WUL2_Busy
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrHandleWakeup
TEST.NEW
TEST.NAME:WUL1_WUL2_Busy
TEST.NOTES:
DESCRIPTION:   Checks the wakeup signal timings and reports DTC if out of limits

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether wake-up is handled properly if WUL1 and WUL2 are busy
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:1
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:1
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:1
TEST.FLOW
  ScrWakeupEcu.c.ScrHandleWakeup
  ScrWakeUpDetection.c.WupGetData
  ScrWakeupEcu.c.ScrHandleWakeup
TEST.END_FLOW
TEST.END

-- Test Case: WUL2_Activity_PulseNotTooLong
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrHandleWakeup
TEST.NEW
TEST.NAME:WUL2_Activity_PulseNotTooLong
TEST.NOTES:
DESCRIPTION:   Checks the wakeup signal timings and reports DTC if out of limits

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether wake-up is handled properly if WUL2 activity has been detected and pulse width is not too long
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul2:MACRO=MAX_PULSE
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.WUL2CntBad:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.WUL2CntBad:0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0
TEST.FLOW
  ScrWakeupEcu.c.ScrHandleWakeup
  ScrWakeUpDetection.c.WupGetData
  ScrWakeupEcu.c.ScrHandleWakeup
TEST.END_FLOW
TEST.END

-- Test Case: WUL2_Activity_PulseTooLong
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrHandleWakeup
TEST.NEW
TEST.NAME:WUL2_Activity_PulseTooLong
TEST.NOTES:
DESCRIPTION:   Checks the wakeup signal timings and reports DTC if out of limits

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether wake-up is handled properly if WUL2 activity has been detected and pulse is too long
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.WUL2CntBad:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.WUL2CntBad:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0
TEST.FLOW
  ScrWakeupEcu.c.ScrHandleWakeup
  ScrWakeUpDetection.c.WupGetData
  ScrWakeupEcu.c.ScrHandleWakeup
TEST.END_FLOW
TEST.STUB_VAL_USER_CODE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul2
#define MAX_PULSE 1000u
<<ScrWakeUpDetection.WupGetData.return>>[0].msTimeWul2 = ( MAX_PULSE + 1 );
TEST.END_STUB_VAL_USER_CODE:
TEST.END

-- Test Case: WUL2_Activity_PulseTooLong_BadCntMaxReached
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrHandleWakeup
TEST.NEW
TEST.NAME:WUL2_Activity_PulseTooLong_BadCntMaxReached
TEST.NOTES:
DESCRIPTION:   Checks the wakeup signal timings and reports DTC if out of limits

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether wake-up is handled properly if WUL2 activity has been detected and pulse is too long, but bad counter max has been reached
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.WUL2CntBad:0xFF
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.WUL2CntBad:0xFF
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0
TEST.FLOW
  ScrWakeupEcu.c.ScrHandleWakeup
  ScrWakeUpDetection.c.WupGetData
  ScrWakeupEcu.c.ScrHandleWakeup
TEST.END_FLOW
TEST.STUB_VAL_USER_CODE:ScrWakeUpDetection.WupGetData.return[0].msTimeWul2
#define MAX_PULSE 1000u
<<ScrWakeUpDetection.WupGetData.return>>[0].msTimeWul2 = ( MAX_PULSE + 1 );
TEST.END_STUB_VAL_USER_CODE:
TEST.END

-- Test Case: WUL2_NoActivity
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrHandleWakeup
TEST.NEW
TEST.NAME:WUL2_NoActivity
TEST.NOTES:
DESCRIPTION:   Checks the wakeup signal timings and reports DTC if out of limits

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether wake-up is handled properly if no WUL2 activity has been detected
TEST.END_NOTES:
TEST.STUB:ScrWakeUpDetection.WupGetData
TEST.VALUE:ScrWakeUpDetection.WupGetData.return:<<malloc 1>>
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul1:1
TEST.VALUE:ScrWakeUpDetection.WupGetData.return[0].isBusyWul2:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0
TEST.VALUE:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL1Detected:0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.EthWUL2Detected:0
TEST.FLOW
  ScrWakeupEcu.c.ScrHandleWakeup
  ScrWakeUpDetection.c.WupGetData
  ScrWakeupEcu.c.ScrHandleWakeup
TEST.END_FLOW
TEST.END

-- Subprogram: ScrKeepSwitchAwake

-- Test Case: ScrKeepSwitchAwake
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrKeepSwitchAwake
TEST.NEW
TEST.NAME:ScrKeepSwitchAwake
TEST.NOTES:
DESCRIPTION:   Trigger the PMIC to keep the ETH switch awake

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the PMIC is triggered to keep the ETH switch awake
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_PMIC1_WAKE
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:MACRO=PMIC_KEEP_SWITCH_AWAKE
TEST.FLOW
  ScrWakeupEcu.c.ScrKeepSwitchAwake
  ScrDioPort.c.DioPortWrite
  ScrWakeupEcu.c.ScrKeepSwitchAwake
TEST.END_FLOW
TEST.END

-- Subprogram: ScrLinWupCallback

-- Test Case: ScrLinWupCallback.001
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrLinWupCallback
TEST.NEW
TEST.NAME:ScrLinWupCallback.001
TEST.NOTES:
DESCRIPTION:   LIN wake-up pattern callback

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the LIN wake-up pattern is detected and handled properly
TEST.END_NOTES:
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.LinWupDetected:1
TEST.FLOW
  ScrWakeupEcu.c.ScrLinWupCallback
  ScrWakeupEcu.c.ScrLinWupCallback
TEST.END_FLOW
TEST.END

-- Subprogram: ScrResetPmicHandler

-- Test Case: ScrResetPmicHandler
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrResetPmicHandler
TEST.NEW
TEST.NAME:ScrResetPmicHandler
TEST.STUB:ScrDioPort.DioPortWrite
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_PMIC1_WAKE
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:0
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:0
TEST.FLOW
  ScrWakeupEcu.c.ScrResetPmicHandler
  ScrDioPort.c.DioPortWrite
  ScrWakeupEcu.c.ScrResetPmicHandler
TEST.END_FLOW
TEST.END

-- Subprogram: ScrWakeupEcuTask50

-- Test Case: Pmic_Wakeup_Handling
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrWakeupEcuTask50
TEST.NEW
TEST.NAME:Pmic_Wakeup_Handling
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the PMIC

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the PMIC and wake-up are handled correctly
TEST.END_NOTES:
TEST.STUB:ScrWakeupEcu.ScrHandleWakeup
TEST.STUB:ScrWakeupEcu.ScrHandlePmic
TEST.FLOW
  ScrWakeupEcu.c.ScrWakeupEcuTask50
  ScrWakeupEcu.c.ScrHandleWakeup
  ScrWakeupEcu.c.ScrHandlePmic
  ScrWakeupEcu.c.ScrWakeupEcuTask50
TEST.END_FLOW
TEST.END

-- Subprogram: ScrWupCallback

-- Test Case: General_WakeupPattern
TEST.UNIT:ScrWakeupEcu
TEST.SUBPROGRAM:ScrWupCallback
TEST.NEW
TEST.NAME:General_WakeupPattern
TEST.NOTES:
DESCRIPTION:   General wake-up pattern callback

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the any general wake-up pattern is handled properly by triggering the PMIC
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_PMIC1_WAKE
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrWakeupEcu.<<GLOBAL>>.ScrData.PmicTimer:MACRO=PMIC_ON_TIME
TEST.FLOW
  ScrWakeupEcu.c.ScrWupCallback
  ScrDioPort.c.DioPortWrite
  ScrWakeupEcu.c.ScrWupCallback
TEST.END_FLOW
TEST.END

-- Unit: ScrWakeupHndl

-- Subprogram: DisableADCUnit

-- Test Case: DisableADCUnit
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:DisableADCUnit
TEST.NEW
TEST.NAME:DisableADCUnit
TEST.NOTES:
DESCRIPTION:   Enable SCR ADCOMP unit

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the SCR ADCOMP unit is disabled
TEST.END_NOTES:
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_ADCOMP_CON.U:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_ADCOMP_CON.B.ADCEN:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_ADCOMP_CON.U:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_ADCOMP_CON.B.ADCEN:0
TEST.FLOW
  ScrWakeupHndl.c.DisableADCUnit
  ScrWakeupHndl.c.DisableADCUnit
TEST.END_FLOW
TEST.END

-- Subprogram: EnableADCUnit

-- Test Case: EnableADCUnit
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:EnableADCUnit
TEST.NEW
TEST.NAME:EnableADCUnit
TEST.NOTES:
DESCRIPTION:   Enable SCR ADCOMP unit

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the SCR ADCOMP unit is enabled
TEST.END_NOTES:
TEST.STUB:ScrWakeupHndl.GetADCvalue
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_ADCOMP_CON.B.ADCENREQ:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_ADCOMP_CON.B.ADCEN:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_ADCOMP_CON.B.ADCCHSEL:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_ADCOMP_CON.B.ADCENREQ:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_ADCOMP_CON.B.ADCEN:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_ADCOMP_CON.B.ADCCHSEL:0
TEST.FLOW
  ScrWakeupHndl.c.EnableADCUnit
  ScrWakeupHndl.c.GetADCvalue
  ScrWakeupHndl.c.EnableADCUnit
TEST.END_FLOW
TEST.END

-- Subprogram: GetADCvalue

-- Test Case: GetADCvalue
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:GetADCvalue
TEST.NEW
TEST.NAME:GetADCvalue
TEST.NOTES:
DESCRIPTION:   Sample ADC Ch0 and return value

PARAMETERS:    none

RETURN VALUE:  uint8

TEST CASE:     Tests that ADC Ch0 is sampled and its value returned
TEST.END_NOTES:
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_ADCOMP_CON.B.VF:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_ADCOMP_CON.B.SOC:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_ADCOMP_RES.U:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_ADCOMP_CON.B.VF:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_ADCOMP_CON.B.SOC:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_ADCOMP_RES.U:1
TEST.EXPECTED:ScrWakeupHndl.GetADCvalue.return:1
TEST.FLOW
  ScrWakeupHndl.c.GetADCvalue
  ScrWakeupHndl.c.GetADCvalue
TEST.END_FLOW
TEST.END

-- Subprogram: GetFirstWakeupSource

-- Test Case: GetFirstWakeupSource
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:GetFirstWakeupSource
TEST.NEW
TEST.NAME:GetFirstWakeupSource
TEST.NOTES:
DESCRIPTION:   Gets the wake-up event which was the first

PARAMETERS:    none

RETURN VALUE:  WakeupSrc

TEST CASE:     Tests whether the first wake-up event is returned
TEST.END_NOTES:
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=BODY4
TEST.EXPECTED:ScrWakeupHndl.GetFirstWakeupSource.return:BODY4
TEST.FLOW
  ScrWakeupHndl.c.GetFirstWakeupSource
  ScrWakeupHndl.c.GetFirstWakeupSource
TEST.END_FLOW
TEST.END

-- Subprogram: ScrWakeupHndlTask1

-- Test Case: AdcStart_StartMeasurement
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:AdcStart_StartMeasurement
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the ADC measurement is started, the ADC unit is enabled and the validation timer for WUL1 has not expired yet
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrWakeupHndl.EnableADCUnit
TEST.VALUE:ScrDioPort.DioPortWrite.PortNr:0xFF
TEST.VALUE:ScrDioPort.DioPortWrite.NewState:0xFF
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:AdcStart
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:2
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:2
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCsample:1
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_KL30_FLTR_SCR_AD_EN
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:CheckAdcCircuit
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCsample:0
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrWakeupHndl.c.EnableADCUnit
  ScrDioPort.c.DioPortWrite
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: CheckAdcCircruit_MaxSamplesNotReached
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:CheckAdcCircruit_MaxSamplesNotReached
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the voltage of the disabled ADC circuit is sampled, the required number of samples have not been reached yet and the validation timer for WUL1 has not expired yet
TEST.END_NOTES:
TEST.STUB:ScrWakeupHndl.GetADCvalue
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:CheckAdcCircuit
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:2
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:2
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCsample:1
TEST.VALUE:ScrWakeupHndl.GetADCvalue.return:100
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:CheckAdcCircuit
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:100
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCsample:2
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrWakeupHndl.c.GetADCvalue
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: CheckAdcCircruit_MaxSamplesReached
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:CheckAdcCircruit_MaxSamplesReached
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the voltage of the disabled ADC circuit is sampled, the required number of samples have been reached and the validation timer for WUL1 has not expired yet
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrWakeupHndl.GetADCvalue
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:CheckAdcCircuit
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:2
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:2
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:200
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCsample:2
TEST.VALUE:ScrWakeupHndl.GetADCvalue.return:100
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_KL30_FLTR_SCR_AD_EN
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:CheckUBat
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:100
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCsample:0
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrWakeupHndl.c.GetADCvalue
  ScrDioPort.c.DioPortWrite
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: CheckUBat_MaxSamplesNotReached
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:CheckUBat_MaxSamplesNotReached
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the voltage of the enabled ADC circuit is sampled, the required number of samples have not been reached yet
               and the validation timer for WUL1 has not expired yet
TEST.END_NOTES:
TEST.STUB:ScrWakeupHndl.GetADCvalue
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:CheckUBat
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:2
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:2
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCsample:1
TEST.VALUE:ScrWakeupHndl.GetADCvalue.return:100
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:CheckUBat
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:100
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCsample:2
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrWakeupHndl.c.GetADCvalue
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: CheckUBat_MaxSamplesReached_AdcCircuitDefective
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:CheckUBat_MaxSamplesReached_AdcCircuitDefective
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the voltage of the enabled ADC circuit is sampled, the required number of samples have been reached,
	       the ADC circuit is defective and the validation timer for WUL1 has not expired yet
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrWakeupHndl.DisableADCUnit
TEST.STUB:ScrWakeupHndl.GetADCvalue
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:CheckUBat
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:2
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:2
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0x5A
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:200
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCsample:2
TEST.VALUE:ScrWakeupHndl.GetADCvalue.return:100
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_KL30_FLTR_SCR_AD_EN
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCcircuitDTC:MACRO=ADCdefectiv
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:100
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCsample:3
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrWakeupHndl.c.GetADCvalue
  ScrWakeupHndl.c.DisableADCUnit
  ScrDioPort.c.DioPortWrite
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: CheckUBat_MaxSamplesReached_AdcCircuitNotDefective
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:CheckUBat_MaxSamplesReached_AdcCircuitNotDefective
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the voltage of the enabled ADC circuit is sampled, the required number of samples have been reached,
	       the ADC circuit is not defective and the validation timer for WUL1 has not expired yet
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortWrite
TEST.STUB:ScrWakeupHndl.DisableADCUnit
TEST.STUB:ScrWakeupHndl.GetADCvalue
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCcircuitDTC:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:CheckUBat
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:2
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:2
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0x28
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:200
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCsample:2
TEST.VALUE:ScrWakeupHndl.GetADCvalue.return:100
TEST.EXPECTED:ScrDioPort.DioPortWrite.PortNr:MACRO=g1OUT_KL30_FLTR_SCR_AD_EN
TEST.EXPECTED:ScrDioPort.DioPortWrite.NewState:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCcircuitDTC:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:100
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCsample:3
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrWakeupHndl.c.GetADCvalue
  ScrWakeupHndl.c.DisableADCUnit
  ScrDioPort.c.DioPortWrite
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: DoNothing
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:DoNothing
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that SCR voltage is not sampled in the default state and that the validation timer for WUL1 has expired
TEST.END_NOTES:
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.END

-- Test Case: WUL1_InvalidEdge_HighLvl
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL1_InvalidEdge_HighLvl
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the WUL1 edge is invalid due to HIGH level of WUL1
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrStateMngmt.ScrStateMngmtStandby
TEST.STUB:ScrWakeupHndl.ScrWakeupHndl_ResetADCstate
TEST.VALUE:ScrDioPort.DioPortRead.return:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:100
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:100
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrStateMngmt.c.ScrStateMngmtStandby
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_InvalidEdge_StandbyMode_OV
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL1_InvalidEdge_StandbyMode_OV
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the WUL1 edge is invalid due to OV
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrStateMngmt.ScrStateMngmtStandby
TEST.STUB:ScrWakeupHndl.ScrWakeupHndl_ResetADCstate
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:161
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:161
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrStateMngmt.c.ScrStateMngmtStandby
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_InvalidEdge_StandbyMode_UV
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL1_InvalidEdge_StandbyMode_UV
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the WUL1 edge is invalid due to UV
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrStateMngmt.ScrStateMngmtStandby
TEST.STUB:ScrWakeupHndl.ScrWakeupHndl_ResetADCstate
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:59
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:59
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrStateMngmt.c.ScrStateMngmtStandby
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_StandbyMode_PulseValidation_AdcCircuitDefective.001
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL1_StandbyMode_PulseValidation_AdcCircuitDefective.001
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests WUL1 pulse length validation in ScrWakeupHndlTask1 in case of issue with the filter ADC circuit
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.STUB:ScrWakeupEcu.ScrEthWupCallback
TEST.STUB:ScrWakeupHndl.GetADCvalue
TEST.STUB:ScrWakeupHndl.EnableADCUnit
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x5A
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCcircuitDTC:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:AdcStart
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:7
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:0
TEST.VALUE:ScrWakeupHndl.GetADCvalue.return:12
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrWakeupEcu.ScrEthWupCallback.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:MACRO=ETH_WAK_FLAG
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=ETH_WUL1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x5A
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCcircuitDTC:MACRO=ADCdefectiv
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrWakeupEcu.c.ScrEthWupCallback
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.EXPECTED_GLOBALS_USER_CODE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled
{{ <<ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled>> == ( <<ScrWakeupHndl.GetADCvalue.return>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled
{{ <<ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled>> == ( <<ScrWakeupHndl.GetADCvalue.return>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: WUL1_StandbyMode_PulseValidation_NoAdcCircuitDefective.002
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL1_StandbyMode_PulseValidation_NoAdcCircuitDefective.002
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests WUL1 pulse length validation in ScrWakeupHndlTask1 in case of no issue with the filter ADC circuit
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.STUB:ScrWakeupEcu.ScrEthWupCallback
TEST.STUB:ScrWakeupHndl.GetADCvalue
TEST.STUB:ScrWakeupHndl.EnableADCUnit
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x5A
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCcircuitDTC:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:AdcStart
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:7
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrWakeupEcu.ScrEthWupCallback.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:MACRO=ETH_WAK_FLAG
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=ETH_WUL1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x5A
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCcircuitDTC:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:30
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:120
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrWakeupEcu.c.ScrEthWupCallback
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.STUB_VAL_USER_CODE:ScrWakeupHndl.GetADCvalue.return
static int i = 0;
int res = 0;
switch (i++)
{
    case 0:
    case 1:
    case 2:
      res = 30;
    break;
    case 3:
    case 4:
    case 5:
      res = 120;
    break;
}
<<ScrWakeupHndl.GetADCvalue.return>> = ( res );
TEST.END_STUB_VAL_USER_CODE:
TEST.END

-- Test Case: WUL1_ValidEdge_NormalMode_GoodCntNoOverflow
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL1_ValidEdge_NormalMode_GoodCntNoOverflow
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the WUL1 edge is valid and good counter has not overflowed yet
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.STUB:ScrWakeupEcu.ScrEthWupCallback
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x5A
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WULOperationCondition:MACRO=TRUE
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:59
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrWakeupEcu.ScrEthWupCallback.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:MACRO=ETH_WAK_FLAG
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=ETH_WUL1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x5A
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WULOperationCondition:MACRO=TRUE
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:59
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrWakeupEcu.c.ScrEthWupCallback
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_ValidEdge_NormalMode_GoodCntOverflow
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL1_ValidEdge_NormalMode_GoodCntOverflow
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the WUL1 edge is valid and good counter has overflowed
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.STUB:ScrWakeupEcu.ScrEthWupCallback
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0xFFFF
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x5A
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WULOperationCondition:MACRO=TRUE
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:161
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrWakeupEcu.ScrEthWupCallback.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:MACRO=ETH_WAK_FLAG
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=ETH_WUL1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0xFFFF
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x5A
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WULOperationCondition:MACRO=TRUE
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:161
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrWakeupEcu.c.ScrEthWupCallback
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_ValidEdge_StandbyMode_AdcCircuitDefective_GoodCntIncr
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL1_ValidEdge_StandbyMode_AdcCircuitDefective_GoodCntIncr
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that in case of issue with the filter ADC circuit, only the pulse length validation is considered, i.e.: 
                 - simulate that WUL1 edge is valid 
	         - simulate that UBAT is invalid (outside defined range) 
		 - simulate that ADC sircuit is defective
	       => voltage condition check is ignored (because of the defective ADC circuit) and good counter has incremented 
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.STUB:ScrWakeupEcu.ScrEthWupCallback
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x5A
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCcircuitDTC:MACRO=ADCdefectiv
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:60
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrWakeupEcu.ScrEthWupCallback.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:MACRO=ETH_WAK_FLAG
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=ETH_WUL1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x5A
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCcircuitDTC:MACRO=ADCdefectiv
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:60
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrWakeupEcu.c.ScrEthWupCallback
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_ValidEdge_StandbyMode_GoodCntNoOverflow
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL1_ValidEdge_StandbyMode_GoodCntNoOverflow
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the WUL1 edge is valid and good counter has not overflowed yet
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.STUB:ScrWakeupEcu.ScrEthWupCallback
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x5A
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:100
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrWakeupEcu.ScrEthWupCallback.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:MACRO=ETH_WAK_FLAG
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=ETH_WUL1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x5A
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:100
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrWakeupEcu.c.ScrEthWupCallback
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: WUL1_ValidEdge_StandbyMode_GoodCntOverflow
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL1_ValidEdge_StandbyMode_GoodCntOverflow
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the WUL1 edge is valid and good counter has overflowed
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.STUB:ScrWakeupEcu.ScrEthWupCallback
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0xFFFF
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x5A
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:100
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g12IN_WAKE1
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrWakeupEcu.ScrEthWupCallback.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:MACRO=ETH_WAK_FLAG
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=ETH_WUL1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0xFFFF
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x5A
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:100
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrWakeupEcu.c.ScrEthWupCallback
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: WUL2_InvalidEdge_HighLvl
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL2_InvalidEdge_HighLvl
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the WUL2 edge is invalid due to HIGH level of WUL2
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrStateMngmt.ScrStateMngmtStandby
TEST.STUB:ScrWakeupHndl.ScrWakeupHndl_ResetADCstate
TEST.VALUE:ScrDioPort.DioPortRead.return:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:100
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:100
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrStateMngmt.c.ScrStateMngmtStandby
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: WUL2_InvalidEdge_StandbyMode_OV
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL2_InvalidEdge_StandbyMode_OV
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the WUL2 edge is invalid due to OV
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrStateMngmt.ScrStateMngmtStandby
TEST.STUB:ScrWakeupHndl.ScrWakeupHndl_ResetADCstate
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:161
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:161
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrStateMngmt.c.ScrStateMngmtStandby
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: WUL2_InvalidEdge_StandbyMode_UV
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL2_InvalidEdge_StandbyMode_UV
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the WUL2 edge is invalid due to UV
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrStateMngmt.ScrStateMngmtStandby
TEST.STUB:ScrWakeupHndl.ScrWakeupHndl_ResetADCstate
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:59
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:59
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrStateMngmt.c.ScrStateMngmtStandby
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: WUL2_StandbyMode_PulseValidation_AdcCircuitDefective.001
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL2_StandbyMode_PulseValidation_AdcCircuitDefective.001
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests WUL2 pulse length validation in ScrWakeupHndlTask1 in case of issue with the filter ADC circuit
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.STUB:ScrWakeupEcu.ScrEthWupCallback
TEST.STUB:ScrWakeupHndl.GetADCvalue
TEST.STUB:ScrWakeupHndl.EnableADCUnit
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x5A
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCcircuitDTC:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:AdcStart
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:7
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:0
TEST.VALUE:ScrWakeupHndl.GetADCvalue.return:12
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrWakeupEcu.ScrEthWupCallback.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:MACRO=ETH_WAK_FLAG
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=ETH_WUL2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x5A
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCcircuitDTC:MACRO=ADCdefectiv
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrWakeupEcu.c.ScrEthWupCallback
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.EXPECTED_GLOBALS_USER_CODE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled
{{ <<ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled>> == ( <<ScrWakeupHndl.GetADCvalue.return>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.EXPECTED_GLOBALS_USER_CODE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled
{{ <<ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled>> == ( <<ScrWakeupHndl.GetADCvalue.return>> ) }}
TEST.END_EXPECTED_GLOBALS_USER_CODE:
TEST.END

-- Test Case: WUL2_StandbyMode_PulseValidation_NoAdcCircuitDefective.002
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL2_StandbyMode_PulseValidation_NoAdcCircuitDefective.002
TEST.COMPOUND_ONLY
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests WUL2 pulse length validation in ScrWakeupHndlTask1 in case of no issue with the filter ADC circuit
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.STUB:ScrWakeupEcu.ScrEthWupCallback
TEST.STUB:ScrWakeupHndl.GetADCvalue
TEST.STUB:ScrWakeupHndl.EnableADCUnit
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x5A
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCcircuitDTC:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:AdcStart
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:7
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:0
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrWakeupEcu.ScrEthWupCallback.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:MACRO=ETH_WAK_FLAG
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=ETH_WUL2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x5A
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCcircuitDTC:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:30
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:120
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrWakeupEcu.c.ScrEthWupCallback
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.STUB_VAL_USER_CODE:ScrWakeupHndl.GetADCvalue.return
static int i = 0;
int res = 0;
switch (i++)
{
    case 0:
    case 1:
    case 2:
      res = 30;
    break;
    case 3:
    case 4:
    case 5:
      res = 120;
    break;
}
<<ScrWakeupHndl.GetADCvalue.return>> = ( res );
TEST.END_STUB_VAL_USER_CODE:
TEST.END

-- Test Case: WUL2_ValidEdge_NormalMode_GoodCntNoOverflow
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL2_ValidEdge_NormalMode_GoodCntNoOverflow
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the WUL2 edge is valid and good counter has not overflowed yet
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.STUB:ScrWakeupEcu.ScrEthWupCallback
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x5A
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WULOperationCondition:MACRO=TRUE
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:59
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrWakeupEcu.ScrEthWupCallback.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:MACRO=ETH_WAK_FLAG
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=ETH_WUL2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x5A
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WULOperationCondition:MACRO=TRUE
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:59
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrWakeupEcu.c.ScrEthWupCallback
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: WUL2_ValidEdge_NormalMode_GoodCntOverflow
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL2_ValidEdge_NormalMode_GoodCntOverflow
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the WUL2 edge is valid and good counter has overflowed
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.STUB:ScrWakeupEcu.ScrEthWupCallback
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x5A
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0xFFFF
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WULOperationCondition:MACRO=TRUE
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:161
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrWakeupEcu.ScrEthWupCallback.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:MACRO=ETH_WAK_FLAG
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=ETH_WUL2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x5A
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0xFFFF
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WULOperationCondition:MACRO=TRUE
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:161
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrWakeupEcu.c.ScrEthWupCallback
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: WUL2_ValidEdge_StandbyMode_AdcCircuitDefective_GoodCntIncr
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL2_ValidEdge_StandbyMode_AdcCircuitDefective_GoodCntIncr
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that in case of issue with the filter ADC circuit, only the pulse length validation is considered, i.e.: 
                 - simulate that WUL2 edge is valid 
	         - simulate that UBAT is invalid (outside defined range) 
		 - simulate that ADC sircuit is defective
	       => voltage condition check is ignored (because of the defective ADC circuit) and good counter has incremented 
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.STUB:ScrWakeupEcu.ScrEthWupCallback
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x5A
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCcircuitDTC:MACRO=ADCdefectiv
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:160
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrWakeupEcu.ScrEthWupCallback.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:MACRO=ETH_WAK_FLAG
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=ETH_WUL2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x5A
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCcircuitDTC:MACRO=ADCdefectiv
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:160
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrWakeupEcu.c.ScrEthWupCallback
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: WUL2_ValidEdge_StandbyMode_GoodCntNoOverflow
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL2_ValidEdge_StandbyMode_GoodCntNoOverflow
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the WUL2 edge is valid and good counter has not overflowed yet
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.STUB:ScrWakeupEcu.ScrEthWupCallback
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x5A
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:100
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrWakeupEcu.ScrEthWupCallback.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:MACRO=ETH_WAK_FLAG
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=ETH_WUL2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x5A
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0x2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:100
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrWakeupEcu.c.ScrEthWupCallback
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Test Case: WUL2_ValidEdge_StandbyMode_GoodCntOverflow
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndlTask1
TEST.NEW
TEST.NAME:WUL2_ValidEdge_StandbyMode_GoodCntOverflow
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests that the WUL2 edge is valid and good counter has overflowed
TEST.END_NOTES:
TEST.STUB:ScrDioPort.DioPortRead
TEST.STUB:ScrGenEthWULPulse.ScrGenerateWULPattern
TEST.STUB:ScrWakeupEcu.ScrEthWupCallback
TEST.VALUE:ScrDioPort.DioPortRead.return:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x5A
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0xFFFF
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:100
TEST.EXPECTED:ScrDioPort.DioPortRead.PortNr:MACRO=g1IN_WAKE2
TEST.EXPECTED:ScrGenEthWULPulse.ScrGenerateWULPattern.EthWUchannel:MACRO=WUL1
TEST.EXPECTED:ScrWakeupEcu.ScrEthWupCallback.EthWUchannel:MACRO=WUL2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2Wakeup:MACRO=ETH_WAK_FLAG
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1Wakeup:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=ETH_WUL2
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL1CntGood:0x5A
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.WUL2CntGood:0xFFFF
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:100
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndlTask1
  ScrDioPort.c.DioPortRead
  ScrWakeupEcu.c.ScrEthWupCallback
  ScrGenEthWULPulse.c.ScrGenerateWULPattern
  ScrWakeupHndl.c.ScrWakeupHndlTask1
TEST.END_FLOW
TEST.END

-- Subprogram: ScrWakeupHndl_ResetADCstate

-- Test Case: ScrWakeupHndl_ResetADCstate
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:ScrWakeupHndl_ResetADCstate
TEST.NEW
TEST.NAME:ScrWakeupHndl_ResetADCstate
TEST.NOTES:
DESCRIPTION:   Event routine for handling the ADC measurement during wakeup validation. Validation of UBat is reset here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the ADC measurement vars are reset for next wake-up
TEST.END_NOTES:
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:CheckAdcCircuit
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:AdcStart
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:0
TEST.FLOW
  ScrWakeupHndl.c.ScrWakeupHndl_ResetADCstate
  ScrWakeupHndl.c.ScrWakeupHndl_ResetADCstate
TEST.END_FLOW
TEST.END

-- Subprogram: SetFirstWakeupSource

-- Test Case: NotSet_NonFirstWakeupSource
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:SetFirstWakeupSource
TEST.NEW
TEST.NAME:NotSet_NonFirstWakeupSource
TEST.NOTES:
DESCRIPTION:   Sets the wake-up event which was the first

PARAMETERS:    WakeupSrc Wevent

RETURN VALUE:  void

TEST CASE:     Tests whether the wake-up event that occurred after the first is not set
TEST.END_NOTES:
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=BODY4
TEST.VALUE:ScrWakeupHndl.SetFirstWakeupSource.Wevent:PERIPHERY
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=BODY4
TEST.FLOW
  ScrWakeupHndl.c.SetFirstWakeupSource
  ScrWakeupHndl.c.SetFirstWakeupSource
TEST.END_FLOW
TEST.END

-- Test Case: Set_FirstWakeupSource
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:SetFirstWakeupSource
TEST.NEW
TEST.NAME:Set_FirstWakeupSource
TEST.NOTES:
DESCRIPTION:   Sets the wake-up event which was the first

PARAMETERS:    WakeupSrc Wevent

RETURN VALUE:  void

TEST CASE:     Tests whether the first wake-up event that occurred is set successfully
TEST.END_NOTES:
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=EMPTY
TEST.VALUE:ScrWakeupHndl.SetFirstWakeupSource.Wevent:BODY4
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.FirstWakeup:MACRO=BODY4
TEST.FLOW
  ScrWakeupHndl.c.SetFirstWakeupSource
  ScrWakeupHndl.c.SetFirstWakeupSource
TEST.END_FLOW
TEST.END

-- Subprogram: StartTimerValidateWUL1

-- Test Case: StartTimerValidateWUL1_NormalMode
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:StartTimerValidateWUL1
TEST.NEW
TEST.NAME:StartTimerValidateWUL1_NormalMode
TEST.NOTES:
DESCRIPTION:   Starts the validation of a detected Eth WUL

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the validation of a detected Eth WUL is started successfully
TEST.END_NOTES:
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:0x5A
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:MACRO=VALIDATION_TIME
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:0x5A
TEST.FLOW
  ScrWakeupHndl.c.StartTimerValidateWUL1
  ScrWakeupHndl.c.StartTimerValidateWUL1
TEST.END_FLOW
TEST.END

-- Test Case: StartTimerValidateWUL1_StandbyMode
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:StartTimerValidateWUL1
TEST.NEW
TEST.NAME:StartTimerValidateWUL1_StandbyMode
TEST.NOTES:
DESCRIPTION:   Starts the validation of a detected Eth WUL

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the validation of a detected Eth WUL is started successfully
TEST.END_NOTES:
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:0x5A
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:AdcStart
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL1:MACRO=VALIDATION_TIME
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:0x0
TEST.FLOW
  ScrWakeupHndl.c.StartTimerValidateWUL1
  ScrWakeupHndl.c.StartTimerValidateWUL1
TEST.END_FLOW
TEST.END

-- Subprogram: StartTimerValidateWUL2

-- Test Case: StartTimerValidateWUL2_NormalMode
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:StartTimerValidateWUL2
TEST.NEW
TEST.NAME:StartTimerValidateWUL2_NormalMode
TEST.NOTES:
DESCRIPTION:   Starts the validation of a detected Eth WUL

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the validation of a detected Eth WUL is started successfully
TEST.END_NOTES:
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:0x5A
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:MACRO=VALIDATION_TIME
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:0x5A
TEST.FLOW
  ScrWakeupHndl.c.StartTimerValidateWUL2
  ScrWakeupHndl.c.StartTimerValidateWUL2
TEST.END_FLOW
TEST.END

-- Test Case: StartTimerValidateWUL2_StandbyMode
TEST.UNIT:ScrWakeupHndl
TEST.SUBPROGRAM:StartTimerValidateWUL2
TEST.NEW
TEST.NAME:StartTimerValidateWUL2_StandbyMode
TEST.NOTES:
DESCRIPTION:   Starts the validation of a detected Eth WUL

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests whether the validation of a detected Eth WUL is started successfully
TEST.END_NOTES:
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:DoNothing
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:0x0
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0xA5
TEST.VALUE:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:0x5A
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UT_Reg_SCR_SCU_SR.B.STBY:1
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ADCMeasState:AdcStart
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.ValidationTimerWUL2:MACRO=VALIDATION_TIME
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcDisabled:0x0
TEST.EXPECTED:ScrWakeupHndl.<<GLOBAL>>.UBatAdcEnabled:0x0
TEST.FLOW
  ScrWakeupHndl.c.StartTimerValidateWUL2
  ScrWakeupHndl.c.StartTimerValidateWUL2
TEST.END_FLOW
TEST.END

-- COMPOUND TESTS

TEST.SUBPROGRAM:<<COMPOUND>>
TEST.NEW
TEST.NAME:CheckWulPulsLengthPeriod
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Compound test to test whether the pulse length is checked after the necessary point in time is reached
TEST.END_NOTES:
TEST.SLOT: "1", "ScrGenEthWULPulse", "ScrGenEthWULTask10", "9", "Comp_Iter_CheckPulseLen"
TEST.SLOT: "2", "ScrGenEthWULPulse", "ScrGenEthWULTask10", "1", "Comp_CheckPulseLen"
TEST.END
--

-- COMPOUND TESTS

TEST.SUBPROGRAM:<<COMPOUND>>
TEST.NEW
TEST.NAME:NotCheckPulseLength_WU_Perma_Active
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Compound test to test whether the pulse length is not checked after the necessary point in time is reached due to diag mode where all WUL are perma active
TEST.END_NOTES:
TEST.SLOT: "1", "ScrGenEthWULPulse", "ScrGenEthWULTask10", "9", "Comp_Iter_CheckPulseLen"
TEST.SLOT: "2", "ScrGenEthWULPulse", "ScrGenEthWULTask10", "1", "Comp_NotCheckPulseLen_WU_Perma_Active"
TEST.END
--

-- COMPOUND TESTS

TEST.SUBPROGRAM:<<COMPOUND>>
TEST.NEW
TEST.NAME:ScrEcuResetHndl_ScrWupCallback
TEST.SLOT: "1", "ScrEcuResetHndl", "ScrEcuResetHndlTask1", "1", "Comp_ScrEcuResetHndl_ScrWupCallback"
TEST.SLOT: "2", "ScrEcuResetHndl", "ScrEcuResetHndlTask1", "199", "Comp_ScrEcuResetHndl_ScrWupCallback_Incr"
TEST.END
--

-- COMPOUND TESTS

TEST.SUBPROGRAM:<<COMPOUND>>
TEST.NEW
TEST.NAME:ScrHndlEthLineShortMonWUL1__WUL1_ShToBAT_Processing
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Compound test to test full processing of ShToBAT error (Detect Err.Conditions, ErrSet, Dematuring, Clearing etc.)
TEST.END_NOTES:
TEST.SLOT: "1", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "10", "Comp_ShToBAT_NoErrorConditions"
TEST.SLOT: "2", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "499", "Comp_ShToBAT_ErrorConditionsDetected"
TEST.SLOT: "3", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "1", "Comp_ShToBAT_ErrorConditionsDisappear"
TEST.SLOT: "4", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "EL_FAULT_TIME", "Comp_ShToBAT_ErrorSet"
TEST.SLOT: "5", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "10", "Comp_ShToBAT_ErrorStaysSet"
TEST.SLOT: "6", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "10", "Comp_ShToBAT_ErrorDematuring"
TEST.SLOT: "7", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "1", "Comp_ShToBAT_ErrorDematuringInterrupted"
TEST.SLOT: "8", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "10", "Comp_ShToBAT_ErrorDematuring"
TEST.SLOT: "9", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "100", "Comp_ShToBAT_ErrorCleared"
TEST.END
--

-- COMPOUND TESTS

TEST.SUBPROGRAM:<<COMPOUND>>
TEST.NEW
TEST.NAME:ScrHndlEthLineShortMonWUL1__WUL1_ShToGND_Processing
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL1

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Compound test to test full processing of ShToGND error (Detect Err.Conditions, ErrSet, Dematuring, Clearing etc.)
TEST.END_NOTES:
TEST.SLOT: "1", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "10", "Comp_ShToGND_PulseGenNotStarted"
TEST.SLOT: "2", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "SHORT_DET_TIME", "Comp_ShToGND_PulseGenStarted_CheckTimerNotElapsed"
TEST.SLOT: "3", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "10", "Comp_ShToGND_NoErrorConditions_PulseGenOngoing"
TEST.SLOT: "4", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "10", "Comp_ShToGND_NoErrorConditions_PulseGenFinished"
TEST.SLOT: "5", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "70", "Comp_ShToGND_ErrorConditionsDetected_PulseGenOngoing"
TEST.SLOT: "6", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "429", "Comp_ShToGND_ErrorConditionsDetected_PulseGenFinished"
TEST.SLOT: "7", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "1", "Comp_ShToGND_ErrorConditionsDisappear"
TEST.SLOT: "8", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "EL_FAULT_TIME", "Comp_ShToGND_ErrorSet"
TEST.SLOT: "9", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "10", "Comp_ShToGND_ErrorStaysSet"
TEST.SLOT: "10", "ScrGenEthWULPulse", "ScrIsWakeupDiagRequested", "1", "Comp_ShToGND_WUL1_GenPulseRequest"
TEST.SLOT: "11", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_ShToGND_WUL1_ErrorDematuring"
TEST.SLOT: "12", "ScrGenEthWULPulse", "ScrIsWakeupDiagRequested", "1", "Comp_ShToGND_WUL1_GenPulseRequest"
TEST.SLOT: "13", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_ShToGND_WUL1_ErrorDematuring"
TEST.SLOT: "14", "ScrGenEthWULPulse", "ScrIsWakeupDiagRequested", "1", "Comp_ShToGND_WUL1_GenPulseRequest"
TEST.SLOT: "15", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_ShToGND_WUL1_ErrorDematuring"
TEST.SLOT: "16", "ScrGenEthWULPulse", "ScrIsWakeupDiagRequested", "1", "Comp_ShToGND_WUL1_GenPulseRequest"
TEST.SLOT: "17", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_ShToGND_WUL1_ErrorDematuring"
TEST.SLOT: "18", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "1", "Comp_ShToGND_DematureCntCheck"
TEST.SLOT: "19", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL1", "1", "Comp_ShToGND_ErrorStaysSet"
TEST.SLOT: "20", "ScrGenEthWULPulse", "ScrIsWakeupDiagRequested", "1", "Comp_ShToGND_WUL1_GenPulseRequest"
TEST.SLOT: "21", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_ShToGND_WUL1_ErrorDematuring"
TEST.SLOT: "22", "ScrGenEthWULPulse", "ScrIsWakeupDiagRequested", "1", "Comp_ShToGND_WUL1_GenPulseRequest"
TEST.SLOT: "23", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_ShToGND_WUL1_ErrorDematuring"
TEST.SLOT: "24", "ScrGenEthWULPulse", "ScrIsWakeupDiagRequested", "1", "Comp_ShToGND_WUL1_GenPulseRequest"
TEST.SLOT: "25", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_ShToGND_WUL1_ErrorDematuring"
TEST.SLOT: "26", "ScrGenEthWULPulse", "ScrIsWakeupDiagRequested", "1", "Comp_ShToGND_WUL1_GenPulseRequest"
TEST.SLOT: "27", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_ShToGND_WUL1_ErrorDematuring"
TEST.SLOT: "28", "ScrGenEthWULPulse", "ScrIsWakeupDiagRequested", "1", "Comp_ShToGND_WUL1_GenPulseRequest"
TEST.SLOT: "29", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_ShToGND_WUL1_ErrorCleared"
TEST.END
--

-- COMPOUND TESTS

TEST.SUBPROGRAM:<<COMPOUND>>
TEST.NEW
TEST.NAME:ScrHndlEthLineShortMonWUL2__WUL1_WUL2_ShTogether_Processing
TEST.SLOT: "1", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShTogether_ProcessingStopped_WUL1_ShToBAT"
TEST.SLOT: "2", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShTogether_ProcessingStopped_WUL1_ShToGND"
TEST.SLOT: "3", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShTogether_ProcessingStopped_WUL2_ShToBAT"
TEST.SLOT: "4", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShTogether_ProcessingStopped_WUL2_ShToGND"
TEST.SLOT: "5", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShTogether_WUL1_PulseGenOngoing"
TEST.SLOT: "6", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShTogether_WUL2_PulseGenOngoing"
TEST.SLOT: "7", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShTogether_WUL1_WUL2_PulseGenOngoing"
TEST.SLOT: "8", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShTogether_NoErrCond_WUL1PulseLongerThanWUL2Pulse"
TEST.SLOT: "9", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShTogether_NoErrCond_WUL2PulseLongerThanWUL1Pulse"
TEST.SLOT: "10", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShTogether_ErrSet_WUL1_WUL2_PulsesDuration_5ms"
TEST.SLOT: "11", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShTogether_ErrSet_WUL1_WUL2_PulsesDurationEqual"
TEST.SLOT: "12", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShTogether_ErrorCleared"
TEST.END
--

-- COMPOUND TESTS

TEST.SUBPROGRAM:<<COMPOUND>>
TEST.NEW
TEST.NAME:ScrHndlEthLineShortMonWUL2__WUL2_ShToBAT_Processing
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Compound test to test full processing of ShToBAT error (Detect Err.Conditions, ErrSet, Dematuring, Clearing etc.)
TEST.END_NOTES:
TEST.SLOT: "1", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShToBAT_NoErrorConditions"
TEST.SLOT: "2", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "499", "Comp_ShToBAT_ErrorConditionsDetected"
TEST.SLOT: "3", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "1", "Comp_ShToBAT_ErrorConditionsDisappear"
TEST.SLOT: "4", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "EL_FAULT_TIME", "Comp_ShToBAT_ErrorSet"
TEST.SLOT: "5", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShToBAT_ErrorStaysSet"
TEST.SLOT: "6", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShToBAT_ErrorDematuring"
TEST.SLOT: "7", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "1", "Comp_ShToBAT_ErrorDematuringInterrupted"
TEST.SLOT: "8", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShToBAT_ErrorDematuring"
TEST.SLOT: "9", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "100", "Comp_ShToBAT_ErrorCleared"
TEST.END
--

-- COMPOUND TESTS

TEST.SUBPROGRAM:<<COMPOUND>>
TEST.NEW
TEST.NAME:ScrHndlEthLineShortMonWUL2__WUL2_ShToGND_Processing
TEST.NOTES:
DESCRIPTION:   Handles the monitoring of short circuit line of WUL2

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Compound test to test full processing of ShToGND error (Detect Err.Conditions, ErrSet, Dematuring, Clearing etc.)
TEST.END_NOTES:
TEST.SLOT: "1", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShToGND_PulseGenNotStarted"
TEST.SLOT: "2", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "SHORT_DET_TIME", "Comp_ShToGND_PulseGenStarted_CheckTimerNotElapsed"
TEST.SLOT: "3", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShToGND_NoErrorConditions_PulseGenOngoing"
TEST.SLOT: "4", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShToGND_NoErrorConditions_PulseGenFinished"
TEST.SLOT: "5", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "70", "Comp_ShToGND_ErrorConditionsDetected_PulseGenOngoing"
TEST.SLOT: "6", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "429", "Comp_ShToGND_ErrorConditionsDetected_PulseGenFinished"
TEST.SLOT: "7", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "1", "Comp_ShToGND_ErrorConditionsDisappear"
TEST.SLOT: "8", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "EL_FAULT_TIME", "Comp_ShToGND_ErrorSet"
TEST.SLOT: "9", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "10", "Comp_ShToGND_ErrorStaysSet"
TEST.SLOT: "10", "ScrGenEthWULPulse", "ScrIsWakeupDiagRequested", "1", "Comp_ShToGND_WUL2_GenPulseRequest"
TEST.SLOT: "11", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_ShToGND_WUL2_ErrorDematuring"
TEST.SLOT: "12", "ScrGenEthWULPulse", "ScrIsWakeupDiagRequested", "1", "Comp_ShToGND_WUL2_GenPulseRequest"
TEST.SLOT: "13", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_ShToGND_WUL2_ErrorDematuring"
TEST.SLOT: "14", "ScrGenEthWULPulse", "ScrIsWakeupDiagRequested", "1", "Comp_ShToGND_WUL2_GenPulseRequest"
TEST.SLOT: "15", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_ShToGND_WUL2_ErrorDematuring"
TEST.SLOT: "16", "ScrGenEthWULPulse", "ScrIsWakeupDiagRequested", "1", "Comp_ShToGND_WUL2_GenPulseRequest"
TEST.SLOT: "17", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_ShToGND_WUL2_ErrorDematuring"
TEST.SLOT: "18", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "1", "Comp_ShToGND_DematureCntCheck"
TEST.SLOT: "19", "ScrGenEthWULPulse", "ScrHndlEthLineShortMonWUL2", "1", "Comp_ShToGND_ErrorStaysSet"
TEST.SLOT: "20", "ScrGenEthWULPulse", "ScrIsWakeupDiagRequested", "1", "Comp_ShToGND_WUL2_GenPulseRequest"
TEST.SLOT: "21", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_ShToGND_WUL2_ErrorDematuring"
TEST.SLOT: "22", "ScrGenEthWULPulse", "ScrIsWakeupDiagRequested", "1", "Comp_ShToGND_WUL2_GenPulseRequest"
TEST.SLOT: "23", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_ShToGND_WUL2_ErrorDematuring"
TEST.SLOT: "24", "ScrGenEthWULPulse", "ScrIsWakeupDiagRequested", "1", "Comp_ShToGND_WUL2_GenPulseRequest"
TEST.SLOT: "25", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_ShToGND_WUL2_ErrorDematuring"
TEST.SLOT: "26", "ScrGenEthWULPulse", "ScrIsWakeupDiagRequested", "1", "Comp_ShToGND_WUL2_GenPulseRequest"
TEST.SLOT: "27", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_ShToGND_WUL2_ErrorDematuring"
TEST.SLOT: "28", "ScrGenEthWULPulse", "ScrIsWakeupDiagRequested", "1", "Comp_ShToGND_WUL2_GenPulseRequest"
TEST.SLOT: "29", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_ShToGND_WUL2_ErrorCleared"
TEST.END
--

-- COMPOUND TESTS

TEST.SUBPROGRAM:<<COMPOUND>>
TEST.NEW
TEST.NAME:ScrStateMngmtTask10_ScrState_FullTransition
TEST.SLOT: "1", "ScrStateMngmt", "ScrStateMngmtTask10", "1", "ScrStateMngmtTask10_ScrState_InitializedToNormal"
TEST.SLOT: "2", "ScrStateMngmt", "ScrStateMngmtTask10", "10", "Comp_ScrStateMngmtTask10_ScrState_Normal"
TEST.SLOT: "3", "ScrStateMngmt", "ScrStateMngmtTask10", "1", "Comp_ScrStateMngmtTask10_ScrState_NormalToStandby"
TEST.SLOT: "4", "ScrStateMngmt", "ScrStateMngmtTask10", "499", "Comp_ScrStateMngmtTask10_ScrState_Standby_5sec"
TEST.SLOT: "5", "ScrStateMngmt", "ScrStateMngmtTask10", "1", "Comp_ScrStateMngmtTask10_ScrState_StandbyToSleep"
TEST.SLOT: "6", "ScrStateMngmt", "ScrStateMngmtTask10", "10", "Comp_ScrStateMngmtTask10_ScrState_Sleep"
TEST.SLOT: "7", "ScrStateMngmt", "ScrStateMngmtTask10", "1", "Comp_ScrStateMngmtTask10_ScrState_SleepToNormal"
TEST.SLOT: "8", "ScrStateMngmt", "ScrStateMngmtTask10", "10", "Comp_ScrStateMngmtTask10_ScrState_Normal"
TEST.END
--

-- COMPOUND TESTS

TEST.SUBPROGRAM:<<COMPOUND>>
TEST.NEW
TEST.NAME:WUL1_GenPulseLength
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Compound test to test whether the generated pulse on WUL1 is with correct length.
TEST.END_NOTES:
TEST.SLOT: "1", "ScrGenEthWULPulse", "ScrGenEthWULTask10", "69", "Comp_Iter_CheckPulseLen_GenTimerWUL1_NotExpired"
TEST.SLOT: "2", "ScrGenEthWULPulse", "ScrGenEthWULTask10", "1", "Comp_CheckPulseLen_GenTimerWUL1_Expired_PulseGenFinish"
TEST.SLOT: "3", "ScrGenEthWULPulse", "ScrGenEthWULTask10", "1", "Comp_CheckPulseLen_GenTimerWUL1_Expired_PulseGenAlreadyCompleated"
TEST.END
--

-- COMPOUND TESTS

TEST.SUBPROGRAM:<<COMPOUND>>
TEST.NEW
TEST.NAME:WUL1_GenWULPattern_NoRetry
TEST.NOTES:
DESCRIPTION:   Cyclic task for checking the WUL pulse length

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Compound test for checking whether no retry at generating WUL patterns is made if the pulse is valid.
TEST.END_NOTES:
TEST.SLOT: "1", "ScrGenEthWULPulse", "CheckWulPulsLength", "9", "Comp_Iter_WUL1_GenWULPattern"
TEST.SLOT: "2", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_WUL1_GenWULPattern_NoRetry"
TEST.END
--

-- COMPOUND TESTS

TEST.SUBPROGRAM:<<COMPOUND>>
TEST.NEW
TEST.NAME:WUL1_GenWULPattern_Retry
TEST.NOTES:
DESCRIPTION:   Cyclic task for checking the WUL pulse length

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Compound test for checking whether no retry at generating WUL patterns is made if the pulse is valid.
TEST.END_NOTES:
TEST.SLOT: "1", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "WUL1_ShToGND_DematureCnt_NotReset"
TEST.SLOT: "2", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_Iter_WUL1_GenWULPattern"
TEST.SLOT: "3", "ScrGenEthWULPulse", "CheckWulPulsLength", "1", "Comp_WUL1_GenWULPattern_Retry"
TEST.END
--

-- COMPOUND TESTS

TEST.SUBPROGRAM:<<COMPOUND>>
TEST.NEW
TEST.NAME:WUL1_StandbyMode_PulseValidation_AdcCircuitDefective
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests WUL1 pulse length validation in ScrWakeupHndlTask1
TEST.END_NOTES:
TEST.SLOT: "1", "ScrWakeupHndl", "ScrWakeupHndlTask1", "7", "WUL1_StandbyMode_PulseValidation_AdcCircuitDefective.001"
TEST.SLOT: "2", "ScrWakeupHndl", "ScrWakeupHndlTask1", "7", "WUL1_StandbyMode_PulseValidation_NoAdcCircuitDefective.002"
TEST.END
--

-- COMPOUND TESTS

TEST.SUBPROGRAM:<<COMPOUND>>
TEST.NEW
TEST.NAME:WUL2_GenPulseLength
TEST.NOTES:
DESCRIPTION:   Cyclic task for handling Eth Pattern Generation

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Compound test to test whether the generated pulse on WUL1 is with correct length.
TEST.END_NOTES:
TEST.SLOT: "1", "ScrGenEthWULPulse", "ScrGenEthWULTask10", "74", "Comp_Iter_CheckPulseLen_GenTimerWUL2_NotExpired"
TEST.SLOT: "2", "ScrGenEthWULPulse", "ScrGenEthWULTask10", "1", "Comp_CheckPulseLen_GenTimerWUL2_Expired_PulseGenFinish"
TEST.SLOT: "3", "ScrGenEthWULPulse", "ScrGenEthWULTask10", "1", "Comp_CheckPulseLen_GenTimerWUL2_Expired_PulseGenAlreadyCompleated"
TEST.END
--

-- COMPOUND TESTS

TEST.SUBPROGRAM:<<COMPOUND>>
TEST.NEW
TEST.NAME:WUL2_StandbyMode_PulseValidation_AdcCircuitDefective
TEST.NOTES:
DESCRIPTION:   Cyclic task routine for handling the wake-up events. Validation of WUL1 & 2 is done here.

PARAMETERS:    none

RETURN VALUE:  void

TEST CASE:     Tests WUL2 pulse length validation in ScrWakeupHndlTask1
TEST.END_NOTES:
TEST.SLOT: "1", "ScrWakeupHndl", "ScrWakeupHndlTask1", "7", "WUL2_StandbyMode_PulseValidation_AdcCircuitDefective.001"
TEST.SLOT: "2", "ScrWakeupHndl", "ScrWakeupHndlTask1", "7", "WUL2_StandbyMode_PulseValidation_NoAdcCircuitDefective.002"
TEST.END
--
