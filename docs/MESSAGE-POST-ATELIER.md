# Après l’atelier — ce que tu fais maintenant

Message court pour tout le monde : **tu n’as qu’une chose à retenir par situation**. Le reste est dans le **dépôt unique** [clawassistantgf-dev/workshop-pi-mom](https://github.com/clawassistantgf-dev/workshop-pi-mom) (scripts, doc, PDF des slides).

---

## 1 · Tu étais bloqué au script 2 (Windows / étapes pi-mono)

**À faire, dans l’ordre :**

1. Ouvre la **page d’aide** (boutons ChatGPT · Claude · Gemini + texte du prompt) :  
   **<https://clawassistantgf-dev.github.io/workshop-pi-mom/>**  
   → tu colles le prompt dans l’assistant, tu suivis ce qu’il te dit pour débloquer l’installation sur le PC ou sur le VPS.

2. Quand le script 2 passe, enchaîne le **script 3** sur le VPS comme pendant l’atelier (même principe : une commande `curl` puis exécution — voir le dépôt ou le PDF des slides).

3. Si la page ne charge pas le texte : récupère le prompt dans le fichier  
   [`prompt-deblocage-script2-windows-FR.txt`](https://github.com/clawassistantgf-dev/workshop-pi-mom/blob/main/docs/prompt-deblocage-script2-windows-FR.txt)  
   sur GitHub et collé-le à la main dans ton assistant.

**En résumé :** une page + un prompt guidé → tu ne restes pas seul face à l’erreur.

---

## 2 · Tu avais fini le setup (pi-mom qui tourne)

**À faire pour rester à jour et cohérent avec la version atelier :**

1. **Mettre à jour le programme `pi-mom`** (fork pi-mono, sans passer par npm public) : sur le **VPS**, en **utilisateur normal**, relance le **script 2** comme au début de l’atelier :

   ```bash
   curl -fsSL https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/02-install.sh -o /tmp/ws-pi-mom-02-install.sh && bash /tmp/ws-pi-mom-02-install.sh
   ```

   - **Docker** reste **optionnel** ; **pi-mom n’a pas besoin de Docker** pour fonctionner.
   - La config actuelle fait tourner l’agent **directement sur le serveur** (systemd), **sans** ancienne sandbox Docker : c’est bien ça le mode « run » prévu maintenant.

2. **Redémarre le service** après la mise à jour du binaire :

   ```bash
   systemctl --user restart pi-mom
   ```

3. **Ensuite**, enchaîne les **missions post-atelier** dans l’ordre : personnaliser `SYSTEM.md`, relier le workspace à GitHub en SSH, premier vrai projet sous `projects/…`. Détail : **[MISSIONS.md](https://github.com/clawassistantgf-dev/workshop-pi-mom/blob/main/docs/MISSIONS.md)**.

4. Pour toute question de **mise à jour** (scripts, redémarrage, branche `main`) : **[UPDATE.md](https://github.com/clawassistantgf-dev/workshop-pi-mom/blob/main/docs/UPDATE.md)**.

---

## 3 · Où tout avoir sous la main

| Besoin | Lien |
|--------|------|
| **Dépôt (source unique)** | <https://github.com/clawassistantgf-dev/workshop-pi-mom> |
| **Aide script 2 (page web)** | <https://clawassistantgf-dev.github.io/workshop-pi-mom/> |
| **Slides en PDF (à imprimer / hors ligne)** | <https://clawassistantgf-dev.github.io/workshop-pi-mom/workshop-pi-mom-slides.pdf> |
| Mise à jour VPS (`pi-mom`) | [docs/UPDATE.md](https://github.com/clawassistantgf-dev/workshop-pi-mom/blob/main/docs/UPDATE.md) |
| Après l’atelier (GitHub, missions) | [docs/MISSIONS.md](https://github.com/clawassistantgf-dev/workshop-pi-mom/blob/main/docs/MISSIONS.md) |
| Structure du workspace | [docs/STRUCTURE_GUIDE.md](https://github.com/clawassistantgf-dev/workshop-pi-mom/blob/main/docs/STRUCTURE_GUIDE.md) |

Regénérer le PDF en local (après `npm install`) :

```bash
npm run export:pdf
```

Fichier généré : `docs/workshop-pi-mom-slides.pdf`.

---

*Les Fadas de l’IA — workshop pi-mom*
