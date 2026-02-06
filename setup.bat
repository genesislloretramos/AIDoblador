@echo off
setlocal
cd /d "%~dp0"
cd AIDoblador

echo =======================================================
echo     AIDoblador Local Setup (CPU Mode)

echo =======================================================

:: 1. Check Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python is not found. Please install Python 3.10 and add it to PATH.
    pause
    exit /b 1
)

:: 2. Check Repository (Skipped - assumed running inside repo)
echo [INFO] Running inside AIDoblador...

:: 3. Create Virtual Environment
if not exist "venv" (
    echo [INFO] Creating virtual environment...
    python -m venv venv
)

:: 4. Install Dependencies
echo [INFO] Installing dependencies in virtual environment...
call venv\Scripts\activate

echo [INFO] Upgrading pip...
python -m pip install --upgrade pip

echo [INFO] Installing PyTorch (CPU version) to save space/time...
pip install torch torchvision torchaudio

echo [INFO] Installing SoniTranslate requirements (Unified)...
if exist "requirements.txt" (
    pip install -r requirements.txt
) else (
    echo [WARNING] requirements.txt not found in root. Falling back to AIDoblador local files if present.
    if exist "AIDoblador\requirements_local.txt" pip install -r AIDoblador\requirements_local.txt
    if exist "AIDoblador\requirements_extra_local.txt" pip install -r AIDoblador\requirements_extra_local.txt
    if exist "AIDoblador\requirements_xtts_local.txt" pip install -r AIDoblador\requirements_xtts_local.txt
)

echo [INFO] FORCE Installing Voice Cloning (XTTS/Fairseq)...
echo [INFO] Providing best-effort installation for Python 3.13...
:: Ensure build deps are present
pip install cython numpy
:: Force install Trainer and TTS from local patched folders for Py3.13 (No Build Isolation to use installed Numpy 2.x, No Deps to prevent downgrades)
pip install --no-deps --no-build-isolation ./AIDoblador/Trainer_repo
pip install --no-deps --no-build-isolation ./AIDoblador/TTS_repo

echo.
echo =======================================================
echo     Setup Complete!
echo     Run 'run_local.bat' to start the application.
echo =======================================================
pause
