#!/bin/bash

echo "======================================="
echo "   VÉRIFICATION SYSTÈME – LUMA-CŒUR.1   "
echo "======================================="

BASE="/home/luma/scripts"
LOG="/home/luma/journal/tests.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")
echo "--- Vérification lancée le $DATE ---" >> $LOG

check() {
    SCRIPT=$1
    NAME=$2

    echo -n "[$NAME] Vérification syntaxique... "
    bash -n "$SCRIPT" 2>> $LOG
    if [ $? -ne 0 ]; then
        echo "ERREUR"
        echo "[$NAME] Erreur de syntaxe." >> $LOG
        return
    fi
    echo "OK"

    echo -n "[$NAME] Exécution testée... "
    bash "$SCRIPT" >> $LOG 2>&1
    if [ $? -ne 0 ]; then
        echo "ÉCHEC"
        echo "[$NAME] Échec à l'exécution." >> $LOG
    else
        echo "SUCCÈS"
        echo "[$NAME] Test réussi." >> $LOG
    fi
}

# Exemple de modules à tester — à adapter selon ta structure
check "$BASE/leds/test_pattern.sh" "LEDs"
check "$BASE/audio/test_tts.sh" "Voix (TTS)"
check "$BASE/audio/test_stt.sh" "Reconnaissance vocale (STT)"
check "$BASE/journal/test_entry.sh" "Journal vivant"
check "$BASE/rituels/test_serment.sh" "Serment de Présence"
check "$BASE/alertes/test_signal.sh" "Signal lumineux/sonore"

echo "---------------------------------------"
echo "Vérification terminée. Voir le log : $LOG"
echo "---------------------------------------"
