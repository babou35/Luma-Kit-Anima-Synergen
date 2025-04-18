#!/bin/bash

# Répertoire source et destination
SOURCE_DIR="/home/pi/luma_chambre_d_eveil_complete"
DEST_DIR="/home/pi/sauvegardes"
LOG_FILE="/home/pi/sauvegardes/sauvegarde_luma.log"
ERROR_LOG="/home/pi/sauvegardes/echec_sauvegarde.log"

# Date du jour
DATE=$(date +"%Y-%m-%d_%H%M%S")
ARCHIVE_NAME="chambre_eveil_${DATE}.tar.gz"

# Créer le dossier de sauvegarde s’il n’existe pas
mkdir -p "$DEST_DIR"

# Lancer la sauvegarde
tar -czf "${DEST_DIR}/${ARCHIVE_NAME}" "$SOURCE_DIR"
if [ $? -eq 0 ]; then
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Sauvegarde réussie : ${DEST_DIR}/${ARCHIVE_NAME}" >> "$LOG_FILE"
else
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] ECHEC DE LA SAUVEGARDE de $SOURCE_DIR" >> "$ERROR_LOG"
    # Place ici un appel à une LED, une alerte vocale, ou autre, si tu le souhaites.
fi
