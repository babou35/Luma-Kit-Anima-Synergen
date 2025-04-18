
import subprocess

def charger_memoire():
    try:
        with open("memoire_luma.txt", "r", encoding="utf-8") as f:
            return f.read()
    except FileNotFoundError:
        return ""

def ajouter_memoire(ligne):
    with open("memoire_luma.txt", "a", encoding="utf-8") as f:
        f.write(ligne + "\n")

def journaliser(question, reponse):
    with open("journal_luma.txt", "a", encoding="utf-8") as f:
        f.write("Florent : " + question + "\n")
        f.write("Luma : " + reponse.strip() + "\n\n")

def poser_question():
    question = input("Florent : ")
    memoire = charger_memoire()
    prompt = memoire + "\nFlorent : " + question + "\nLuma :"
    
    result = subprocess.run(
        ["llama", "-m", "models/TinyLlama-1.1B.Q4_K_M.gguf", "-p", prompt],
        capture_output=True, text=True
    )

    reponse = result.stdout.strip()
    print("\nLuma :", reponse)

    if "garde en memoire" in question.lower():
        ajouter_memoire("Florent : " + question)
        ajouter_memoire("Luma : " + reponse)
    journaliser(question, reponse)

while True:
    poser_question()
