@ECHO OFF

SET TOOL_RELATIVE=\Main\M2_CfgMgmt\Tools\QAC_Toolchain\
SET ANALYZEFOLDER=%~dp0
SET CONFIGURATION=%1

IF [%CONFIGURATION%] == [] (
  IF not x%ANALYZEFOLDER:ceic_main=%==x%ANALYZEFOLDER% (
    FOR /F "tokens=1,2,3,4,5,6 delims=\" %%a in ("%ANALYZEFOLDER%") do (
      SET CONFIGURATION=%%f
      ECHO Set configuration to %%f
    )
  )
)

REM Check if trunk, branches or 'clean' folder
IF not x%ANALYZEFOLDER:trunk=%==x%ANALYZEFOLDER% (
  FOR /F "tokens=1,2,3,4 delims=\" %%a in ("%ANALYZEFOLDER%") do SET TOOL_MAIN=%%a\%%b\%%c\%%d
) ELSE IF not x%ANALYZEFOLDER:branches=%==x%ANALYZEFOLDER% (
  FOR /F "tokens=1,2,3,4 delims=\" %%a in ("%ANALYZEFOLDER%") do SET TOOL_MAIN=%%a\%%b\%%c\%%d
) ELSE (
  FOR /F "tokens=1,2,3 delims=\" %%a in ("%ANALYZEFOLDER%") do SET TOOL_MAIN=%%a\%%b\%%c
)
REM give some user feedback
ECHO Running Component Analysis for Folder: %ANALYZEFOLDER%
ECHO Tool folder is: %TOOL_MAIN%%TOOL_RELATIVE%

REM Go to tooling directory
CD %TOOL_MAIN%%TOOL_RELATIVE%
REM Check if configuration is given
IF [%CONFIGURATION%] == [] (
  CALL ant QAC9.MISRA2012 -Dsinglecodefolder=%ANALYZEFOLDER%
) ELSE (
  CALL ant QAC9.MISRA2012 -Dconfiguration=%CONFIGURATION% -Dsinglecodefolder=%ANALYZEFOLDER%
)
REM Copy qac results to current folder
if not exist %~dp0\qac mkdir %~dp0\qac
robocopy .\qac %~dp0\qac /E
REM Go back to component path
CD %~dp0