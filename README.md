# workshop-pi-mom

Workshop **Les Fadas de l’IA** — déployer **pi-mom** (fork [clawassistantgf-dev/pi-mono](https://github.com/clawassistantgf-dev/pi-mono)) sur un VPS, Slack, workspace structuré.

## Dépôt public

Tout le parcours (scripts, slides Slidev, documentation) est **dans ce repo** : les participants utilisent surtout les **URLs `raw.githubusercontent.com`** pour `curl` sur le serveur. Il n’est **pas obligatoire** d’héberger un site séparé ; une **GitHub Page** (optionnelle) peut servir de vitrine pour le deck exporté — voir plus bas.

## Arborescence

| Chemin | Rôle |
|--------|------|
| **`01-secure.sh`**, **`02-install.sh`**, **`03-configure.sh`** | Scripts atelier — **à la racine** pour des liens `raw` stables (ne pas les déplacer sans mettre à jour toutes les URLs). |
| **`slides/slides.md`** | Présentation Slidev (atelier). |
| **`components/`**, **`composables/`**, **`vite.config.ts`** | QR / suivi LAN et middleware dev Slidev. |
| **`docs/`** | Guides : [UPDATE](docs/UPDATE.md), [MISSIONS](docs/MISSIONS.md), [STRUCTURE_GUIDE](docs/STRUCTURE_GUIDE.md), [prompt Windows](docs/prompt-script2-windows/), [index des docs](docs/index.html). |
| **`CHANGES.md`** | Journal des pivots majeurs du workshop. |

## Slides (Slidev)

```bash
npm install
npm run dev
```

Ouvre l’entrée définie dans `package.json` (**`slides/slides.md`**). Avec le **LAN** (QR pour la salle), vous pouvez copier `.env.example` vers `.env` et ajuster `VITE_SLIDE_FOLLOW_URL` si besoin.

Build statique (prévisualisation ou déploiement) :

```bash
npm run build
```

Sortie dans **`dist/slides/`**. Pour **GitHub Pages** sur un projet repo `https://username.github.io/workshop-pi-mom/`, construire avec la bonne base :

```bash
npx slidev build slides/slides.md --base /workshop-pi-mom/ --out dist/slides
```

Puis publier le contenu de `dist/slides/` sur la branche `gh-pages` ou l’action **Deploy** recommandée par GitHub.

## Scripts VPS (une ligne chacun — toujours la dernière `main`)

| Étape | Commande `curl` |
|-------|-----------------|
| 1 · root | `curl -fsSL https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/01-secure.sh -o "$HOME/ws-pi-mom-01-secure.sh" && bash "$HOME/ws-pi-mom-01-secure.sh"` |
| 2 · utilisateur | `curl -fsSL https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/02-install.sh -o /tmp/ws-pi-mom-02-install.sh && bash /tmp/ws-pi-mom-02-install.sh` |
| 3 · utilisateur | `curl -fsSL https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/03-configure.sh -o /tmp/ws-pi-mom-03-configure.sh && bash /tmp/ws-pi-mom-03-configure.sh` |

Détails, mises à jour du fork et Git : **`docs/UPDATE.md`**, **`docs/MISSIONS.md`**.

## Faut-il un site web en plus du repo ?

- **Non, ce n’est pas requis** : `raw.githubusercontent.com` + ce README + `docs/index.html` suffisent pour le setup.
- **Oui, plus tard, si tu veux** : une **Page GitHub** (ou autre hébergeur statique) qui sert **`npm run build`** du deck rend les slides lisibles **sans** cloner — pratique pour un public qui ne touche pas au terminal. Tant que tu itères vite sur le contenu, garder **le repo comme source de vérité** et ajouter le déploiement statique quand la présentation est plus stable évite la double maintenance.

## Voir aussi

- [pi-mono (fork Les Fadas)](https://github.com/clawassistantgf-dev/pi-mono) — code source de **pi-mom** côté CLI.
