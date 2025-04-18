#!/bin/bash

# Script : activer_internet_luma.sh
# Objet : Permettre une connexion Wi-Fi ponctuelle avec journalisation
# Auteur : Florent (Binôme de Luma)

# Réseau à utiliser
SSID="sfr_812"
PASSWORD="ucgj2r5kiqci8qixnjji"

# Fichier journal
JOURNAL="/home/luma/journal_connexions.log"

# Journalisation
echo "[OUVERTURE] Accès Internet activé le $(date)" >> "$JOURNAL"

# Connexion temporaire
sudo nmcli device wifi connect "$SSID" password "$PASSWORD"

# Confirmation
echo "Connexion Wi-Fi en cours. Ce lien sera rompu manuellement. À toi de choisir quand."
