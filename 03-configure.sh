#!/bin/bash
#
# 03-configure.sh — Configuration finale et démarrage de l'agent
# Workshop : Les Fadas de l'IA
#
# Lancer après "pi" et "/login". Copier UNE ligne :
# curl -fsSL https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/03-configure.sh -o /tmp/ws-pi-mom-03-configure.sh && bash /tmp/ws-pi-mom-03-configure.sh
#

set -e
set -o pipefail

# ─────────────────────────────────────────────────────────
# 0. Vérifications préalables
# ─────────────────────────────────────────────────────────

if [ "$EUID" -eq 0 ]; then
  echo "⛔ Ce script ne doit PAS être lancé en root."
  exit 1
fi

if ! command -v pi-mom >/dev/null 2>&1; then
  echo "⛔ pi-mom n'est pas installé. Avez-vous bien lancé le script 2 ?"
  exit 1
fi

WORKSPACE="$HOME/agent-workspace"
if [ ! -d "$WORKSPACE" ]; then
  echo "⛔ ~/agent-workspace n'existe pas. Avez-vous bien lancé le script 2 ?"
  exit 1
fi

if [ ! -f "$HOME/.pi/agent/auth.json" ]; then
  echo "⛔ Vous n'avez pas encore fait /login dans pi."
  echo "   Lancez : pi"
  echo "   Puis dans pi : /login"
  echo "   Puis revenez ici."
  exit 1
fi

clear
echo "┌───────────────────────────────────────────────────┐"
echo "│  ⚙️   Configuration de votre agent                 │"
echo "└───────────────────────────────────────────────────┘"
echo
echo "  5 questions, puis structure workspace et mise en ligne."
echo "  (La liaison GitHub en SSH = mission post-workshop, voir docs/MISSIONS.md)"
echo "─────────────────────────────────────────────────────"
echo

# ─────────────────────────────────────────────────────────
# 1. Token Slack APP
# ─────────────────────────────────────────────────────────

echo "🔑 Token Slack APP (commence par xapp-)"
echo "   api.slack.com/apps → votre app → Basic Information → App-Level Tokens"
while true; do
  read -s -p "   ➡️  " MOM_SLACK_APP_TOKEN
  echo
  if [[ "$MOM_SLACK_APP_TOKEN" =~ ^xapp- ]]; then break; fi
  echo "   ⛔ Le token doit commencer par xapp-"
done
echo

# ─────────────────────────────────────────────────────────
# 2. Token Slack BOT
# ─────────────────────────────────────────────────────────

echo "🔑 Token Slack BOT (commence par xoxb-)"
echo "   api.slack.com/apps → votre app → OAuth & Permissions → Bot User OAuth Token"
while true; do
  read -s -p "   ➡️  " MOM_SLACK_BOT_TOKEN
  echo
  if [[ "$MOM_SLACK_BOT_TOKEN" =~ ^xoxb- ]]; then break; fi
  echo "   ⛔ Le token doit commencer par xoxb-"
done
echo

# ─────────────────────────────────────────────────────────
# 3. Provider LLM (détection automatique + confirmation)
# ─────────────────────────────────────────────────────────

DETECTED_PROVIDER=$(grep -oE '"[a-z-]+":\s*\{' "$HOME/.pi/agent/auth.json" | head -1 | sed 's/[":{ ]//g')

echo "🤖 Provider LLM"
echo "   Détecté depuis votre /login : ${DETECTED_PROVIDER:-aucun}"
echo
echo "   Providers supportés :"
echo "     - anthropic           (Claude Pro/Max)"
echo "     - openai-codex        (ChatGPT Plus/Pro)"
echo "     - github-copilot      (GitHub Copilot)"
echo "     - google-gemini-cli   (Gemini)"
echo "     - google-antigravity  (Antigravity)"
echo
read -p "   ➡️  Provider [${DETECTED_PROVIDER}] : " MOM_LLM_PROVIDER
MOM_LLM_PROVIDER=${MOM_LLM_PROVIDER:-$DETECTED_PROVIDER}

if [ -z "$MOM_LLM_PROVIDER" ]; then
  echo "   ⛔ Provider non détecté. Refaites /login dans pi."
  exit 1
fi
echo

# ─────────────────────────────────────────────────────────
# 4. Model (défaut suggéré selon provider)
# ─────────────────────────────────────────────────────────

case "$MOM_LLM_PROVIDER" in
  anthropic)         DEFAULT_MODEL="claude-sonnet-4-6" ;;
  openai-codex)      DEFAULT_MODEL="gpt-5.4-mini" ;;
  github-copilot)    DEFAULT_MODEL="claude-sonnet-4-6" ;;
  google-gemini-cli) DEFAULT_MODEL="gemini-2.5-pro" ;;
  google-antigravity)DEFAULT_MODEL="gemini-2.5-pro" ;;
  *)                 DEFAULT_MODEL="" ;;
esac

echo "🧠 Model (laissez vide pour le défaut suggéré)"
read -p "   ➡️  Model [${DEFAULT_MODEL}] : " MOM_LLM_MODEL
MOM_LLM_MODEL=${MOM_LLM_MODEL:-$DEFAULT_MODEL}
echo

# ─────────────────────────────────────────────────────────
# 5. Surnom de l'agent
# ─────────────────────────────────────────────────────────

echo "🦞 Prénom ou surnom de votre agent"
read -p "   ➡️  " AGENT_NAME
while [ -z "$AGENT_NAME" ]; do
  echo "   ⛔ Le nom ne peut pas être vide."
  read -p "   ➡️  " AGENT_NAME
done
echo

# ─────────────────────────────────────────────────────────
# 6. Écriture du .keys
# ─────────────────────────────────────────────────────────

echo "⏳ Écriture de $WORKSPACE/.keys ..."

printf '# Tokens Slack et config LLM — généré par 03-configure.sh\n' > "$WORKSPACE/.keys"
printf '# NE JAMAIS COMMITTER CE FICHIER\n' >> "$WORKSPACE/.keys"
printf 'MOM_SLACK_APP_TOKEN=%s\n' "$MOM_SLACK_APP_TOKEN" >> "$WORKSPACE/.keys"
printf 'MOM_SLACK_BOT_TOKEN=%s\n' "$MOM_SLACK_BOT_TOKEN" >> "$WORKSPACE/.keys"
printf 'MOM_LLM_PROVIDER=%s\n' "$MOM_LLM_PROVIDER" >> "$WORKSPACE/.keys"
if [ -n "$MOM_LLM_MODEL" ]; then
  printf 'MOM_LLM_MODEL=%s\n' "$MOM_LLM_MODEL" >> "$WORKSPACE/.keys"
fi

sed -i 's/\r$//' "$WORKSPACE/.keys"
chmod 600 "$WORKSPACE/.keys"
echo "✓ .keys créé (permissions 600)"

# ─────────────────────────────────────────────────────────
# 7. Partage de l'auth OAuth pi → pi-mom
# ─────────────────────────────────────────────────────────

mkdir -p "$HOME/.pi/mom"
cp "$HOME/.pi/agent/auth.json" "$HOME/.pi/mom/auth.json"
chmod 600 "$HOME/.pi/mom/auth.json"
echo "✓ Auth OAuth partagée avec pi-mom"

# ─────────────────────────────────────────────────────────
# 8. SYSTEM.md initial
# ─────────────────────────────────────────────────────────

if [ ! -f "$WORKSPACE/SYSTEM.md" ]; then
  cat > "$WORKSPACE/SYSTEM.md" <<EOF
# $AGENT_NAME — Système

Tu es **$AGENT_NAME**, l'agent personnel de ton utilisateur.

## Personnalité

À définir lors de votre première conversation. Demande à l'utilisateur :
- Comment veut-il que tu communiques (formel, familier, technique...) ?
- Quels sont tes domaines d'expertise principaux ?
- Quelles sont tes règles de base ?

## Règles techniques

- Tu tournes **directement sur le VPS** (processus utilisateur), pas dans un conteneur : tu as les mêmes capacités que ce compte Unix (fichiers, commandes). Sois prudent avec les commandes destructives et les secrets.
- Workspace : \`~/agent-workspace\` — place le code dans \`projects/\` ou \`tools/\` ; journaux de missions dans \`missions/\` (ex. \`missions/YYYY-MM-DD_sujet.md\`).
- Les tokens Slack et LLM sont dans \`~/agent-workspace/.keys\` (jamais dans Slack ni dans le dépôt).

## GitHub

La liaison d'un dépôt distant (Git en **SSH** uniquement) se fait **après** l'atelier : voir
https://github.com/clawassistantgf-dev/workshop-pi-mom/blob/main/docs/MISSIONS.md

## Première mission

Quand l'utilisateur t'envoie son premier "Bonjour" :
1. Présente-toi en tant que $AGENT_NAME.
2. Propose-lui de t'interviewer pour personnaliser ce SYSTEM.md.
3. Pose tes questions une par une.
EOF
  echo "✓ SYSTEM.md créé"
else
  echo "✓ SYSTEM.md existe déjà — non écrasé"
fi

# ─────────────────────────────────────────────────────────
# 9. .gitignore (avec .keys protégé)
# ─────────────────────────────────────────────────────────

if [ ! -f "$WORKSPACE/.gitignore" ]; then
  cat > "$WORKSPACE/.gitignore" <<'EOF'
.env
.env.*
.keys
*.key
*.pem
node_modules/
.npm/
.cache/
*.log
.pi/
sessions/
events/
EOF
else
  if ! grep -q '^\.keys$' "$WORKSPACE/.gitignore"; then
    echo ".keys" >> "$WORKSPACE/.gitignore"
  fi
fi
echo "✓ .gitignore vérifié (.keys exclu)"

# ─────────────────────────────────────────────────────────
# 10. Structure stricte du workspace
# ─────────────────────────────────────────────────────────

echo "⏳ Initialisation de la structure du workspace..."

mkdir -p "$WORKSPACE/projects"
mkdir -p "$WORKSPACE/missions"
mkdir -p "$WORKSPACE/tools"

touch "$WORKSPACE/projects/.gitkeep"
touch "$WORKSPACE/missions/.gitkeep"
touch "$WORKSPACE/tools/.gitkeep"

cat > "$WORKSPACE/missions/README.md" <<'EOF'
# Missions — journaux

Un fichier par mission complétée, par ex. `2026-05-07_setup-outil.md`.
EOF

cat > "$WORKSPACE/.structure.json" <<'EOF'
{
  "version": "1",
  "enforced": true,
  "description": "Structure du workspace agent — validée par tools/validate-structure.sh",
  "forbidden_at_root_globs": ["*.js", "*.py", "*.ts", "*.sh"],
  "forbidden_root_prefixes": ["tmp", "test", "projet", "mission"]
}
EOF

cat > "$WORKSPACE/tools/validate-structure.sh" <<'VEOF'
#!/bin/bash
set -e
WORKSPACE="${1:-.}"
WORKSPACE="$(cd "$WORKSPACE" && pwd)"
ERRORS=0
echo "🔍 Validation de la structure workspace..."
echo "   Workspace: $WORKSPACE"
echo
echo "📁 Dossiers obligatoires..."
for dir in projects missions tools; do
  if [ ! -d "$WORKSPACE/$dir" ]; then
    echo "  ❌ Manquant: $WORKSPACE/$dir"
    ERRORS=$((ERRORS + 1))
  else
    echo "  ✓ $dir/"
  fi
done
echo
echo "📄 Fichiers à la racine..."
ALLOWED_ROOT='^(SYSTEM\.md|README\.md|\.gitignore|\.structure\.json|\.env|\.keys)$'
WARNINGS=0
shopt -s nullglob
for file in "$WORKSPACE"/*; do
  [ -e "$file" ] || continue
  [ -d "$file" ] && continue
  basename=$(basename "$file")
  if ! echo "$basename" | grep -qE "$ALLOWED_ROOT"; then
    echo "  ⚠️  Fichier non-standard à la racine: $basename"
    WARNINGS=$((WARNINGS + 1))
  fi
done
shopt -u nullglob
[ $WARNINGS -eq 0 ] && echo "  ✓ Fichiers racine OK (ou seulement fichiers attendus)" || echo "  ⚠️  $WARNINGS avertissement(s)"
echo
echo "🚫 Code et dossiers interdits à la racine..."
HAS_BAD=0
shopt -s nullglob
for ext in js py ts sh; do
  for f in "$WORKSPACE"/*."$ext"; do
    [ -f "$f" ] || continue
    echo "  ❌ Code à la racine: $(basename "$f") → projects/ ou tools/"
    ERRORS=$((ERRORS + 1))
    HAS_BAD=1
  done
done
shopt -u nullglob
for item in "$WORKSPACE"/*; do
  [ -e "$item" ] || continue
  base=$(basename "$item")
  [ -d "$item" ] || continue
  case "$base" in
    projects|missions|tools|.git) ;;
    tmp*|test*|projet*|mission*)
      echo "  ❌ Dossier non standard à la racine: $base → utilise projects/ ou missions/"
      ERRORS=$((ERRORS + 1))
      HAS_BAD=1
      ;;
  esac
done
[ $HAS_BAD -eq 0 ] && [ $ERRORS -eq 0 ] && echo "  ✓ Rien d'interdit détecté"
echo
echo "───────────────────────────────────────"
if [ $ERRORS -eq 0 ]; then
  echo "✅ Structure valide"
  exit 0
else
  echo "❌ $ERRORS erreur(s)"
  exit 1
fi
VEOF
chmod +x "$WORKSPACE/tools/validate-structure.sh"

cat > "$WORKSPACE/tools/init-project.sh" <<'INITSCRIPT'
#!/bin/bash
set -e
if [ -z "$1" ]; then
  echo "Usage: bash tools/init-project.sh <nom-projet>"
  echo "Exemple: bash tools/init-project.sh mon-scraper"
  exit 1
fi
PROJECT_NAME="$1"
PROJECT_DIR="projects/$PROJECT_NAME"
if [ -d "$PROJECT_DIR" ]; then
  echo "❌ Le projet '$PROJECT_NAME' existe déjà"
  exit 1
fi
echo "⏳ Création du projet: $PROJECT_NAME"
mkdir -p "$PROJECT_DIR/src" "$PROJECT_DIR/tests"
CREATED=$(date -u +%Y-%m-%d)
{
  echo "# $PROJECT_NAME"
  echo
  echo "**Créé** : $CREATED"
  echo
  echo "## Description"
  echo "À compléter."
} > "$PROJECT_DIR/README.md"
echo "✅ Projet créé : $PROJECT_DIR"
INITSCRIPT
chmod +x "$WORKSPACE/tools/init-project.sh"

cat > "$WORKSPACE/projects/_TEMPLATE.md" <<'EOF'
# Nouveau projet

Utilise : `bash tools/init-project.sh nom-du-projet`

Place le code sous `projects/nom-du-projet/src/`, les tests sous `tests/`.
EOF

cd "$WORKSPACE"
if [ ! -d ".git" ]; then
  git init -q
  git config user.email "$USER@$(hostname)"
  git config user.name "$AGENT_NAME"
fi

mkdir -p "$WORKSPACE/.git/hooks"
cat > "$WORKSPACE/.git/hooks/pre-commit" <<'HOOK'
#!/bin/bash
WORKSPACE="$(git rev-parse --show-toplevel)"
if ! bash "$WORKSPACE/tools/validate-structure.sh" "$WORKSPACE"; then
  echo
  echo "❌ COMMIT REJETÉ — Corrige la structure ou lance : bash tools/validate-structure.sh"
  echo
  exit 1
fi
HOOK
chmod +x "$WORKSPACE/.git/hooks/pre-commit"

echo "✓ Structure workspace + validate / init-project + pre-commit"

# ─────────────────────────────────────────────────────────
# 11. Git : dépôt local uniquement (pas de remote GitHub ici)
# ─────────────────────────────────────────────────────────

cd "$WORKSPACE"

git add SYSTEM.md .gitignore .structure.json \
  projects/.gitkeep projects/_TEMPLATE.md \
  missions/.gitkeep missions/README.md \
  tools/.gitkeep tools/validate-structure.sh tools/init-project.sh

if ! git diff --cached --quiet 2>/dev/null; then
  if git rev-parse HEAD >/dev/null 2>&1; then
    git commit -q -m "chore: workspace structure ($AGENT_NAME)"
  else
    git commit -q -m "Initial commit: $AGENT_NAME workspace"
  fi
  echo "✓ Commit git workspace enregistré"
else
  if git status --porcelain | grep -q .; then
    git add -A
    if ! git diff --cached --quiet 2>/dev/null; then
      git commit -q -m "chore: sync workspace ($AGENT_NAME)" || true
      echo "✓ Commit git workspace enregistré"
    else
      echo "✓ Rien à committer (déjà à jour)"
    fi
  else
    echo "✓ Rien à committer (déjà à jour)"
  fi
fi

# ─────────────────────────────────────────────────────────
# 12. Service systemd user (pi-mom sans sandbox Docker)
# ─────────────────────────────────────────────────────────

SERVICE_DIR="$HOME/.config/systemd/user"
SERVICE_FILE="$SERVICE_DIR/pi-mom.service"

mkdir -p "$SERVICE_DIR"

cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=pi-mom Slack agent — version Les Fadas ($AGENT_NAME)
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
WorkingDirectory=$WORKSPACE
EnvironmentFile=$WORKSPACE/.keys
Environment="HOME=$HOME"
ExecStart=$HOME/.npm-global/bin/pi-mom $WORKSPACE
Restart=on-failure
RestartSec=10
StandardOutput=append:$HOME/.pi-mom.log
StandardError=append:$HOME/.pi-mom.log

[Install]
WantedBy=default.target
EOF

echo "✓ Service systemd écrit (exécution directe, pas de Docker)"

systemctl --user daemon-reload
systemctl --user stop pi-mom.service 2>/dev/null || true
systemctl --user enable pi-mom.service --quiet
systemctl --user start pi-mom.service

echo "⏳ Démarrage du service (5s)..."
sleep 5

# ─────────────────────────────────────────────────────────
# 13. Vérification
# ─────────────────────────────────────────────────────────

if systemctl --user is-active pi-mom.service >/dev/null 2>&1; then
  echo "✓ Service pi-mom actif"
else
  echo "✗ Le service pi-mom ne démarre pas. Extraits des logs :"
  echo "─────────────────────────────────────────────────────"
  tail -30 "$HOME/.pi-mom.log" 2>/dev/null || echo "(pas de log encore)"
  echo "─────────────────────────────────────────────────────"
  echo
  echo "💡 Diagnostic (une ligne, tout coller d’un coup) :"
  echo "which pi-mom; test -f $WORKSPACE/.keys; test -f $HOME/.pi/mom/auth.json; systemctl --user status pi-mom --no-pager; loginctl show-user \$USER | grep -i linger || true"
  echo
  echo "Activer lingering si besoin (une ligne) : sudo loginctl enable-linger \$USER"
  exit 1
fi

# ─────────────────────────────────────────────────────────
# 14. Message final
# ─────────────────────────────────────────────────────────

echo
echo "┌─────────────────────────────────────────────────────┐"
echo "│  🎉 $AGENT_NAME est en ligne !                      "
echo "└─────────────────────────────────────────────────────┘"
echo
echo "📌 Ouvrez Slack, puis testez (message suggéré) :"
echo "@$AGENT_NAME Bonjour ! Qui es-tu ?"
echo
echo "Pour relancer ce script plus tard (UNE ligne) :"
echo "curl -fsSL https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/03-configure.sh -o /tmp/ws-pi-mom-03-configure.sh && bash /tmp/ws-pi-mom-03-configure.sh"
echo
echo "Commandes utiles (UNE ligne chacune) :"
echo "tail -f ~/.pi-mom.log"
echo "systemctl --user status pi-mom"
echo "systemctl --user restart pi-mom"
echo
echo "GitHub (SSH) après l’atelier : docs/MISSIONS.md sur le repo workshop."
echo "─────────────────────────────────────────────────────"
