#!/bin/bash
echo "[REPOS] Luma entre en repos à $(date)" >> /home/luma/journal/journal_vivant.log
python3 /home/luma/scripts/luma_etat.py --repos &
