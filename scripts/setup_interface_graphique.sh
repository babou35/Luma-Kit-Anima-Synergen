#!/bin/bash
# setup_interface_graphique.sh – Interface légère + clavier virtuel pour Luma-Cœur.1 (écran Waveshare 5")

echo "[INSTALL] Début de l’installation graphique légère + clavier virtuel..."

# Mise à jour du système
sudo apt update && sudo apt upgrade -y

# Installation d’un environnement graphique minimal (Openbox)
sudo apt install --no-install-recommends xserver-xorg xinit openbox -y

# Installation d’un clavier virtuel (Onboard)
sudo apt install onboard -y

# (Optionnel) Support tactile si nécessaire :
# sudo apt install xserver-xorg-input-evdev xinput -y

echo "[INSTALL] Installation terminée. Pour lancer l’interface graphique :"
echo "          startx"

# Fin
