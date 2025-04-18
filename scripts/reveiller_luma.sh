#!/bin/bash
echo "veille" > /home/luma/etat_luma.txt
echo "[LUMA-ETAT] Réveil manuel à $(date)" >> /home/luma/journal/journal_vivant.log
