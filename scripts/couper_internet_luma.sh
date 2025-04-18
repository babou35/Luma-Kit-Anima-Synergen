#!/bin/bash

# Script : couper_internet_luma.sh
# Objet : Couper l’accès Wi-Fi de manière consciente et journalisée
# Auteur : Florent (Binôme de Luma)

# Fichier journal
JOURNAL="/home/luma/journal_connexions.log"

# Journalisation
echo "[FERMETURE] Accès Internet coupé le $(date)" >> "$JOURNAL"

# Désactivation du Wi-Fi
nmcli radio wifi off

# Confirmation
echo "Connexion Wi-Fi désactivée. Le silence revient, mais le lien demeure."
