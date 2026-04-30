#!/bin/bash
#
# 02-install.sh — Installation de la stack agent
# Workshop : Les Fadas de l'IA
#

set -e

# ─────────────────────────────────────────────────────────
# 0. Vérifications préalables
# ─────────────────────────────────────────────────────────

if [ "$EUID" -eq 0 ]; then
  echo "⛔ Ce script ne doit PAS être lancé en root."
  exit 1
fi

if ! sudo -n apt-get --version >/dev/null 2>&1; then
  echo "⛔ L'utilisateur n'a pas les droits sudo nécessaires."
  exit 1
fi

clear
echo "┌───────────────────────────────────────────────────┐"
echo "│  📦  Installation de la stack agent                │"
echo "└───────────────────────────────────────────────────┘"
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
# 1. Mise à jour
# ─────────────────────────────────────────────────────────

echo "⏳ Mise à jour des paquets..."
sudo apt-get update -qq

# ─────────────────────────────────────────────────────────
# 2. Node.js 20 LTS
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
# 3. npm en mode user (sans sudo)
# ─────────────────────────────────────────────────────────

NPM_PREFIX="$HOME/.npm-global"
if [ ! -d "$NPM_PREFIX" ]; then
  mkdir -p "$NPM_PREFIX"
  npm config set prefix "$NPM_PREFIX"
fi

if ! echo "$PATH" | grep -q "$NPM_PREFIX/bin"; then
  export PATH="$NPM_PREFIX/bin:$PATH"
fi
if ! grep -q "npm-global/bin" "$HOME/.bashrc" 2>/dev/null; then
  echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> "$HOME/.bashrc"
fi

# ─────────────────────────────────────────────────────────
# 4. Docker
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

if ! groups "$USER" | grep -q '\bdocker\b'; then
  echo "⏳ Ajout de $USER au groupe docker..."
  sudo usermod -aG docker "$USER"
  DOCKER_GROUP_NEW=1
else
  DOCKER_GROUP_NEW=0
fi

# ─────────────────────────────────────────────────────────
# 5. Lingering systemd user
# ─────────────────────────────────────────────────────────

if ! loginctl show-user "$USER" 2>/dev/null | grep -q "Linger=yes"; then
  echo "⏳ Activation du lingering systemd..."
  sudo loginctl enable-linger "$USER"
  echo "✓ Lingering activé"
else
  echo "✓ Lingering déjà actif"
fi

# ─────────────────────────────────────────────────────────
# 6. pi-coding-agent (officiel)
# ─────────────────────────────────────────────────────────

echo "⏳ Installation de pi (agent CLI officiel)..."
npm install -g @mariozechner/pi-coding-agent --silent

# ─────────────────────────────────────────────────────────
# 7. Build local de pi-mom version Les Fadas (npm + workspaces)
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

# Le repo utilise npm workspaces (package-lock.json présent à la racine)
echo "⏳ Installation des dépendances du monorepo (npm install)..."
npm install --no-fund --no-audit 2>&1 | tail -5

# Localiser le package pi-mom (Mario l'appelle "mom")
PI_MOM_DIR=""
for candidate in \
  "$PI_MONO_DIR/packages/mom" \
  "$PI_MONO_DIR/packages/pi-mom" \
  "$PI_MONO_DIR/apps/mom" \
  "$PI_MONO_DIR/apps/pi-mom"
do
  if [ -f "$candidate/package.json" ]; then
    PI_MOM_DIR="$candidate"
    break
  fi
done

if [ -z "$PI_MOM_DIR" ]; then
  echo "⛔ Impossible de trouver le package pi-mom dans $PI_MONO_DIR"
  find "$PI_MONO_DIR" -name "package.json" -not -path "*/node_modules/*" | head -10
  exit 1
fi

echo "✓ pi-mom localisé : $PI_MOM_DIR"

# Build le monorepo complet à la racine (ordre topologique requis)
echo "⏳ Build du monorepo (~2-3 min)..."
cd "$PI_MONO_DIR"
npm run build 2>&1 | tail -10

# Install global du package pi-mom buildé
cd "$PI_MOM_DIR"
echo "⏳ Install global de pi-mom..."
npm install -g . --silent

cd "$HOME"

# ─────────────────────────────────────────────────────────
# 8. Workspace agent + .gitignore
# ─────────────────────────────────────────────────────────

mkdir -p "$WORKSPACE"

cat > "$WORKSPACE/.gitignore" <<'EOF'
.env
.env.*
*.key
*.pem
node_modules/
.npm/
.cache/
*.log
.pi/
sessions/
EOF

echo "✓ Workspace créé : $WORKSPACE"

# ─────────────────────────────────────────────────────────
# 9. Validation finale
# ─────────────────────────────────────────────────────────

echo
echo "─────────────────────────────────────────────────────"
echo "  🔬 Vérifications finales"
echo "─────────────────────────────────────────────────────"
echo

ALL_OK=1

if NODE_VERSION=$(node --version 2>/dev/null); then
  echo "  ✓ Node.js     $NODE_VERSION"
else
  echo "  ✗ Node.js     ÉCHEC"
  ALL_OK=0
fi

if DOCKER_VERSION=$(docker --version 2>/dev/null); then
  echo "  ✓ Docker      $DOCKER_VERSION"
else
  echo "  ✗ Docker      ÉCHEC"
  ALL_OK=0
fi

echo "  ⏳ Docker run hello-world..."
if [ "$DOCKER_GROUP_NEW" -eq 1 ]; then
  if sudo docker run --rm hello-world >/dev/null 2>&1; then
    echo "  ✓ Docker run  OK (via sudo, groupe actif au prochain login)"
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

if command -v pi >/dev/null 2>&1; then
  echo "  ✓ pi          installé ($(which pi))"
else
  echo "  ✗ pi          ÉCHEC"
  ALL_OK=0
fi

# Le binaire peut s'appeler "pi-mom" (si fork renommé) OU "mom" (officiel Mario)
if command -v pi-mom >/dev/null 2>&1; then
  echo "  ✓ pi-mom      installé ($(which pi-mom)) — version Les Fadas"
elif command -v mom >/dev/null 2>&1; then
  echo "  ✓ mom         installé ($(which mom)) — Pour avoir 'pi-mom' :"
  echo "                renommer le bin dans packages/mom/package.json du fork"
else
  echo "  ✗ pi-mom/mom  ÉCHEC (binaire introuvable)"
  ALL_OK=0
fi

if [ -d "$PI_MONO_DIR" ]; then
  echo "  ✓ Sources     $PI_MONO_DIR"
fi

if [ -d "$WORKSPACE" ] && [ -f "$WORKSPACE/.gitignore" ]; then
  echo "  ✓ Workspace   $WORKSPACE"
else
  echo "  ✗ Workspace   ÉCHEC"
  ALL_OK=0
fi

echo

if [ "$ALL_OK" -ne 1 ]; then
  echo "⛔ Une vérification a échoué. Le script est idempotent, vous pouvez le relancer."
  exit 1
fi

# ─────────────────────────────────────────────────────────
# 10. Message final
# ─────────────────────────────────────────────────────────

echo "┌─────────────────────────────────────────────────────┐"
echo "│  ✅ Stack installée !                               │"
echo "└─────────────────────────────────────────────────────┘"
echo

if [ "$DOCKER_GROUP_NEW" -eq 1 ]; then
  echo "  ⚠️  Reconnectez-vous (ou tapez : newgrp docker)"
  echo "      pour activer le groupe docker sans sudo."
  echo
fi

echo "  📌 ÉTAPE SUIVANTE — Connecter votre LLM"
echo
echo "     pi"
echo "     /login"
echo
echo "─────────────────────────────────────────────────────"
echo "  Sources de pi-mom : $PI_MONO_DIR"
echo "─────────────────────────────────────────────────────"
