#!/bin/bash

# Initialisation du module RTC PCF8523 pour Raspberry Pi 5
echo "Chargement du module RTC..."

# Active le module I2C si ce n’est pas déjà fait
sudo modprobe i2c-dev

# Charge le pilote pour PCF8523
sudo dtoverlay i2c-rtc,pcf8523

# Supprime le faux module d'horloge système s'il est actif
sudo sed -i '/^dtoverlay=i2c-rtc,pcf8523$/!b;n;c\' /boot/config.txt

# Synchronise l'heure système avec la RTC
sudo hwclock -s

echo "Heure synchronisée à partir de la RTC."
