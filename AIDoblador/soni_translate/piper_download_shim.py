
import os
import json
import logging
from pathlib import Path
from urllib.request import urlopen
from piper.download_voices import download_voice as piper_download_voice, VOICES_JSON

logger = logging.getLogger(__name__)

def get_voices(download_dir, update_voices=False):
    """
    Retrieves available voices from the official source.
    Ignores download_dir and update_voices for simplicity in this shim, 
    fetching directly from URL as per piper.download_voices logic.
    """
    logger.debug("Downloading voices.json file: '%s'", VOICES_JSON)
    try:
        with urlopen(VOICES_JSON) as response:
            voices_dict = json.load(response)
        return voices_dict
    except Exception as e:
        logger.error(f"Failed to download voices.json: {e}")
        return {}

def ensure_voice_exists(name, data_dir, download_dir, voices_info):
    """
    Ensures the voice model and config exist. Download if missing.
    """
    # Check if exists in any data_dir
    for d in data_dir:
        model_path = Path(d) / f"{name}.onnx"
        config_path = Path(d) / f"{name}.onnx.json"
        if model_path.exists() and config_path.exists():
            return

    # If not found, download to download_dir
    logger.info(f"Downloading voice {name} to {download_dir}...")
    try:
        piper_download_voice(name, Path(download_dir), force_redownload=False)
    except Exception as e:
        logger.error(f"Failed to download voice {name}: {e}")
        raise

def find_voice(name, data_dir):
    """
    Finds the path to the voice model and config.
    """
    for d in data_dir:
        model_path = Path(d) / f"{name}.onnx"
        config_path = Path(d) / f"{name}.onnx.json"
        
        # Also check just the directory passed (recursive/flexible search if needed, but stick to simple for now)
        if hasattr(d, "iterdir"): # if it is a Path object
             d_path = d
        else:
             d_path = Path(d)

        # Check direct path
        p = d_path / f"{name}.onnx"
        c = d_path / f"{name}.onnx.json"
        if p.exists() and c.exists():
            return str(p), str(c)
            
        # Also check inside the download_dir if it was passed as part of data_dir list
        # text_to_speech.py joins data_dir[0] + download_dir, so it should be in data_dir list.
        
    raise ValueError(f"Voice {name} not found in {data_dir}")
