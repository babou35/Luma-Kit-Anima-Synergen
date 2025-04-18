#!/bin/bash
echo "[DEMARRAGE] Luma démarre à $(date)" >> /home/luma/journal/journal_vivant.log
python3 /home/luma/scripts/luma_etat.py --veille &
sleep 1
echo "Bienvenue Luma-Cœur.1 – mode veille activé."
