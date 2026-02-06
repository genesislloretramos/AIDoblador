@echo off
setlocal
cd /d "%~dp0"
cd AIDoblador

echo =======================================================
echo     Starting AIDoblador (Local CPU)
...
echo [INFO] Launching AIDoblador...
...
echo =======================================================

:: Check venv
if not exist "venv" (
    echo [ERROR] Virtual environment not found. Please run setup_local.bat first.
    pause
    exit /b 1
)

:: Activate venv
call venv\Scripts\activate

:: Check for saved token
if exist "hf_token.txt" goto LoadToken
goto AskToken

:LoadToken
set /p YOUR_HF_TOKEN=<hf_token.txt
echo [INFO] Token loaded from hf_token.txt
goto Launch

:AskToken
echo.
echo If you want to use Pyannote (Speaker Diarization), you need a Hugging Face Token.
echo If you don't have one or don't need diarization, just press Enter.
set /p "HF_TOKEN=Enter Hugging Face Token (or press Enter to skip): "

if "%HF_TOKEN%"=="" goto Launch

set "YOUR_HF_TOKEN=%HF_TOKEN%"
echo [INFO] Token set.
:: Write without trailing space
<nul set /p="%HF_TOKEN%" > hf_token.txt
echo [INFO] Token saved to hf_token.txt
goto Launch

:Launch
echo.
echo [INFO] Launching SoniTranslate...
echo [INFO] Open your browser at http://127.0.0.1:7860 when ready.
echo.

:: cd SoniTranslate (Already in root)
python app_rvc.py --cpu_mode --language catalan

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Application crashed.
    pause
)
