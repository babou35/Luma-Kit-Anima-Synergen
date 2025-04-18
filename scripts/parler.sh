#!/bin/bash
# Utilise espeak-ng ou flite (selon ce que tu installes)
if command -v espeak-ng &> /dev/null
then
  espeak-ng "$1"
elif command -v flite &> /dev/null
then
  flite -t "$1"
else
  echo "TTS non disponible"
fi
