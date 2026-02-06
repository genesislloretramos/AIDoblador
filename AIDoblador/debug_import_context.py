import sys
import os
import traceback

print(f"CWD: {os.getcwd()}")
print("Sys.path:")
for p in sys.path:
    print(f"  {p}")

try:
    print("Importing TTS...")
    import TTS
    print(f"TTS: {TTS.__file__}")
    
    print("Importing TTS.utils...")
    import TTS.utils
    print(f"TTS.utils: {TTS.utils.__file__}")
    
    print("Importing TTS.utils.audio...")
    import TTS.utils.audio
    print(f"TTS.utils.audio: {TTS.utils.audio.__file__}")
    
    print("Importing TTS.api...")
    from TTS.api import TTS as TTSApi
    print("Success!")

except Exception:
    traceback.print_exc()
