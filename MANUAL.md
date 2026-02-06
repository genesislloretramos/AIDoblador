# 📘 Manual d'Usuari - AIDoblador

Aquesta guia t'ajudarà a treure el màxim profit d'**AIDoblador**, des de la configuració inicial fins a la creació del teu primer doblatge.

## 📋 Taula de Continguts
1. [Configuració Inicial](#1-configuració-inicial)
2. [Interfície d'Usuari](#2-interfície-dusuari)
3. [Com Doblar un Vídeo (Pas a Pas)](#3-com-doblar-un-vídeo-pas-a-pas)
4. [Solució de Problemes](#4-solució-de-problemes)

---

## 1. Configuració Inicial

Abans de començar, hi ha un parell de configuracions importants per habilitar totes les funcionalitats d'IA.

### ✅ Acceptar Llicència de Coqui XTTS
El clonador de veu (XTTS) requereix acceptar la seva llicència.
1. La primera vegada que executis `run.bat`, és possible que la descàrrega del model s'aturi.
2. Si passa això, el programa et demanarà que visitis un enllaç per acceptar els termes.
3. Un cop acceptats, torna a executar el programa i es descarregarà automàticament.

### 🔑 Token de Hugging Face (Per a Diarització)
Si vols que l'IA distingeixi entre diferents parlants (Diarització), necessites un Token gratuït.
1. Crea un compte a [Hugging Face](https://huggingface.co).
2. Ves a **Settings > Access Tokens** i crea un token nou (Tipus: "Read").
3. Accepta les condicions d'ús del model `pyannote/speaker-diarization-3.1` i `pyannote/segmentation-3.0` a les seves pàgines respectives.
4. En iniciar `run.bat`, el sistema et demanarà el Token. Enganxa'l i prem Enter. Es guardarà per a la propera vegada.

---

## 2. Interfície d'Usuari

L'aplicació té diverses pestanyes principals:

*   **Traducció (Multilingual)**: La pestanya principal on carregaràs el vídeo i configuraràs la traducció.
*   **Text a Veu (TTS)**: Per provar veus soltes o generar àudio a partir de text escrit manualment.
*   **Clonació de Veu**: Eines avançades per entrenar o refinar veus clonades.

---

## 3. Com Doblar un Vídeo (Pas a Pas)

### 1. Pujar el Vídeo
A la pestanya **Traducció**, arrossega el teu fitxer de vídeo (`.mp4`, `.avi`, etc.) al requadre d'entrada o enganxa un enllaç de YouTube.

### 2. Configurar Idiomes
*   **Idioma d'origen**: Pots deixar-ho en "Automatic detection" o seleccionar l'idioma original del vídeo.
*   **Idioma de destí**: Selecciona l'idioma al qual vols traduir (ex: `Catalan`).

### 3. Seleccionar Veu (TTS)
*   Tria el motor de veu. Recomanem **Coqui XTTS** per a la màxima qualitat i clonació.
*   Si vols que imiti la veu original, assegura't que l'opció de clonació està activada.

### 4. Processar
Fes clic al botó taronja gran **"Translate"**.
*   El procés pot trigar dependint de la llargada del vídeo i la potència del teu ordinador.
*   Primer transcriurà, després traduirà el text, i finalment generarà l'àudio.

### 5. Descarregar
Un cop acabat, apareixerà el vídeo resultant a la dreta. Pots reproduir-lo o descarregar-lo al teu ordinador.

---

## 4. Solució de Problemes

### ❌ Error: "ModuleNotFoundError: No module named 'TTS.utils.audio'"
Aquest error està solucionat a l'última versió.
*   Assegura't de fer `git pull` a la carpeta `AIDoblador` per tenir l'últim codi.
*   Si persisteix, esborra la carpeta i torna a instal·lar amb la comanda ràpida del LEGMIE.md.

### ⚠️ Descàrrega fallida de models
Si veus errors de connexió o "401 Client Error":
*   Verifica la teva connexió a internet.
*   Comprova que el teu **Hugging Face Token** sigui vàlid i tingui permisos de lectura ("Read").
*   Assegura't d'haver acceptat les llicències dels models a la web de Hugging Face.

### 🐢 El procés és lent
*   L'ús de **CPU** és molt més lent que utilitzar una targeta gràfica (GPU).
*   Si tens una targeta **NVIDIA**, assegura't d'instal·lar els controladors CUDA per accelerar el procés x10.

---
*Creat amb ❤️ per l'equip d'AIDoblador*
