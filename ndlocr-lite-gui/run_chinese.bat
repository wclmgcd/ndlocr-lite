@echo off
REM ============================================================
REM  NDLOCR-Lite Chinese Edition - Run from source (no packaging)
REM  Runs the fully Chinese GUI instantly. No .exe needed.
REM  PREREQUISITE: install Flutter SDK 3.27.4 and add it to PATH
REM  (needed by Flet to launch the desktop client).
REM  Place this repo folder in an ASCII path (NO Chinese/fullwidth
REM  characters), e.g. C:\ndlocr-lite, otherwise it may fail to start.
REM ============================================================
cd /d "%~dp0"

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
echo  Starting NDLOCR-Lite (Chinese UI) ...
echo  Switch language anytime via the button at top-right.
echo ============================================================
flet run
pause
