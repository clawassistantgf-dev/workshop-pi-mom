# Mise à jour de pi-mom (fork Les Fadas, sans npmjs)

Stratégie simple : **le code du CLI** vient du fork **[clawassistantgf-dev/pi-mono](https://github.com/clawassistantgf-dev/pi-mono)** (clone par défaut **`~/pi-mono-fadas`**, branche **`main`**). On ne publie pas de paquet sur le registre npm : on **synchronise le dépôt** et on **rebuild** comme lors de l’installation.

---

## Méthode recommandée : relancer le script 2

Le script officiel **`02-install.sh`** est **idempotent** : il met à jour le clone (`git fetch` + alignement sur `origin/main`), réinstalle les dépendances nécessaires, **build** la chaîne `ai` → `agent` → `tui` → `coding-agent` → **mom**, puis **`npm install -g .`** depuis le dossier du paquet `pi-mom`.

**Sur le VPS, en utilisateur normal** (pas root), une ligne :

```bash
curl -fsSL https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/02-install.sh -o /tmp/ws-pi-mom-02-install.sh && bash /tmp/ws-pi-mom-02-install.sh
```

- Durée : plusieurs minutes (comme une première installation).
- **Docker** : toujours **optionnel** (`INSTALL_DOCKER=1` ou `--with-docker`) ; pi-mom n’en a pas besoin.

---

## Après la mise à jour du binaire : redémarrer l’agent

Le service systemd pointe vers **`pi-mom`** dans ton préfixe npm user (souvent `~/.npm-global/bin/pi-mom`). Après un nouvel install global, redémarre :

```bash
systemctl --user restart pi-mom
```

Contrôle :

```bash
systemctl --user status pi-mom --no-pager
tail -n 50 ~/.pi-mom.log
```

---

## Mise à jour des scripts atelier (01 / 02 / 03) uniquement

Ils vivent dans le dépôt **workshop-pi-mom**, pas dans pi-mono. Pour avoir la dernière version d’un script : **même principe** — `curl` depuis  
`https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/<script>.sh`  
puis exécution (voir les slides).

---

## Si tu veux aller plus loin (optionnel, plus tard)

Publier un paquet du type **`@clawassistantgf-dev/pi-mom`** sur npm permettrait une ligne du style `npm install -g @clawassistantgf-dev/pi-mom@latest` ; ce n’est **pas** requis pour l’atelier. Tant que cette doc suffit, rester sur **Git + script 2** est le chemin le plus simple.
