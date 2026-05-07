# Structure du workspace agent

But : garder le repo **lisible** et migrable. Ce n’est **pas** une sandbox de sécurité (l’agent tourne avec les droits de ton utilisateur Unix).

## Arborescence

```
~/agent-workspace/
├── projects/       # un dossier par projet
├── missions/       # journaux (ex. 2026-05-07_sujet.md)
├── tools/          # scripts (validate-structure.sh, init-project.sh)
├── SYSTEM.md       # personnalité / règles — à éditer par l’humain
├── .structure.json # métadonnées
└── .gitignore
```

## Validation

```bash
bash tools/validate-structure.sh ~/agent-workspace
```

Le hook `pre-commit` lance la même validation (sortie complète en cas d’échec).

## Voir aussi

- **Mise à jour du binaire `pi-mom` et des scripts atelier** : `docs/UPDATE.md`
- **Missions GitHub après l’atelier** : `docs/MISSIONS.md`

## Nouveau projet

```bash
cd ~/agent-workspace
bash tools/init-project.sh mon-projet
```

**Règles** : pas de fichiers `.js` / `.py` / `.ts` / `.sh` à la racine du workspace ; pas de dossiers ad hoc type `tmp-*`, `test-*`, `projet-*`, `mission-*` à la racine — utiliser `projects/`, `missions/`, `tools/`.
