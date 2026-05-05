#!/bin/bash
#
# 03-configure.sh — Configuration finale et démarrage de l'agent
# Workshop : Les Fadas de l'IA
#
# Lancement :
#   curl -fsSL https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/03-configure.sh -o /tmp/ws-pi-mom-03-configure.sh && bash /tmp/ws-pi-mom-03-configure.sh
#

set -e

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
echo "  6 questions, et votre agent est en ligne."
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

# Détecter le provider depuis l'auth.json de pi
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
# 6. URL repo GitHub (optionnel)
# ─────────────────────────────────────────────────────────

echo "💾 URL HTTPS de votre repo GitHub privé (optionnel)"
echo "   Ex: https://github.com/votre-user/mon-agent.git"
read -p "   ➡️  " GITHUB_REPO_URL
echo

# ─────────────────────────────────────────────────────────
# 7. Écriture du .keys
# ─────────────────────────────────────────────────────────

echo "⏳ Écriture de $WORKSPACE/.keys ..."

# Utilisation de printf pour éviter les CRLF
printf '# Tokens Slack et config LLM — généré par 03-configure.sh\n' > "$WORKSPACE/.keys"
printf '# NE JAMAIS COMMITTER CE FICHIER\n' >> "$WORKSPACE/.keys"
printf 'MOM_SLACK_APP_TOKEN=%s\n' "$MOM_SLACK_APP_TOKEN" >> "$WORKSPACE/.keys"
printf 'MOM_SLACK_BOT_TOKEN=%s\n' "$MOM_SLACK_BOT_TOKEN" >> "$WORKSPACE/.keys"
printf 'MOM_LLM_PROVIDER=%s\n' "$MOM_LLM_PROVIDER" >> "$WORKSPACE/.keys"
if [ -n "$MOM_LLM_MODEL" ]; then
  printf 'MOM_LLM_MODEL=%s\n' "$MOM_LLM_MODEL" >> "$WORKSPACE/.keys"
fi

# Sécurité : nettoie tout CRLF résiduel (ceinture + bretelles)
sed -i 's/\r$//' "$WORKSPACE/.keys"
chmod 600 "$WORKSPACE/.keys"
echo "✓ .keys créé (permissions 600)"

# ─────────────────────────────────────────────────────────
# 8. Partage de l'auth OAuth pi → pi-mom
# ─────────────────────────────────────────────────────────

mkdir -p "$HOME/.pi/mom"
cp "$HOME/.pi/agent/auth.json" "$HOME/.pi/mom/auth.json"
chmod 600 "$HOME/.pi/mom/auth.json"
echo "✓ Auth OAuth partagée avec pi-mom"

# ─────────────────────────────────────────────────────────
# 9. SYSTEM.md initial
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

- Tu tournes sur le serveur de l'utilisateur (Hostinger VPS).
- Tu peux exécuter du bash dans un sandbox Docker.
- Ton workspace de travail est : \`~/agent-workspace\`

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
# 10. .gitignore (avec .keys protégé)
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
# 11. Git init + commit initial
# ─────────────────────────────────────────────────────────

cd "$WORKSPACE"
if [ ! -d ".git" ]; then
  git init -q
  git config user.email "$USER@$(hostname)"
  git config user.name "$AGENT_NAME"
  git add SYSTEM.md .gitignore
  git commit -q -m "Initial commit: $AGENT_NAME is born"
  echo "✓ Repo git initialisé"
else
  echo "✓ Repo git déjà initialisé"
fi

if [ -n "$GITHUB_REPO_URL" ]; then
  if ! git remote get-url origin >/dev/null 2>&1; then
    git remote add origin "$GITHUB_REPO_URL"
    echo "✓ Remote git ajouté : $GITHUB_REPO_URL"
    echo "  💡 Pour pousser : cd ~/agent-workspace && git push -u origin main"
  fi
fi

# ─────────────────────────────────────────────────────────
# 12. Création du container Docker sandbox
# ─────────────────────────────────────────────────────────

DOCKER_SCRIPT="$HOME/pi-mono-fadas/packages/mom/docker.sh"
SANDBOX_NAME="mom-sandbox"

if ! docker ps -a --format '{{.Names}}' | grep -q "^${SANDBOX_NAME}$"; then
  echo "⏳ Création du container Docker sandbox..."
  if [ -f "$DOCKER_SCRIPT" ]; then
    bash "$DOCKER_SCRIPT" create "$WORKSPACE" 2>&1 | tail -3
  else
    # Fallback si docker.sh introuvable
    docker run -d --name "$SANDBOX_NAME" \
      -v "$WORKSPACE:/workspace" \
      alpine:latest tail -f /dev/null >/dev/null
    echo "Container $SANDBOX_NAME créé (fallback)"
  fi
else
  echo "✓ Container $SANDBOX_NAME existe déjà"
  # S'assurer qu'il tourne
  docker start "$SANDBOX_NAME" >/dev/null 2>&1 || true
fi

# Restart policy : le container survit aux reboots du serveur
docker update --restart unless-stopped "$SANDBOX_NAME" >/dev/null 2>&1 || true
echo "✓ Container configuré pour redémarrer au boot"

# ─────────────────────────────────────────────────────────
# 13. Service systemd user
# ─────────────────────────────────────────────────────────

SERVICE_DIR="$HOME/.config/systemd/user"
SERVICE_FILE="$SERVICE_DIR/pi-mom.service"

mkdir -p "$SERVICE_DIR"

cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=pi-mom Slack agent — version Les Fadas ($AGENT_NAME)
After=docker.service network-online.target
Wants=network-online.target

[Service]
Type=simple
WorkingDirectory=$WORKSPACE
EnvironmentFile=$WORKSPACE/.keys
Environment="DOCKER_HOST=unix:///var/run/docker.sock"
Environment="HOME=$HOME"
ExecStart=$HOME/.npm-global/bin/pi-mom --sandbox=docker:$SANDBOX_NAME $WORKSPACE
Restart=on-failure
RestartSec=10
StandardOutput=append:$HOME/.pi-mom.log
StandardError=append:$HOME/.pi-mom.log

[Install]
WantedBy=default.target
EOF

echo "✓ Service systemd écrit"

systemctl --user daemon-reload
systemctl --user stop pi-mom.service 2>/dev/null || true
systemctl --user enable pi-mom.service --quiet
systemctl --user start pi-mom.service

echo "⏳ Démarrage du service (5s)..."
sleep 5

# ─────────────────────────────────────────────────────────
# 14. Vérification
# ─────────────────────────────────────────────────────────

if systemctl --user is-active pi-mom.service >/dev/null 2>&1; then
  echo "✓ Service pi-mom actif"
else
  echo "✗ Le service pi-mom ne démarre pas. Logs :"
  echo "─────────────────────────────────────────────────────"
  tail -20 "$HOME/.pi-mom.log" 2>/dev/null
  echo "─────────────────────────────────────────────────────"
  echo
  echo "  💡 Si l'erreur est 'Container does not exist' ou 'permission denied' :"
  echo "     Le daemon systemd n'a pas vu le groupe docker."
  echo "     Forcer le rechargement :"
  echo "       loginctl terminate-user \$USER"
  echo "     Puis SSH à nouveau et : systemctl --user start pi-mom"
  exit 1
fi

# ─────────────────────────────────────────────────────────
# 15. Message final
# ─────────────────────────────────────────────────────────

echo
echo "┌─────────────────────────────────────────────────────┐"
echo "│  🎉 $AGENT_NAME est en ligne !                      "
echo "└─────────────────────────────────────────────────────┘"
echo
echo "  📌 Maintenant : ouvrez Slack."
echo
echo "     Dans le canal #agent (ou DM) :"
echo
echo "       @$AGENT_NAME Bonjour ! Qui es-tu ?"
echo
echo "─────────────────────────────────────────────────────"
echo "  Commandes utiles :"
echo
echo "    Logs         : tail -f ~/.pi-mom.log"
echo "    Status       : systemctl --user status pi-mom"
echo "    Restart      : systemctl --user restart pi-mom"
echo "    (après modif de SYSTEM.md)"
echo
echo "─────────────────────────────────────────────────────"
