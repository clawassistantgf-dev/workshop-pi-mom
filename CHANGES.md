# Changelog — workshop-pi-mom

## v2 (pivot direct + structure)

- **`02-install.sh`** : Docker **optionnel** (`--with-docker` ou `INSTALL_DOCKER=1`). Lingering systemd conservé. Vérifs finales adaptées si Docker absent.
- **`03-configure.sh`** : plus de sandbox Docker ni de remote GitHub ; `pi-mom` en **exécution directe** sur le workspace ; structure `projects/` · `missions/` · `tools/` · validation ; Git **local** uniquement.
- **Doc** : `docs/MISSIONS.md` (GitHub **SSH** post-atelier), `docs/STRUCTURE_GUIDE.md`, `docs/SYSTEM_TEMPLATE.md`, `docs/UPDATE.md` (mise à jour pi-mom sans npm : relancer script 2).
- **Slides** (`slides_v3.md`) : alignées sur ce comportement.

## v1 (référence)

- Sandbox Docker `mom-sandbox`, option URL GitHub HTTPS dans le script 3.
