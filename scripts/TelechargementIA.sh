#!/bin/bash

# Installation d’Ollama si non présent
if ! command -v ollama &> /dev/null; then
    echo "Ollama non installé. Installation..."
    curl -fsSL https://ollama.com/install.sh | sh
fi

# Lancement du service Ollama
ollama serve &

# Attente pour s'assurer que le service démarre
sleep 10

# Téléchargement des modèles
echo "Téléchargement des modèles IA..."
ollama pull tinydolphin
ollama pull phi
ollama pull stablelm-zephyr

# Message final
echo "Tous les modèles sont installés."
echo "Vous pouvez maintenant lancer les tests avec :"
echo "  ollama run tinydolphin"
echo "  ollama run phi"
echo "  ollama run stablelm-zephyr"
