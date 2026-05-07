#!/bin/bash
#
# 01-secure.sh — Sécurisation initiale du serveur
# Workshop : Les Fadas de l'IA
#
# Lancer sur le VPS (session root). Copier UNE ligne :
# curl -fsSL https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/01-secure.sh -o "$HOME/ws-pi-mom-01-secure.sh" && bash "$HOME/ws-pi-mom-01-secure.sh"
# Si curl (23) : même URL mais -o /root/ws-pi-mom-01-secure.sh puis bash ce fichier. Préférer $HOME à /tmp si erreur d’écriture.
#

set -e
set -o pipefail

# Vérifie si le script est exécuté en tant que root
if [ "$EUID" -ne 0 ]; then
  echo "⛔ Ce script doit être exécuté en tant que root."
  echo
  echo "Connectez-vous en root sur le VPS, puis copier-coller UNE ligne :"
  echo "curl -fsSL https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/01-secure.sh -o \"\$HOME/ws-pi-mom-01-secure.sh\" && bash \"\$HOME/ws-pi-mom-01-secure.sh\""
  echo
  echo "Si le script est déjà sur le disque : sudo bash /chemin/vers/ws-pi-mom-01-secure.sh"
  echo
  exit 1
fi

clear
echo "┌───────────────────────────────────────────────────┐"
echo "│  ⚙️  Configuration initiale de votre serveur       │"
echo "└───────────────────────────────────────────────────┘"
echo

# ─────────────────────────────────────────────────────────
# 1. Choix du nom d'utilisateur
# ─────────────────────────────────────────────────────────

read -p "Quel est le nom de votre agent ? (minuscules, sans espace ni accents) : " username
while [[ ! "$username" =~ ^[a-z_][a-z0-9_-]{0,30}[a-z0-9]$ ]]; do
  echo "⛔ Nom invalide. Lettres minuscules, chiffres, tirets uniquement (2-32 caractères)."
  read -p "Quel est le nom de votre agent ? : " username
done

# ─────────────────────────────────────────────────────────
# 2. Mot de passe
# ─────────────────────────────────────────────────────────

while true; do
  read -s -p "Choisissez un mot de passe solide : " password
  echo
  read -s -p "Confirmez le mot de passe : " password_confirm
  echo
  if [ "$password" == "$password_confirm" ] && [ ${#password} -ge 8 ]; then
    break
  fi
  if [ ${#password} -lt 8 ]; then
    echo "⛔ Mot de passe trop court (minimum 8 caractères)."
  else
    echo "⛔ Les mots de passe ne correspondent pas."
  fi
done

# ─────────────────────────────────────────────────────────
# 3. Création de l'utilisateur
# ─────────────────────────────────────────────────────────

echo "⏳ Création de l'utilisateur $username..."
useradd -m -s /bin/bash "$username"
echo "$username:$password" | chpasswd
usermod -aG sudo "$username"

# ─────────────────────────────────────────────────────────
# 4. Mise à jour du système
# ─────────────────────────────────────────────────────────

echo "⏳ Mise à jour du système..."
apt-get update -qq
DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -qq
apt-get install -y -qq ufw sudo curl git cron ca-certificates gnupg

# ─────────────────────────────────────────────────────────
# 5. Règle sudoers élargie pour le script 2
#    On autorise sans mdp les commandes nécessaires à
#    l'installation Node + Docker (optionnel, script 2) + lingering systemd.
# ─────────────────────────────────────────────────────────

cat > /etc/sudoers.d/90-fadas-agent <<EOF
$username ALL=(ALL:ALL) NOPASSWD: /usr/bin/apt-get, /usr/bin/apt, /bin/sh /tmp/get-docker.sh, /usr/sbin/usermod -aG docker $username, /usr/bin/loginctl enable-linger $username, /bin/mkdir, /usr/bin/tee
EOF
chmod 440 /etc/sudoers.d/90-fadas-agent

# Validation syntaxique du fichier sudoers
visudo -c -f /etc/sudoers.d/90-fadas-agent > /dev/null

# ─────────────────────────────────────────────────────────
# 6. Clé SSH publique
# ─────────────────────────────────────────────────────────

echo
echo "┌─────────────────────────────────────────────────────┐"
echo "│  🔑 Génération + collage de votre clé SSH           │"
echo "└─────────────────────────────────────────────────────┘"
echo
echo "Sur VOTRE PC (nouveau terminal local), pas sur le serveur."
echo
echo "🍎 Mac — copier UNE ligne :"
echo "ssh-keygen -t ed25519 -f ~/.ssh/$username -N \"\" && cat ~/.ssh/$username.pub | pbcopy && echo OK"
echo
echo "🐧 Linux — copier UNE ligne (xclip : sudo apt install xclip si besoin) :"
echo "ssh-keygen -t ed25519 -f ~/.ssh/$username -N \"\" && cat ~/.ssh/$username.pub | xclip -selection clipboard && echo OK"
echo
echo "🪟 Windows PowerShell — copier UNE ligne :"
echo "ssh-keygen -t ed25519 -f \"\$env:USERPROFILE\\.ssh\\$username\" -N ''; Get-Content \"\$env:USERPROFILE\\.ssh\\$username.pub\" | Set-Clipboard"
echo
echo "Puis revenir sur cette session root : clic droit → Coller la clé → Entrée"
echo

while true; do
  read -r -p "➡️  Collez votre clé publique : " ssh_key
  if [[ "$ssh_key" =~ ^(ssh-rsa|ssh-ed25519|ecdsa-sha2-)[[:space:]]+[A-Za-z0-9+/=]+ ]]; then
    break
  fi
  echo "⛔ Format invalide. La clé doit commencer par ssh-ed25519, ssh-rsa ou ecdsa-..."
  echo "   (Vérifiez que vous avez collé la clé .pub, pas la privée)"
done

mkdir -p /home/$username/.ssh
chmod 700 /home/$username/.ssh
echo "$ssh_key" > /home/$username/.ssh/authorized_keys
chmod 600 /home/$username/.ssh/authorized_keys
chown -R "$username:$username" /home/$username/.ssh

# ─────────────────────────────────────────────────────────
# 7. Sécurisation SSH (root off, password off)
# ─────────────────────────────────────────────────────────

echo "⏳ Verrouillage de SSH (root désactivé, mot de passe désactivé)..."

# Configuration principale
sed -i '/^#*PermitRootLogin/d' /etc/ssh/sshd_config
sed -i '/^#*PasswordAuthentication/d' /etc/ssh/sshd_config
sed -i '/^#*PubkeyAuthentication/d' /etc/ssh/sshd_config
{
  echo "PermitRootLogin no"
  echo "PasswordAuthentication no"
  echo "PubkeyAuthentication yes"
} >> /etc/ssh/sshd_config

# Override des fichiers .conf qui pourraient ré-activer le password
if ls /etc/ssh/sshd_config.d/*.conf >/dev/null 2>&1; then
  sed -i 's/^PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config.d/*.conf 2>/dev/null || true
fi

# Validation que la config est correcte AVANT redémarrage
if ! sshd -t; then
  echo "⛔ Configuration SSH invalide. Abandon avant redémarrage."
  exit 1
fi

systemctl restart ssh || systemctl restart sshd

# Validation post-redémarrage : les directives effectives sont bien appliquées
if ! sshd -T 2>/dev/null | grep -q "^permitrootlogin no"; then
  echo "⛔ PermitRootLogin n'a pas été désactivé. Vérifiez /etc/ssh/sshd_config."
  exit 1
fi
if ! sshd -T 2>/dev/null | grep -q "^passwordauthentication no"; then
  echo "⛔ PasswordAuthentication n'a pas été désactivé. Vérifiez /etc/ssh/sshd_config."
  exit 1
fi

# ─────────────────────────────────────────────────────────
# 8. Pare-feu UFW
# ─────────────────────────────────────────────────────────

echo "⏳ Configuration du pare-feu..."
ufw allow 22/tcp >/dev/null
ufw allow 80/tcp >/dev/null
ufw allow 443/tcp >/dev/null
ufw --force enable >/dev/null

# ─────────────────────────────────────────────────────────
# 9. Message final
# ─────────────────────────────────────────────────────────

SERVER_IP=$(hostname -I | awk '{print $1}')

clear
echo "┌─────────────────────────────────────────────────────┐"
echo "│  ✅ Serveur sécurisé !                              │"
echo "└─────────────────────────────────────────────────────┘"
echo
echo "  Utilisateur : $username"
echo "  IP serveur  : $SERVER_IP"
echo "  root        : désactivé"
echo "  password SSH: désactivé (clé uniquement)"
echo "  pare-feu    : actif (22, 80, 443)"
echo
echo "─────────────────────────────────────────────────────"
echo
echo "📌 ÉTAPE SUIVANTE — nouveau terminal sur votre PC, puis UNE ligne :"
echo "ssh -i ~/.ssh/$username $username@$SERVER_IP"
echo
echo "Une fois connecté en $username, script 2 (UNE ligne) :"
echo "curl -fsSL https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/02-install.sh -o /tmp/ws-pi-mom-02-install.sh && bash /tmp/ws-pi-mom-02-install.sh"
echo
echo "Puis : pi puis /login dans pi, puis script 3 (voir slides ou README)."
echo
echo "─────────────────────────────────────────────────────"
echo
echo "Ne fermez pas cette session root avant d'avoir testé la commande ssh ci-dessus."
echo
