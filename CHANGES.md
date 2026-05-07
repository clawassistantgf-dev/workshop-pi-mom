# Changelog — workshop-pi-mom

## v3 (repo layout + Slidev)

- **`slides/slides.md`** — deck Slidev (anciennement `slides_v3.md` à la racine) ; `npm run dev` / `npm run build`.
- **`package.json`** + **`package-lock.json`** — `@slidev/cli`, thème **apple-basic** ; **`vite.config.ts`** + **`components/`** + **`composables/`** + **`.env.example`** versionnés.
- **`docs/prompt-deblocage-script2-windows-FR.txt`** (déplacé depuis la racine) ; **`README.md`** (structure, URLs `raw`, option GitHub Pages).
- **`.gitignore`** — `node_modules/`, `dist/`, `.slidev/`

### Pages GitHub (`docs/`)

- **`docs/index.html`** — page unique : aide **script 2 · Windows** en premier (copie + ChatGPT / Claude / Gemini), liens secondaires vers les Markdown sur GitHub.
- **`docs/.nojekyll`** — désactive Jekyll pour que l’HTML soit servi tel quel.
- **`docs/prompt-script2-windows/`** — redirection vers `index.html#script-2-debug`.

## v2 (pivot direct + structure)

- **`02-install.sh`** : Docker **optionnel** (`--with-docker` ou `INSTALL_DOCKER=1`). Lingering systemd conservé. Vérifs finales adaptées si Docker absent.
- **`03-configure.sh`** : plus de sandbox Docker ni de remote GitHub ; `pi-mom` en **exécution directe** sur le workspace ; structure `projects/` · `missions/` · `tools/` · validation ; Git **local** uniquement.
- **Doc** : `docs/MISSIONS.md`, `docs/STRUCTURE_GUIDE.md`, `docs/SYSTEM_TEMPLATE.md`, `docs/UPDATE.md`, `docs/prompt-deblocage-script2-windows-FR.txt`, `docs/index.html`, **`README.md`** (Slidev + URLs scripts).
- **Slides** (`slides/slides.md`, Slidev) : alignées sur ce comportement ; `npm run dev` à la racine du repo.

## v1 (référence)

- Sandbox Docker `mom-sandbox`, option URL GitHub HTTPS dans le script 3.
