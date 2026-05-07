# Missions post-workshop

Quand les scripts `01`–`03` sont passés et que **l’agent répond dans Slack**, enchaîne dans cet ordre. Le fil conducteur : **travail sérieux sur le VPS**, **GitHub comme nuage** pour le code, puis **premier projet agentique** quand la base est solide.

## Pourquoi GitHub « comme un cloud »

Ton workspace vit sur le serveur (`~/agent-workspace`). **GitHub n’est pas obligatoire** pour que l’agent fonctionne. En revanche, c’est le **nuage le plus simple** pour : sauvegarder l’historique Git, synchroniser depuis plusieurs machines, et partager un dépôt propre. Tout le flux **push se fait en SSH** (`git@github.com` — pas de HTTPS pour ce workshop).

**Mettre à jour le binaire `pi-mom`** (nouvelle version du fork) **sans npmjs** : voir **`docs/UPDATE.md`** — en pratique, relancer le **script 2** sur le VPS puis `systemctl --user restart pi-mom`.

---

## Mission 1 — Personnaliser `SYSTEM.md`

Interview dans Slack, puis édition de `~/agent-workspace/SYSTEM.md`, puis :

```bash
systemctl --user restart pi-mom.service
```

---

## Mission 2 — Relier le workspace à GitHub (nuage, SSH uniquement)

1. Crée un dépôt **vide** sur GitHub (sans README si tu veux pousser un repo local déjà prêt).

2. Clé SSH dédiée (exemple) :

   ```bash
   ssh-keygen -t ed25519 -f ~/.ssh/id_github_workshop -N ""
   cat ~/.ssh/id_github_workshop.pub
   ```

   Ajoute la clé publique sur GitHub → Settings → SSH and GPG keys.

3. `~/.ssh/config` (exemple) :

   ```
   Host github.com
     HostName github.com
     User git
     IdentityFile ~/.ssh/id_github_workshop
   ```

4. Test : `ssh -T git@github.com`

5. Remote **SSH uniquement** (remplace `USER` et `REPO`) :

   ```bash
   cd ~/agent-workspace
   if git remote get-url origin >/dev/null 2>&1; then
     git remote set-url origin git@github.com:USER/REPO.git
   else
     git remote add origin git@github.com:USER/REPO.git
   fi
   git branch -M main
   git push -u origin main
   ```

---

## Mission 3 — Premier projet agentique *(quand 1 et 2 sont faits)*

**Condition d’entrée** : `SYSTEM.md` à ton goût, GitHub connecté (ou au minimum des commits locaux maîtrisés si tu repousses GitHub plus tard). Là, tu passes à un **vrai chantier** avec l’agent :

- Formule une **mission nette** dans Slack (objectif, contraintes, livrable attendu).
- L’agent travaille sous **`projects/<nom-du-projet>/`**.
- Tu valides par **commits** ; tu **pushes** vers GitHub quand tu es content du point d’étape.

C’est ton **premier projet agentique end-to-end** : brief → code sur le VPS → historique dans le nuage.

---

## Mission 4 — Affiner en continu

Itérer sur `SYSTEM.md`, redémarrer le service si besoin, commit + push à chaque amélioration utile.

---

## Support

`tail -f ~/.pi-mom.log` — `systemctl --user status pi-mom`
