# Project Fixes TODO

## High Priority (Cross-Platform Compatibility)
- [x] **Fix Linux Shell Commands**: Replace `cp`, `mv`, `rm` with `shutil` or `os` equivalents.
    - [x] `AIDoblador\TTS_repo\TTS\demos\xtts_ft_demo\xtts_demo.py`: Uses `os.system("cp ...")` -> Replaced with `shutil.copy`.
    - [x] `AIDoblador\TTS_repo\TTS\encoder\utils\prepare_voxceleb.py`: Uses `subprocess.call("mv ...")` -> Replaced with `shutil.move`.
    - [ ] `AIDoblador\TTS_repo\notebooks\dataset_analysis\CheckDatasetSNR.ipynb`: Uses `rm`. (Low priority as it is a notebook).
- [x] **Fix Python Interpreter Path**: Ensure all subprocess calls to run python scripts use `sys.executable` instead of "python" or "python3".
    - [x] `AIDoblador\Trainer_repo\trainer\distribute.py`: Replaced `python3` with `sys.executable`.
    - [x] `AIDoblador\soni_translate\preprocessor.py`: Replaced `python -m yt_dlp` with `sys.executable`.
    - [x] `AIDoblador\soni_translate\utils.py`: Replaced `gdown` call to use `sys.executable`.

## Medium Priority (Robustness)
- [x] **Git Clone**: Ensure `git` is available or handle `os.system("git clone ...")` more gracefully in `AIDoblador\soni_translate\utils.py`. -> Replaced with `subprocess.run`.
- [ ] **FFmpeg path**: Ensure `ffmpeg` calls handle paths with spaces correctly (mostly handled by `subprocess` list args, but `os.system` or formatted strings might be issues).

## Completed
- [x] Fix `yt_dlp` execution path in `AIDoblador\soni_translate\preprocessor.py`.
- [x] Fix `python3` usage in `AIDoblador\Trainer_repo\trainer\distribute.py`.
- [x] Fix `gdown` execution path in `AIDoblador\soni_translate\utils.py`.