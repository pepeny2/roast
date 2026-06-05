@echo off
setlocal
cd /d "%~dp0"

if "%~1"=="" (
  echo ROEST firmware flash
  echo.
  echo Drag and drop the firmware .bin file onto this .bat.
  echo You can also type or paste the .bin path below.
  echo.
  set /p FW=Firmware .bin path: 
) else (
  set "FW=%~1"
)

set "FW=%FW:"=%"

if not exist "%FW%" (
  echo.
  echo File not found:
  echo %FW%
  echo.
  pause
  exit /b 1
)

echo.
echo Firmware:
echo %FW%
echo.
echo Make sure the ROEST / P1 is connected by USB.
echo Press Ctrl+C to cancel, or any key to flash.
pause >nul

particle flash --serial "%FW%"
echo.
pause
