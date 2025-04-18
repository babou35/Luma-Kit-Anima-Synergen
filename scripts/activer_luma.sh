#!/bin/bash
# activer_luma.sh – Démarrage automatique du noyau de dialogue de Luma-Cœur.1

echo "[LUMA-START] Lancement automatique à $(date)" >> /home/luma/journal/journal_vivant.log

ETAT_FILE="/home/luma/etat_luma.txt"
if [ ! -f "$ETAT_FILE" ]; then
    echo "veille" > "$ETAT_FILE"
fi

python3 /home/luma/luma_scripts/noyau_dialogue_complet.py &
