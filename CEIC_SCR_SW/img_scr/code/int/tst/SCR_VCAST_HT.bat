del /s /f /q %cd%\SCR_VCAST_HT\*.*
rd /s/q "%cd%\SCR_VCAST_HT"
del commands.tmp
del CCAST_.CFG
del "%cd%\doc\SCR_VCAST_HT_management_report.html"
del "%cd%\doc\SCR_VCAST_HT_Full_report.html"
del "%cd%\doc\SCR_VCAST_HT_Full_report.txt"
del SCR_VCAST_HT.vce

echo options C_ALT_COMPILE_CMD  >> commands.tmp
echo options C_ALT_EDG_FLAGS  >> commands.tmp
echo options C_ALT_PREPROCESS_CMD  >> commands.tmp
echo options C_COMPILER_CFG_SOURCE PY_CONFIGURATOR >> commands.tmp
echo options C_COMPILER_FAMILY_NAME GNU_Native >> commands.tmp
echo options C_COMPILER_HIERARCHY_STRING GNU Native_4.8_C >> commands.tmp
echo options C_COMPILER_OUTPUT_FLAG -o >> commands.tmp
echo options C_COMPILER_PY_ARGS --lang c --version 4.8 >> commands.tmp
echo options C_COMPILER_TAG GNU_C_48 >> commands.tmp
echo options C_COMPILER_VERSION_CMD gcc --version >> commands.tmp
echo options C_COMPILE_CMD gcc -c -g >> commands.tmp
echo options C_COMPILE_CMD_FLAG -c >> commands.tmp
echo options C_COMPILE_EXCLUDE_FLAGS -o** >> commands.tmp
echo options C_DEBUG_CMD gdb >> commands.tmp
echo options C_DEFINE_LIST _UNITTEST_TST_ __TASKING__ __STDC_VERSION__=199901 BRS_COMP_TASKING BRS_DERIVATIVE_tc39x __interrupt(x)= BRSHW_ENABLE_TIMER_INTERRUPT >> commands.tmp
echo options C_EDG_FLAGS -w --gcc --gnu_version 40800 >> commands.tmp
echo options C_EXECUTE_CMD  >> commands.tmp
echo options C_INCLUDE_FLAG -I >> commands.tmp
echo options C_LINKER_VERSION_CMD ld --version >> commands.tmp
echo options C_LINK_CMD gcc -g >> commands.tmp
echo options C_LINK_OPTIONS  >> commands.tmp
echo options C_OUTPUT_FLAG -o >> commands.tmp
echo options C_PREPROCESS_CMD gcc -E -C >> commands.tmp
echo options EVENT_LIMIT 20000 >> commands.tmp
echo options EXECUTABLE_EXTENSION  >> commands.tmp
echo options SBF_LOC_MEMBER_IN_NSP DECL_NAMESPACE >> commands.tmp
echo options SBF_LOC_MEMBER_OUTSIDE_NSP DECL_NAMESPACE >> commands.tmp
echo options SBF_LOC_NONMEMBER_IN_NSP DECL_NAMESPACE >> commands.tmp
echo options SBF_LOC_NONMEMBER_OUTSIDE_NSP DECL_NAMESPACE >> commands.tmp
echo options SOURCE_EXTENSION .c >> commands.tmp
echo options SUBSTITUTE_CODE_FOR_C_FILE FALSE >> commands.tmp
echo options VCAST_ASSEMBLY_FILE_EXTENSIONS asm s >> commands.tmp
echo options VCAST_AUTO_CLEAR_TEST_USER_CODE FALSE >> commands.tmp
echo options VCAST_COLLAPSE_STD_HEADERS COLLAPSE_SYSTEM_HEADERS >> commands.tmp
echo options VCAST_COMMAND_LINE_DEBUGGER TRUE >> commands.tmp
echo options VCAST_COMPILER_SUPPORTS_CPP_CASTS FALSE >> commands.tmp
echo options VCAST_COVERAGE_FOR_AGGREGATE_INIT TRUE >> commands.tmp
echo options VCAST_COVERAGE_SOURCE_FILE_PERSPECTIVE FALSE >> commands.tmp
echo options VCAST_DISABLE_CPP_EXCEPTIONS FALSE >> commands.tmp
echo options VCAST_DISABLE_STD_WSTRING_DETECTION TRUE >> commands.tmp
echo options VCAST_DISPLAY_FUNCTION_COVERAGE TRUE >> commands.tmp
echo options VCAST_ENABLE_FUNCTION_CALL_COVERAGE FALSE >> commands.tmp
echo options VCAST_ENVIRONMENT_FILES  >> commands.tmp
echo options VCAST_FORCE_ELAB_TYPE_SPEC TRUE >> commands.tmp
echo options VCAST_HAS_LONGLONG TRUE >> commands.tmp
echo options VCAST_INST_FILE_MAX_LINES 0 >> commands.tmp
echo options VCAST_MICROSOFT_LONG_LONG FALSE >> commands.tmp
echo options VCAST_NO_LONG_DOUBLE FALSE >> commands.tmp
echo options VCAST_NO_STDIN FALSE >> commands.tmp
echo options VCAST_PREPEND_TO_PATH_DIRS  >> commands.tmp
echo options VCAST_PREPROCESS_PREINCLUDE $(VECTORCAST_DIR)/DATA/gnu_native/48/intrinsics.h >> commands.tmp
echo options VCAST_REMOVE_PREPROCESSOR_COMMENTS TRUE >> commands.tmp
echo options VCAST_RPTS_DEFAULT_FONT_FACE Arial(8) >> commands.tmp
echo options VCAST_SCRIPT_LOG_SHOW_ONLY_ERRORS TRUE >> commands.tmp
echo options VCAST_SHOW_ONLY_DATA_WITH_EXPECTED_VALUES TRUE >> commands.tmp
echo options VCAST_SHOW_ONLY_EVENTS_WITH_EXPECTED_VALUES TRUE >> commands.tmp
echo options VCAST_STDIO FALSE >> commands.tmp
echo options VCAST_TORNADO_CONSTRUCTOR_CALL_FILE FALSE >> commands.tmp
echo options VCAST_TYPEOF_OPERATOR TRUE >> commands.tmp
echo options VCDB_CMD_VERB  >> commands.tmp
echo options VCDB_FILENAME  >> commands.tmp
echo options WHITEBOX YES >> commands.tmp
echo clear_default_source_dirs  >> commands.tmp
echo options TESTABLE_SOURCE_DIR . >> commands.tmp
echo options TESTABLE_SOURCE_DIR ..\src >> commands.tmp
echo environment build SCR_VCAST_HT.env >> commands.tmp
echo /E:SCR_VCAST_HT tools script run SCR_VCAST_HT.tst >> commands.tmp
echo /E:SCR_VCAST_HT execute batch >> commands.tmp
echo /E:SCR_VCAST_HT tools import_coverage SCR_VCAST_HT.cvr >> commands.tmp
echo /E:SCR_VCAST_HT reports custom full %cd%\doc\SCR_VCAST_HT_Full_report.html >> commands.tmp
"%VECTORCAST_DIR%\CLICAST"  /L:C tools execute commands.tmp false
"%VECTORCAST_DIR%\CLICAST" -lc option VCAST_CUSTOM_REPORT_FORMAT TEXT
"%VECTORCAST_DIR%\CLICAST" -e SCR_VCAST_HT reports custom full %cd%\doc\SCR_VCAST_HT_Full_report.txt