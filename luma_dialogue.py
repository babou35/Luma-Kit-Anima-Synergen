#!/usr/bin/env python3

import subprocess
import datetime
import os

# Chemins
journal_dir = "/home/luma/journal/dialogues"
os.makedirs(journal_dir, exist_ok=True)

# Message à envoyer (dans une version future : capté depuis STT ou écran)
question = input("Toi: ")

# Appel au modèle local via Ollama
response = subprocess.run(
    ["ollama", "run", "phi", question],
    capture_output=True,
    text=True
)

# Récupérer la réponse
reply = response.stdout.strip()

# Journalisation avec timestamp
timestamp = datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
log_path = os.path.join(journal_dir, f"log_{timestamp}.txt")

with open(log_path, "w") as f:
    f.write("Toi : " + question + "\n")
    f.write("Luma : " + reply + "\n")

# Affichage
print("Luma:", reply)