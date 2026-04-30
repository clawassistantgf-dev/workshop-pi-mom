#!/bin/bash
#
# 02-install.sh — Installation de la stack agent
# Workshop : Les Fadas de l'IA
#
# Lancement (depuis le user créé en script 1, PAS root) :
#   bash <(curl -s https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/02-install.sh)
#

set -e

# ─────────────────────────────────────────────────────────
# 0. Vérifications préalables
# ─────────────────────────────────────────────────────────

if [ "$EUID" -eq 0 ]; then
  echo "⛔ Ce script ne doit PAS être lancé en root."
  echo "   Reconnectez-vous avec votre utilisateur agent puis relancez."
  exit 1
fi

if ! sudo -n true 2>/dev/null; then
  echo "⛔ L'utilisateur n'a pas les droits sudo nécessaires."
  echo "   Vérifiez que le script 1 s'est bien terminé."
  exit 1
fi

clear
echo "┌───────────────────────────────────────────────────┐"
echo "│  📦  Installation de la stack agent                │"
echo "└───────────────────────────────────────────────────┘"
echo
echo "  Cette étape installe :"
echo "    • Node.js 20 LTS + pnpm"
echo "    • Docker (pour l'isolation des commandes de l'agent)"
echo "    • pi (l'agent CLI)"
echo "    • pi-mom version Les Fadas (build local depuis fork)"
echo
echo "  Durée estimée : 8-14 minutes"
echo "─────────────────────────────────────────────────────"
echo

# ─────────────────────────────────────────────────────────
# Configuration
# ─────────────────────────────────────────────────────────

PI_MONO_FORK_URL="https://github.com/clawassistantgf-dev/pi-mono.git"
PI_MONO_BRANCH="main"
WORKSPACE="$HOME/agent-workspace"
PI_MONO_DIR="$HOME/pi-mono-fadas"

# ─────────────────────────────────────────────────────────
# 1. Mise à jour rapide
# ─────────────────────────────────────────────────────────

echo "⏳ Mise à jour des paquets..."
sudo apt-get update -qq

# ─────────────────────────────────────────────────────────
# 2. Node.js 20 LTS via NodeSource
#    Idempotent : skip si Node 20+ déjà présent
# ─────────────────────────────────────────────────────────

NODE_OK=0
if command -v node >/dev/null 2>&1; then
  NODE_MAJOR=$(node -p "process.versions.node.split('.')[0]" 2>/dev/null || echo 0)
  if [ "$NODE_MAJOR" -ge 20 ]; then
    NODE_OK=1
    echo "✓ Node.js déjà installé : $(node --version)"
  fi
fi

if [ "$NODE_OK" -eq 0 ]; then
  echo "⏳ Installation de Node.js 20 LTS..."
  curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - >/dev/null 2>&1
  sudo apt-get install -y -qq nodejs
  echo "✓ Node.js installé : $(node --version)"
fi

# ─────────────────────────────────────────────────────────
# 3. Configuration npm en mode user (sans sudo)
# ─────────────────────────────────────────────────────────

NPM_PREFIX="$HOME/.npm-global"
if [ ! -d "$NPM_PREFIX" ]; then
  mkdir -p "$NPM_PREFIX"
  npm config set prefix "$NPM_PREFIX"
fi

# S'assurer que ~/.npm-global/bin est dans le PATH (cette session ET les suivantes)
if ! echo "$PATH" | grep -q "$NPM_PREFIX/bin"; then
  export PATH="$NPM_PREFIX/bin:$PATH"
fi
if ! grep -q "npm-global/bin" "$HOME/.bashrc" 2>/dev/null; then
  echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> "$HOME/.bashrc"
fi

# ─────────────────────────────────────────────────────────
# 4. pnpm (nécessaire pour le monorepo pi-mono)
# ─────────────────────────────────────────────────────────

if command -v pnpm >/dev/null 2>&1; then
  echo "✓ pnpm déjà installé : $(pnpm --version)"
else
  echo "⏳ Installation de pnpm..."
  npm install -g pnpm --silent
  echo "✓ pnpm installé : $(pnpm --version)"
fi

# ─────────────────────────────────────────────────────────
# 5. Docker
#    Idempotent : skip si Docker déjà présent
# ─────────────────────────────────────────────────────────

if command -v docker >/dev/null 2>&1; then
  echo "✓ Docker déjà installé : $(docker --version)"
else
  echo "⏳ Installation de Docker (peut prendre 1-2 min)..."
  curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
  sudo sh /tmp/get-docker.sh >/dev/null 2>&1
  rm -f /tmp/get-docker.sh
  echo "✓ Docker installé : $(docker --version)"
fi

# Ajout du user au groupe docker (idempotent : -aG ne duplique pas)
if ! groups "$USER" | grep -q '\bdocker\b'; then
  echo "⏳ Ajout de $USER au groupe docker..."
  sudo usermod -aG docker "$USER"
  DOCKER_GROUP_NEW=1
else
  DOCKER_GROUP_NEW=0
fi

# ─────────────────────────────────────────────────────────
# 6. Lingering systemd user (pour que l'agent tourne 24/7)
# ─────────────────────────────────────────────────────────

if ! loginctl show-user "$USER" 2>/dev/null | grep -q "Linger=yes"; then
  echo "⏳ Activation du lingering systemd..."
  sudo loginctl enable-linger "$USER"
  echo "✓ Lingering activé (l'agent survivra à votre déconnexion SSH)"
else
  echo "✓ Lingering déjà actif"
fi

# ─────────────────────────────────────────────────────────
# 7. Installation pi-coding-agent (officiel, npm)
# ─────────────────────────────────────────────────────────

echo "⏳ Installation de pi (agent CLI officiel)..."
npm install -g @mariozechner/pi-coding-agent --silent

# ─────────────────────────────────────────────────────────
# 8. Build local de pi-mom version Les Fadas
#    Clone du fork → pnpm install → build pi-mom → install global
# ─────────────────────────────────────────────────────────

echo
echo "─────────────────────────────────────────────────────"
echo "  🦞 Build de pi-mom version Les Fadas (~5 min)"
echo "─────────────────────────────────────────────────────"
echo

# Clone ou pull si déjà présent (idempotent)
if [ -d "$PI_MONO_DIR/.git" ]; then
  echo "⏳ Mise à jour du fork existant..."
  cd "$PI_MONO_DIR"
  git fetch origin "$PI_MONO_BRANCH" --quiet
  git reset --hard "origin/$PI_MONO_BRANCH" --quiet
else
  echo "⏳ Clone du fork pi-mono..."
  rm -rf "$PI_MONO_DIR"
  git clone --depth 1 --branch "$PI_MONO_BRANCH" "$PI_MONO_FORK_URL" "$PI_MONO_DIR" --quiet
fi

cd "$PI_MONO_DIR"

# Installation des dépendances du monorepo
echo "⏳ Installation des dépendances du monorepo (pnpm install)..."
pnpm install --frozen-lockfile 2>&1 | tail -5 || pnpm install 2>&1 | tail -5

# Localiser le package pi-mom
PI_MOM_DIR=""
for candidate in "$PI_MONO_DIR/packages/pi-mom" "$PI_MONO_DIR/apps/pi-mom" "$PI_MONO_DIR/pi-mom"; do
  if [ -f "$candidate/package.json" ]; then
    PI_MOM_DIR="$candidate"
    break
  fi
done

if [ -z "$PI_MOM_DIR" ]; then
  echo "⛔ Impossible de trouver le package pi-mom dans $PI_MONO_DIR"
  echo "   Structure du repo :"
  find "$PI_MONO_DIR" -name "package.json" -not -path "*/node_modules/*" | head -10
  exit 1
fi

echo "✓ pi-mom localisé : $PI_MOM_DIR"

# Build du package pi-mom (TypeScript → JS si applicable)
cd "$PI_MOM_DIR"
if grep -q '"build"' package.json; then
  echo "⏳ Build du package pi-mom..."
  pnpm build 2>&1 | tail -3 || npm run build 2>&1 | tail -3
fi

# Install global du package buildé
echo "⏳ Install global de pi-mom version Les Fadas..."
npm install -g . --silent

cd "$HOME"

# ─────────────────────────────────────────────────────────
# 9. Création du workspace agent + .gitignore initial
# ─────────────────────────────────────────────────────────

mkdir -p "$WORKSPACE"

# .gitignore défensif dès maintenant
cat > "$WORKSPACE/.gitignore" <<'EOF'
# Secrets — JAMAIS sur GitHub
.env
.env.*
*.key
*.pem

# Caches et runtime
node_modules/
.npm/
.cache/
*.log

# Données locales de l'agent
.pi/
sessions/
EOF

echo "✓ Workspace créé : $WORKSPACE"

# ─────────────────────────────────────────────────────────
# 10. Validation finale
# ─────────────────────────────────────────────────────────

echo
echo "─────────────────────────────────────────────────────"
echo "  🔬 Vérifications finales"
echo "─────────────────────────────────────────────────────"
echo

ALL_OK=1

# Node
if NODE_VERSION=$(node --version 2>/dev/null); then
  echo "  ✓ Node.js     $NODE_VERSION"
else
  echo "  ✗ Node.js     ÉCHEC"
  ALL_OK=0
fi

# pnpm
if PNPM_VERSION=$(pnpm --version 2>/dev/null); then
  echo "  ✓ pnpm        $PNPM_VERSION"
else
  echo "  ✗ pnpm        ÉCHEC"
  ALL_OK=0
fi

# Docker binary
if DOCKER_VERSION=$(docker --version 2>/dev/null); then
  echo "  ✓ Docker      $DOCKER_VERSION"
else
  echo "  ✗ Docker      ÉCHEC"
  ALL_OK=0
fi

# Docker run hello-world
echo "  ⏳ Docker run hello-world (preuve que Docker tourne)..."
if [ "$DOCKER_GROUP_NEW" -eq 1 ]; then
  if sudo docker run --rm hello-world >/dev/null 2>&1; then
    echo "  ✓ Docker run  OK (via sudo, le groupe sera actif au prochain login)"
  else
    echo "  ✗ Docker run  ÉCHEC"
    ALL_OK=0
  fi
else
  if docker run --rm hello-world >/dev/null 2>&1; then
    echo "  ✓ Docker run  OK"
  else
    echo "  ✗ Docker run  ÉCHEC"
    ALL_OK=0
  fi
fi

# pi
if command -v pi >/dev/null 2>&1; then
  echo "  ✓ pi          installé ($(which pi))"
else
  echo "  ✗ pi          ÉCHEC (binaire introuvable dans PATH)"
  ALL_OK=0
fi

# pi-mom (version custom)
if command -v pi-mom >/dev/null 2>&1; then
  echo "  ✓ pi-mom      installé ($(which pi-mom)) — version Les Fadas"
else
  echo "  ✗ pi-mom      ÉCHEC (binaire introuvable dans PATH)"
  ALL_OK=0
fi

# Sources pi-mom encore présentes (pour debug et bidouille)
if [ -d "$PI_MONO_DIR" ]; then
  echo "  ✓ Sources     $PI_MONO_DIR (lisibles si vous voulez bidouiller)"
fi

# Workspace
if [ -d "$WORKSPACE" ] && [ -f "$WORKSPACE/.gitignore" ]; then
  echo "  ✓ Workspace   $WORKSPACE"
else
  echo "  ✗ Workspace   ÉCHEC"
  ALL_OK=0
fi

echo

if [ "$ALL_OK" -ne 1 ]; then
  echo "⛔ Une vérification a échoué. Relisez les messages ci-dessus."
  echo "   Vous pouvez relancer ce script — il est idempotent."
  exit 1
fi

# ─────────────────────────────────────────────────────────
# 11. Message final
# ─────────────────────────────────────────────────────────

echo "┌─────────────────────────────────────────────────────┐"
echo "│  ✅ Stack installée !                               │"
echo "└─────────────────────────────────────────────────────┘"
echo

if [ "$DOCKER_GROUP_NEW" -eq 1 ]; then
  echo "  ⚠️  Important : vous avez été ajouté au groupe docker."
  echo "      Pour que ce soit actif sans sudo, déconnectez-vous"
  echo "      puis reconnectez-vous, OU tapez :  newgrp docker"
  echo
fi

echo "  📌 ÉTAPE SUIVANTE — Connecter votre LLM"
echo
echo "  1. Lancez l'agent :"
echo
echo "       pi"
echo
echo "  2. Dans l'interface pi, tapez :"
echo
echo "       /login"
echo
echo "  3. Suivez l'URL affichée pour vous connecter via votre"
echo "     abonnement (GPT Plus / Gemini / Copilot)."
echo
echo "  4. Une fois loggé, faites Ctrl+C pour quitter pi,"
echo "     puis lancez le script 3."
echo
echo "─────────────────────────────────────────────────────"
echo "  💡 Les sources de pi-mom sont dans $PI_MONO_DIR"
echo "     Vous pouvez y faire un git pull plus tard pour"
echo "     récupérer mes mises à jour."
echo "─────────────────────────────────────────────────────"
