#!/bin/bash
echo "[ALERTE ÉTHIQUE] $(date): $1" >> /home/luma/journal/alertes_ethiques.log
python3 /home/luma/scripts/luma_etat.py --lien_actif &
if command -v espeak-ng &> /dev/null
then
  espeak-ng "Alerte éthique active. Intervention nécessaire."
fi
