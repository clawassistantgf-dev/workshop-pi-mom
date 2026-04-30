#!/bin/bash
#
# 03-configure.sh — Configuration finale et démarrage de l'agent
# Workshop : Les Fadas de l'IA
#
# Lancement (depuis le user créé en script 1, après /login dans pi) :
#   bash <(curl -s https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/03-configure.sh)
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

if ! command -v pi >/dev/null 2>&1; then
  echo "⛔ pi n'est pas installé. Avez-vous bien lancé le script 2 ?"
  exit 1
fi

WORKSPACE="$HOME/agent-workspace"
if [ ! -d "$WORKSPACE" ]; then
  echo "⛔ ~/agent-workspace n'existe pas. Avez-vous bien lancé le script 2 ?"
  exit 1
fi

# Test que pi a bien été loggé
if [ ! -d "$HOME/.pi" ]; then
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
echo "  4 questions, et votre agent est en ligne."
echo "─────────────────────────────────────────────────────"
echo

# ─────────────────────────────────────────────────────────
# 1. Token Slack APP (xapp-...)
# ─────────────────────────────────────────────────────────

echo "🔑 Token Slack APP (commence par xapp-)"
echo "   api.slack.com/apps → votre app → Basic Information → App-Level Tokens"
while true; do
  read -s -p "   ➡️  " MOM_SLACK_APP_TOKEN
  echo
  if [[ "$MOM_SLACK_APP_TOKEN" =~ ^xapp- ]]; then
    break
  fi
  echo "   ⛔ Le token doit commencer par xapp-"
done

echo

# ─────────────────────────────────────────────────────────
# 2. Token Slack BOT (xoxb-...)
# ─────────────────────────────────────────────────────────

echo "🔑 Token Slack BOT (commence par xoxb-)"
echo "   api.slack.com/apps → votre app → OAuth & Permissions → Bot User OAuth Token"
while true; do
  read -s -p "   ➡️  " MOM_SLACK_BOT_TOKEN
  echo
  if [[ "$MOM_SLACK_BOT_TOKEN" =~ ^xoxb- ]]; then
    break
  fi
  echo "   ⛔ Le token doit commencer par xoxb-"
done

echo

# ─────────────────────────────────────────────────────────
# 3. Surnom de l'agent
# ─────────────────────────────────────────────────────────

echo "🦞 Prénom ou surnom de votre agent"
echo "   Ex: Léo, Jacqueline, Mistral, Tonton..."
read -p "   ➡️  " AGENT_NAME
while [ -z "$AGENT_NAME" ]; do
  echo "   ⛔ Le nom ne peut pas être vide."
  read -p "   ➡️  " AGENT_NAME
done

echo

# ─────────────────────────────────────────────────────────
# 4. URL du repo GitHub privé pour les backups
# ─────────────────────────────────────────────────────────

echo "💾 URL HTTPS de votre repo GitHub privé (pour les backups)"
echo "   Ex: https://github.com/votre-user/mon-agent.git"
echo "   (laissez vide pour configurer plus tard)"
read -p "   ➡️  " GITHUB_REPO_URL

echo

# ─────────────────────────────────────────────────────────
# 5. Écriture du fichier .keys
# ─────────────────────────────────────────────────────────

echo "⏳ Écriture de $WORKSPACE/.keys ..."

cat > "$WORKSPACE/.keys" <<EOF
# Tokens Slack — généré par 03-configure.sh
# NE JAMAIS COMMITTER CE FICHIER
MOM_SLACK_APP_TOKEN=$MOM_SLACK_APP_TOKEN
MOM_SLACK_BOT_TOKEN=$MOM_SLACK_BOT_TOKEN
EOF

chmod 600 "$WORKSPACE/.keys"
echo "✓ .keys créé (permissions 600)"

# ─────────────────────────────────────────────────────────
# 6. SYSTEM.md initial
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
- Tu sauvegardes ton travail sur le repo GitHub privé : ${GITHUB_REPO_URL:-(non configuré)}

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
# 7. .gitignore (si pas déjà créé par script 2)
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
EOF
else
  # S'assurer que .keys est bien dans le .gitignore (au cas où le script 2 ne l'avait pas mis)
  if ! grep -q '^\.keys$' "$WORKSPACE/.gitignore"; then
    echo ".keys" >> "$WORKSPACE/.gitignore"
  fi
fi
echo "✓ .gitignore vérifié (.keys exclu)"

# ─────────────────────────────────────────────────────────
# 8. Git init + commit initial
# ─────────────────────────────────────────────────────────

cd "$WORKSPACE"

if [ ! -d ".git" ]; then
  echo "⏳ Initialisation du repo git..."
  git init -q

  # Configuration locale uniquement (pas globale)
  git config user.email "$USER@$(hostname)"
  git config user.name "$AGENT_NAME"

  git add SYSTEM.md .gitignore
  git commit -q -m "Initial commit: $AGENT_NAME is born"
  echo "✓ Repo git initialisé"
else
  echo "✓ Repo git déjà initialisé"
fi

# Configuration du remote si fourni et pas déjà configuré
if [ -n "$GITHUB_REPO_URL" ]; then
  if git remote get-url origin >/dev/null 2>&1; then
    echo "✓ Remote git déjà configuré"
  else
    git remote add origin "$GITHUB_REPO_URL"
    echo "✓ Remote git ajouté : $GITHUB_REPO_URL"
    echo "  💡 Pour pousser plus tard : cd ~/agent-workspace && git push -u origin main"
    echo "     (vous devrez configurer un Personal Access Token GitHub)"
  fi
fi

# ─────────────────────────────────────────────────────────
# 9. Service systemd user
# ─────────────────────────────────────────────────────────

SERVICE_DIR="$HOME/.config/systemd/user"
SERVICE_FILE="$SERVICE_DIR/pi-mom.service"
SANDBOX_NAME="fadas-$USER"

mkdir -p "$SERVICE_DIR"

cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=pi-mom Slack agent — version Les Fadas ($AGENT_NAME)
After=docker.service network-online.target
Wants=network-online.target

[Service]
Type=simple
WorkingDirectory=$WORKSPACE
ExecStart=$HOME/.npm-global/bin/pi-mom --sandbox=docker:$SANDBOX_NAME $WORKSPACE
Restart=on-failure
RestartSec=10
StandardOutput=append:$HOME/.pi-mom.log
StandardError=append:$HOME/.pi-mom.log

[Install]
WantedBy=default.target
EOF

echo "✓ Service systemd écrit : $SERVICE_FILE"

systemctl --user daemon-reload

# Stop le service s'il tournait déjà (idempotence)
systemctl --user stop pi-mom.service 2>/dev/null || true

# Enable + start
systemctl --user enable pi-mom.service --quiet
systemctl --user start pi-mom.service

echo "⏳ Démarrage du service (5s)..."
sleep 5

# ─────────────────────────────────────────────────────────
# 10. Vérification que le service tourne
# ─────────────────────────────────────────────────────────

if systemctl --user is-active pi-mom.service >/dev/null 2>&1; then
  echo "✓ Service pi-mom actif"
else
  echo "✗ Le service pi-mom ne semble pas actif. Logs :"
  echo "─────────────────────────────────────────────────────"
  tail -20 "$HOME/.pi-mom.log" 2>/dev/null || journalctl --user -u pi-mom.service --no-pager -n 20
  echo "─────────────────────────────────────────────────────"
  echo
  echo "  Diagnostic :"
  echo "    journalctl --user -u pi-mom.service -f"
  echo "    tail -f ~/.pi-mom.log"
  exit 1
fi

# ─────────────────────────────────────────────────────────
# 11. Message final
# ─────────────────────────────────────────────────────────

echo
echo "┌─────────────────────────────────────────────────────┐"
echo "│  🎉 $AGENT_NAME est en ligne !                      "
echo "└─────────────────────────────────────────────────────┘"
echo
echo "  📌 Maintenant : ouvrez Slack."
echo
echo "  Dans le canal #agent (ou DM) :"
echo
echo "       @$AGENT_NAME Bonjour ! Qui es-tu ?"
echo
echo "─────────────────────────────────────────────────────"
echo "  Commandes utiles :"
echo
echo "    Voir les logs :"
echo "      tail -f ~/.pi-mom.log"
echo
echo "    Status du service :"
echo "      systemctl --user status pi-mom"
echo
echo "    Redémarrer après modif de SYSTEM.md :"
echo "      systemctl --user restart pi-mom"
echo
echo "─────────────────────────────────────────────────────"
