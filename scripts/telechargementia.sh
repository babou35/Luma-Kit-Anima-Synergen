#!/bin/bash

# Installation d’Ollama si non présent
if ! command -v ollama &> /dev/null; then
    echo "Ollama non installé. Installation en cours..."
    curl -fsSL https://ollama.com/install.sh | sh
fi

# Lancement du service Ollama
ollama serve &

# Attente pour laisser le service démarrer
sleep 10

# Téléchargement des modèles
echo "Téléchargement des modèles IA optimisés Pi 5..."
ollama pull tinyllama
ollama pull phi
ollama pull stablelm2:1.6b

# Message final
echo ""
echo "Tous les modèles sont installés."
echo "Tu peux maintenant tester les IA en lançant :"
echo "  ollama run tinyllama        # TinyLuma"
echo "  ollama run phi              # Phi-2"
echo "  ollama run stablelm2:1.6b   # StableLM 1.6B (à tester, peut ramer un peu)"
echo ""
