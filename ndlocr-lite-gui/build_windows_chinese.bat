@echo off
REM ============================================================
REM  NDLOCR-Lite Chinese Edition - Build Windows .exe
REM  PREREQUISITES on your Windows machine:
REM   1. Python 3.11 - 3.13
REM   2. Flutter SDK 3.27.4  (added to PATH, run "flutter doctor")
REM   3. Visual Studio 2022 with workload
REM      "Desktop development with C++" (needed to compile the
REM      Flutter Windows runner)
REM  Place this repo folder in an ASCII path (NO Chinese/fullwidth
REM  characters), e.g. C:\ndlocr-lite.
REM ============================================================
cd /d "%~dp0"

where flutter >nul 2>nul
if errorlevel 1 (
    echo [ERROR] Flutter SDK not found in PATH. Install Flutter 3.27.4 first.
    echo          See https://flet.dev/docs/publish/windows/
    pause
    exit /b 1
)

if not exist ocrenv (
    python -m venv ocrenv
)
call ocrenv\Scripts\activate

pip install -r ..\requirements.txt

if not exist src\nul (
    xcopy ..\src src /E /I /Q >nul
)

echo.
echo ============================================================
echo  Building Windows executable (Chinese default language) ...
echo ============================================================
flet build windows

echo.
echo ============================================================
echo  Build done. Executable:
echo    build\windows\runner\Release\ndlocr_lite.exe
echo  Copy the whole Release folder to a PC, unzip into an
echo  ASCII path, then double-click ndlocr_lite.exe.
echo ============================================================
pause
