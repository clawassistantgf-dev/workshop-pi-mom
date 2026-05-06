---
theme: apple-basic
title: Les Fadas de l'IA
colorSchema: light
info: |
  Workshop pi-mom sur VPS Hostinger
  Votre agent IA personnel, sur votre serveur.
layout: intro
class: pb-14
---

# Les Fadas de l'IA 🫒

Votre agent IA personnel, sur votre serveur, opérationnel en moins de 2h.

<div class="pt-2 flex gap-2 flex-wrap">
  <span class="px-3 py-1 rounded-full text-xs bg-purple-100 text-purple-700">Hostinger KVM2</span>
  <span class="px-3 py-1 rounded-full text-xs bg-teal-100 text-teal-700">Ubuntu 24.04 LTS</span>
  <span class="px-3 py-1 rounded-full text-xs bg-amber-100 text-amber-700">pi-mom</span>
  <span class="px-3 py-1 rounded-full text-xs bg-blue-100 text-blue-700">Slack</span>
  <span class="px-3 py-1 rounded-full text-xs bg-orange-100 text-orange-700">Cloudflare</span>
</div>

<IntroLanAccess />

---
layout: section
---

# Avant de commencer

---
layout: default
---

# Prérequis — 4 comptes en 5 min

<v-clicks>

- **Compte Google ou email** — Google accélère le login partout
- **Hostinger** — login Google, moins d'1 minute
- **GitHub** — login Google, 2 minutes
- **Slack** — login Google, 2 minutes
- **Abonnement LLM** — ChatGPT Plus, Gemini Advanced *(au choix)* ou GitHub Copilot Individual à $10/mois *(annulable avant 30 jours)*

</v-clicks>

<div v-click class="mt-6 p-4 rounded-lg bg-amber-50 border border-amber-200 text-sm text-amber-800">
  💡 Pas d'abonnement LLM ? GitHub Copilot Individual fait l'affaire — 3 minutes pour s'inscrire
</div>

---
layout: default
---

<h1 class="mb-4 text-3xl font-bold tracking-tight">Suivi live — même réseau Wi‑Fi que la salle</h1>

<FollowAudienceQr />

---
layout: section
---

# L'histoire

---
layout: default
---

# Novembre 2025 — Une nuit à Vienne

<div class="grid grid-cols-2 gap-10 mt-2">
<div class="space-y-4">

<div class="text-sm opacity-60">Peter Steinberger, développeur autrichien. Après 3 ans de voyage, il revient au code avec une idée simple :</div>

<v-click>
<div class="flex flex-col gap-2 text-sm">
  <div class="flex items-center gap-3 opacity-50">
    <span class="px-2 py-1 rounded border border-current text-xs">Avant</span>
    <span>Vous demandez → l'IA répond → fin.</span>
  </div>
  <div class="flex items-center gap-3 pl-1 opacity-30 text-lg">↓</div>
  <div class="flex items-center gap-3">
    <span class="px-2 py-1 rounded border border-purple-400 text-purple-400 text-xs">Son idée</span>
    <span>Vous demandez → l'IA <strong>fait</strong>.</span>
  </div>
</div>
</v-click>

<v-click>
<div class="flex items-center gap-0 mt-2">
  <div class="flex flex-col items-center gap-1">
    <div class="text-2xl">📱</div>
    <div class="text-xs opacity-40">WhatsApp</div>
  </div>
  <div class="flex-1 border-t border-dashed border-purple-400 mx-2 relative">
    <div class="absolute -top-2.5 left-1/2 -translate-x-1/2 text-purple-400 text-xs">message</div>
  </div>
  <div class="flex flex-col items-center gap-1">
    <div class="text-2xl">🧠</div>
    <div class="text-xs opacity-40">Claude</div>
  </div>
  <div class="flex-1 border-t border-dashed border-purple-400 mx-2 relative">
    <div class="absolute -top-2.5 left-1/2 -translate-x-1/2 text-purple-400 text-xs">action</div>
  </div>
  <div class="flex flex-col items-center gap-1">
    <div class="text-2xl">💻</div>
    <div class="text-xs opacity-40">Serveur</div>
  </div>
</div>
</v-click>

<v-click>
<div class="text-sm opacity-60">
  1 heure de code. L'IA exécute des commandes, crée des fichiers, cherche sur le web.<br>
  <strong class="opacity-100">Elle agit.</strong>
</div>
</v-click>

</div>
<div class="space-y-3 text-sm">

<v-click>
<div class="p-3 rounded-lg border border-gray-200 space-y-1">
  <div>💬 <span class="opacity-50">Vous :</span> "Résume le PDF dans mon dossier Downloads"</div>
  <div>🤖 <span class="opacity-50">Agent :</span> lit le fichier, écrit le résumé, vous l'envoie</div>
</div>
</v-click>

<v-click>
<div class="p-3 rounded-lg border border-gray-200 space-y-1">
  <div>💬 <span class="opacity-50">Vous :</span> "Crée-moi un site et mets-le en ligne"</div>
  <div>🤖 <span class="opacity-50">Agent :</span> code, déploie, envoie le lien</div>
</div>
</v-click>

<v-click>
<div class="p-3 rounded-lg border border-gray-200 space-y-1">
  <div>💬 <span class="opacity-50">Vous :</span> "Rappelle-moi le dentiste demain à 9h"</div>
  <div>🤖 <span class="opacity-50">Agent :</span> programme le rappel, l'envoie lui-même</div>
</div>
</v-click>

<v-click>
<div class="text-xs opacity-30 pt-1">Les grandes boîtes n'avaient pas fait ça. Ni OpenAI. Ni Google. Ni Anthropic.</div>
</v-click>

</div>
</div>

---
layout: fact
---

# 285 000 ⭐
Parmi les repos les plus ★ de l'histoire de GitHub

<div class="text-lg text-gray-500 mt-2">pics médiatisés ~4–5 mars 2026 (~250k★ dépassent React ~3 mars ; ~285k★ peu après) — le repo existe depuis ~nov. 2025</div>
<div class="text-sm text-gray-400 mt-1">(~369k★ au 5 mai 2026 sur github.com/openclaw/openclaw — et ça continue)</div>

---
layout: quote
---

*"OpenClaw est probablement la release logicielle la plus importante, you know, **probably ever**. Linux a mis 30 ans. OpenClaw : 3 semaines."*

<div class="mt-4 text-sm text-gray-400">Jensen Huang, CEO NVIDIA — reprise très médiatisée (ex.&nbsp;<a href="https://www.cnbc.com/video/2026/03/05/nvidia-ceo-jensen-huang-calls-openclaw-the-most-important-software-release-probably-ever.html" target="_blank" rel="noopener">CNBC, 5 mars</a>) + keynote&nbsp;GTC San Jose (~17 mars 2026,&nbsp;<a href="https://today.reuters.com/technology/artificial-intelligence/artificial-intelligencer-jensen-huang-wants-every-company-have-an-openclaw-plan-2026-03-18/" target="_blank" rel="noopener">Reuters</a>)</div>

---
layout: default
---

<div class="-mt-4 text-sm leading-snug">

<h1 class="mb-2 text-4xl font-bold tracking-tight">La timeline</h1>

<div class="space-y-1 mt-1">

<v-click>
<div class="flex gap-2 items-start py-1.5 px-2 rounded-lg border-l-4 border-purple-400 border border-gray-200">
  <div class="text-xs w-24 shrink-0 font-medium text-purple-400">Nov 2025</div>
  <div class="w-2 h-2 rounded-full bg-purple-400 shrink-0"></div>
  <div class="text-xs leading-snug"><strong>Clawdbot 🦞</strong> — 1 heure, 1 développeur autrichien, 1 idée folle</div>
</div>
</v-click>

<v-click>
<div class="flex gap-2 items-start py-1.5 px-2 rounded-lg border-l-4 border-gray-400 border border-gray-200">
  <div class="text-xs w-24 shrink-0 font-medium opacity-50">Jan 27, 2026</div>
  <div class="w-2 h-2 rounded-full bg-gray-400 shrink-0"></div>
  <div class="text-xs leading-snug"><strong>Clawdbot</strong> devient <strong>Moltbot</strong> 🦞 — 1er renommage (pression trademark <strong>Anthropic</strong> sur la proximité avec «&nbsp;Claude&nbsp;»)</div>
</div>
</v-click>

<v-click>
<div class="flex gap-2 items-start py-1.5 px-2 rounded-lg border-l-4 border-blue-400 border border-gray-200">
  <div class="text-xs w-24 shrink-0 font-medium text-blue-400">Jan 28, 2026</div>
  <div class="w-2 h-2 rounded-full bg-blue-400 shrink-0"></div>
  <div class="text-xs leading-snug"><strong>Moltbook</strong> — réseau social pour agents (Matt Schlicht). Viral ; ordre de grandeur <strong>~1,5M+</strong> «&nbsp;agents&nbsp;» enregistrés très vite (chiffres variables selon sources / fuites).</div>
</div>
</v-click>

<v-click>
<div class="flex gap-2 items-start py-1.5 px-2 rounded-lg border-l-4 border-teal-400 border border-gray-200">
  <div class="text-xs w-24 shrink-0 font-medium text-teal-600">Jan 30, 2026</div>
  <div class="w-2 h-2 rounded-full bg-teal-400 shrink-0"></div>
  <div class="text-xs leading-snug"><strong>Moltbot</strong> devient <strong>OpenClaw</strong> 🦞 — nom final du projet de Steinberger</div>
</div>
</v-click>

<v-click>
<div class="flex gap-2 items-start py-1.5 px-2 rounded-lg border-l-4 border-gray-400 border border-gray-200">
  <div class="text-xs w-24 shrink-0 font-medium opacity-50">Fév 14, 2026</div>
  <div class="w-2 h-2 rounded-full bg-gray-400 shrink-0"></div>
  <div class="text-xs leading-snug">Steinberger rejoint OpenAI. Le projet passe en <strong>fondation open-source</strong>.</div>
</div>
</v-click>

<v-click>
<div class="flex gap-2 items-start py-1.5 px-2 rounded-lg border-l-4 border-amber-400 border border-gray-200">
  <div class="text-xs w-24 shrink-0 font-medium text-amber-400"> ~3–5 mars 2026</div>
  <div class="w-2 h-2 rounded-full bg-amber-400 shrink-0"></div>
  <div class="text-xs leading-snug">OpenClaw grimpe très vite aux sommets GitHub★ (souvent cité comme dépassant <strong>React</strong> — pics ~250k★ puis ~285k★ selon le jour).</div>
</div>
</v-click>

<v-click>
<div class="flex gap-2 items-start py-1.5 px-2 rounded-lg border-l-4 border-amber-500 border border-gray-200">
  <div class="text-xs w-24 shrink-0 font-medium text-amber-600"> ~17 mars 2026</div>
  <div class="w-2 h-2 rounded-full bg-amber-600 shrink-0"></div>
  <div class="text-xs leading-snug"><strong>Jensen Huang</strong> met OpenClaw au centre au <strong>GTC</strong> — <em>«every company … needs an OpenClaw strategy»</em>, comparaisons avec Linux/Windows...</div>
</div>
</v-click>

<v-click>
<div class="flex gap-2 items-start py-1.5 px-2 rounded-lg border-l-4 border-indigo-400 border border-gray-200">
  <div class="text-xs w-24 shrink-0 font-medium text-indigo-500">Mar 10, 2026</div>
  <div class="w-2 h-2 rounded-full bg-indigo-400 shrink-0"></div>
  <div class="text-xs leading-snug"><strong>Meta</strong> rachète <strong>Moltbook</strong> — la plateforme rejoint <strong>Meta Superintelligence Labs</strong> (MSL). Matt Schlicht &amp; Ben Parr rejoignent Meta. <span class="text-gray-400">Annonce presse (Axios, TechCrunch&nbsp;…) — montant non divulgué.</span></div>
</div>
</v-click>

<v-click>
<div class="flex gap-2 items-start py-1.5 px-2 rounded-lg border-l-4 border-red-400 border border-gray-200">
  <div class="text-xs w-24 shrink-0 font-medium text-red-400">Mar 16, 2026</div>
  <div class="w-2 h-2 rounded-full bg-red-400 shrink-0"></div>
  <div class="text-xs leading-snug">NVIDIA annonce <strong>NemoClaw</strong> pour la communauté OpenClaw (<a class="underline" href="https://techcrunch.com/2026/03/16/nvidias-version-of-openclaw-could-solve-its-biggest-problem-security" target="_blank" rel="noopener">couverture presse ~16 mars</a>). Écosystème&nbsp;: l’agent minimal <strong>Pi</strong> (<strong>Mario Zechner</strong>) est souvent décrit comme le moteur type des déploiements OpenClaw ; Nvidia et la presse associent aussi <strong>Huang × Steinberger</strong> pour la couche sécurité / enterprise.</div>
</div>
</v-click>

</div>

</div>

---
layout: center
---

# Et dans 1h30

vous aurez votre propre instance.

**Privée. Sur votre serveur. Qui vous appartient.**

---
layout: section
---

# @LeJ — La démonstration

---
layout: default
---

# Voilà ce que vous aurez

<div class="text-sm text-gray-500 mb-4">Tout le monde est dans le workspace Slack <strong>Les Fadas de l'IA</strong> → canal <code>#agent</code></div>

<div class="grid grid-cols-2 gap-4 mt-2">

<v-click>
<div class="p-4 rounded-lg border border-gray-200 text-sm">
  <div class="font-medium mb-1">Démo 1</div>
  <div class="text-gray-500">Crée une blague en bash et exécute-la</div>
</div>
</v-click>

<v-click>
<div class="p-4 rounded-lg border border-gray-200 text-sm">
  <div class="font-medium mb-1">Démo 2</div>
  <div class="text-gray-500">Cherche la météo à Marseille</div>
</div>
</v-click>

<v-click>
<div class="p-4 rounded-lg border border-gray-200 text-sm">
  <div class="font-medium mb-1">Démo 3</div>
  <div class="text-gray-500">Écris un haiku sur les agents IA</div>
</div>
</v-click>

<v-click>
<div class="p-4 rounded-lg border border-orange-200 bg-orange-50 text-sm">
  <div class="font-medium mb-1 text-orange-700">Démo 4 🛡️</div>
  <div class="text-orange-600">Demande risquée → l'agent demande confirmation</div>
</div>
</v-click>

</div>

<v-click>
<div class="mt-4 text-sm text-gray-400 italic">"C'est exactement ça que vous allez avoir. Commençons."</div>
</v-click>

---
layout: section
---

# Installation

---
layout: default
---

# Étape 1 — Commander le VPS

<v-clicks>

1. Hostinger → VPS → **KVM2** — ~10€/mois *(ou lien + QR ci-dessous)*
2. OS : **Ubuntu 24.04 LTS** — Région : Europe
3. Valider → le VPS se provisionne (5-15 min selon la charge)

</v-clicks>

<div v-click class="mt-5 grid md:grid-cols-2 gap-6 md:gap-10 items-start pb-8">
<div class="space-y-3">
  <div class="text-sm font-semibold text-gray-800">Panier direct — KVM2 · 1 mois</div>
  <a
    href="https://www.hostinger.com/fr/cart?product=vps%3Avps_kvm_2&period=1&referral_type=cart_link&REFERRALCODE=V1OGALOISR48&referral_id=019df8d4-eca0-7030-be02-33c5e732a5db"
    target="_blank"
    rel="noopener noreferrer"
    class="inline-flex items-center justify-center px-5 py-3 rounded-xl bg-violet-600 text-white font-medium text-base shadow-md hover:bg-violet-700 transition-colors"
  >
    Ouvrir Hostinger KVM2
  </a>
  <p class="text-xs text-gray-500 leading-relaxed">
    Lien affiliation (même prix affiché chez Hostinger). URL complète affichée sur le QR — suffisamment grand pour scanner depuis le fond de la salle.
  </p>
</div>
<div class="flex flex-col items-center md:items-end w-full shrink-0">
  <div class="rounded-[1.85rem] bg-white px-6 py-6 pb-8 shadow-xl border border-gray-100 mb-3 max-w-[min(94vw,20rem)] box-border overflow-visible">
    <img
      src="https://api.qrserver.com/v1/create-qr-code/?size=460x460&amp;ecc=H&amp;margin=32&amp;color=1f2937&amp;bgcolor=ffffff&amp;format=png&amp;data=https%3A%2F%2Fwww.hostinger.com%2Ffr%2Fcart%3Fproduct%3Dvps%253Avps_kvm_2%26period%3D1%26referral_type%3Dcart_link%26REFERRALCODE%3DV1OGALOISR48%26referral_id%3D019df8d4-eca0-7030-be02-33c5e732a5db"
      alt="QR code panier VPS KVM2 Hostinger"
      width="280"
      height="280"
      class="block w-[min(78vw,280px)] max-w-[280px] h-auto mx-auto rounded-lg object-contain"
      loading="lazy"
    >
    <p class="mt-5 mx-2 text-xs text-gray-400 text-center leading-relaxed px-2">
      Laissez le cadre blanc autour visible — sans ça les téléphones lisent mal. Scannez avec l’appareil photo ou Google Lens.
    </p>
  </div>
</div>
</div>

<div v-click class="mt-6 font-mono text-sm bg-gray-50 border border-gray-200 rounded-lg p-4 text-gray-600">
VPS KVM2 · 2 vCPU · 8 GB RAM · 100 GB NVMe · Ubuntu 24.04 LTS
<div class="text-xs text-gray-400 mt-1">= largement assez pour faire tourner votre agent 24/7</div>
</div>

<div v-click class="mt-4 p-3 rounded-lg bg-blue-50 border border-blue-200 text-sm text-blue-700">
  📧 <strong>Hostinger vous envoie un email</strong> avec l'IP du serveur et le mot de passe root.
  Gardez-le ouvert — on en a besoin dans 2 minutes.
</div>

<div v-click class="mt-2 text-sm text-gray-500">
⏳ On continue les autres étapes pendant que le serveur boot.
</div>

---
layout: default
---

# Étape 2 — Slack workspace + App

<div class="grid grid-cols-2 gap-8">
<div>

**Workspace**
<v-clicks>

- slack.com → "Create a workspace"
- Nom = nom de votre agent
- Créer le canal `#agent`

</v-clicks>

</div>
<div>

**Slack App**
<v-clicks>

- api.slack.com/apps → From Scratch
- Socket Mode → **ON**
- App Token `connections:write` → copier `xapp-...`
- Bot Scopes → Install → copier `xoxb-...`

</v-clicks>

</div>
</div>

<div v-click class="mt-6 p-3 rounded-lg bg-amber-50 border border-amber-200 text-xs font-mono space-y-1 text-amber-900">
  <div>MOM_SLACK_APP_TOKEN = xapp-...</div>
  <div>MOM_SLACK_BOT_TOKEN = xoxb-...</div>
</div>

<div v-click class="mt-3 text-xs text-gray-600">
  <strong>Bot Token Scopes</strong> à cocher (13 scopes) :<br>
  <code>app_mentions:read</code> · <code>chat:write</code> · <code>files:write</code> · <code>im:write</code> ·
  <code>assistant:write</code> · <code>channels:history</code> · <code>groups:history</code> ·
  <code>im:history</code> · <code>channels:read</code> · <code>files:read</code> · <code>im:read</code> ·
  <code>groups:read</code> · <code>users:read</code>
</div>

<div v-click class="mt-2 text-xs text-amber-700">
  ⚠️ Après avoir ajouté <code>users:read</code>, cliquez "Reinstall to Workspace" en haut de la page.
</div>

---
layout: default
---

# Étape 3 — Repo GitHub privé

<v-clicks>

1. github.com → **New repository**
2. Nom : `mon-agent` — **Private** ✓ — **Initialize with README** ✓ *(important)*
3. Copier l'URL du repo → on en a besoin au Script 3

</v-clicks>

<div v-click class="mt-6 font-mono text-sm bg-gray-50 border border-gray-200 rounded-lg p-4 text-gray-600 space-y-1">
  <div>Backup automatique toutes les 6h → GitHub privé</div>
  <div class="text-amber-600">⚠️ .env JAMAIS commité — protégé dès le Script 2 par .gitignore</div>
</div>

<div v-click class="mt-3 text-xs text-gray-500">
  💡 Si vous oubliez de cocher "Initialize with README", le repo est vide — le push du Script 3 se passe différemment. Le plus simple : recommencez la création.
</div>

---
layout: default
---

# Premiers réflexes terminal

<div class="text-sm text-gray-500 mb-4">
  Avant de plonger : 3 choses utiles à savoir si c'est votre première fois.
</div>

<div class="space-y-4">

<div class="flex gap-4 items-start text-sm">
  <div class="text-xl">👀</div>
  <div>
    <div class="font-medium">Lisez avant d'appuyer sur Entrée</div>
    <div class="text-gray-500 text-xs mt-0.5">
      Surtout pour les commandes qu'on copie-colle. Une coquille dans une URL et le script ne charge pas.
    </div>
  </div>
</div>

<div class="flex gap-4 items-start text-sm">
  <div class="text-xl">🙈</div>
  <div>
    <div class="font-medium">Quand vous tapez un mot de passe, RIEN ne s'affiche</div>
    <div class="text-gray-500 text-xs mt-0.5">
      Pas d'étoiles, pas de points. C'est normal, c'est sécurisé. Tapez et appuyez sur Entrée.
    </div>
  </div>
</div>

<div class="flex gap-4 items-start text-sm">
  <div class="text-xl">📋</div>
  <div>
    <div class="font-medium">Copier-coller dans le terminal</div>
    <div class="text-gray-500 text-xs mt-0.5">
      Mac : <code>Cmd+C</code> / <code>Cmd+V</code>. Windows/Linux : <code>Ctrl+Shift+V</code> dans le terminal (pas <code>Ctrl+V</code>). Clic droit → Coller marche aussi partout.
    </div>
  </div>
</div>

</div>

---
layout: default
---

# Étape 4 — SSH + Script 1

**Première connexion au serveur** *(IP et mot de passe = email Hostinger)*

```bash
ssh -i ~/.ssh/lej root@VOTRE_IP_HOSTINGER
```

<div class="text-xs text-gray-500 mt-2 -mb-1">
  <code>-i</code> = chemin de votre <strong>clé privée</strong> (le même nom que pour <code>ssh-keygen -f ~/.ssh/lej</code> — remplacez <code>lej</code> par celui de votre agent). Pas encore de clé sur la machine ? <code>ssh root@VOTRE_IP_HOSTINGER</code> avec le mot de passe root, puis générez la clé (slide suivante) avant de coller la pub dans le script.
</div>

<v-clicks>

<div class="text-sm text-gray-500">
La première fois, SSH demande : <em>"Are you sure you want to continue connecting (yes/no/[fingerprint])?"</em><br>
→ Tapez <strong>yes</strong> en entier puis Entrée. Puis collez le mot de passe root (rien ne s'affiche, c'est normal).
</div>

Dans **le même terminal** que votre session SSH **root sur le VPS** (invite du type <code>root@votre-serveur:~#</code>), lancez le script de sécurisation :

```bash
# whoami doit afficher « root » · téléchargement sous $HOME limite « curl (23) » quand /tmp pose problème
curl -fsSL https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/01-secure.sh -o "$HOME/ws-pi-mom-01-secure.sh" && bash "$HOME/ws-pi-mom-01-secure.sh"
```

Si <code>curl</code> affiche encore <code>(23) Failure writing</code> : <code>df -h</code> (disque plein ?), puis essayez <code>-o /root/ws-pi-mom-01-secure.sh</code> à la place de <code>"$HOME/…"</code>.

Le script demande :
- **Nom de votre agent** *(sera votre user Linux)*
- **Mot de passe** *(double confirmation, invisible à la saisie)*
- **Votre clé SSH publique** *(générée à l'étape suivante)*

Résultat : root désactivé · UFW actif · règle sudo prête pour le Script 2

</v-clicks>

<div v-click class="mt-3 p-3 rounded-lg bg-amber-50 border border-amber-200 text-xs text-amber-800">
  ⚠️ <strong>Ne fermez pas la fenêtre root</strong> avant d'avoir testé la reconnexion sur votre nouveau user. Sécurité.
</div>

<div v-click class="mt-2 text-xs text-gray-500 italic">
  💡 Une commande <code>curl … -o … && bash …</code> évite les soucis de <code>/dev/fd/…</code>. Pour le script&nbsp;1, la cible sous <strong><code>$HOME</code></strong> réduit les erreurs d’écriture sur certains VPS ; pour le&nbsp;2, <code>/tmp</code> reste indiqué si ça passe chez vous.
</div>

---
layout: default
---

# Générer votre clé SSH

À faire **sur votre ordinateur** (pas sur le serveur). Remplacez `lej` par le nom de votre agent.

<div class="grid grid-cols-3 gap-4 mt-4 text-sm">

<div>

**🍎 Mac**
```bash
ssh-keygen -t ed25519 \
  -f ~/.ssh/lej -N ""
cat ~/.ssh/lej.pub | pbcopy
echo "✅ Clé copiée"
```

</div>

<div>

**🐧 Linux**
```bash
ssh-keygen -t ed25519 \
  -f ~/.ssh/lej -N ""
cat ~/.ssh/lej.pub | xclip \
  -selection clipboard
echo "✅ Clé copiée"
```

</div>

<div>

**🪟 Windows (PowerShell)**
```powershell
ssh-keygen -t ed25519 `
  -f "$env:USERPROFILE\.ssh\lej" `
  -N '""'
Get-Content `
  "$env:USERPROFILE\.ssh\lej.pub" `
  | Set-Clipboard
```

</div>

</div>

<div class="mt-4 text-sm text-gray-500">
  Vous collez la clé publique dans le terminal serveur (clic droit → Coller) → le script fait le reste.
</div>

<div class="mt-2 text-xs text-gray-400">
  Linux sans <code>xclip</code> ? Installez avec <code>sudo apt install xclip</code>, ou utilisez <code>cat ~/.ssh/lej.pub</code> et copiez à la main.
</div>

---
layout: default
---

# Étape 5 — Script 2 : Installation

```bash
curl -fsSL https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/02-install.sh -o /tmp/ws-pi-mom-02-install.sh && bash /tmp/ws-pi-mom-02-install.sh
```

<div class="mt-4 text-sm text-gray-500">
  ⏳ ~8-16 minutes (npm workspaces + compilation <code>pi-tui</code> puis <code>coding-agent</code>). Le script est <strong>idempotent</strong> — relançable sans danger. Le hook <code>prepare</code> <strong>husky</strong> du monorepo est neutralisé sur le VPS (sinon erreur&nbsp;127) ; pareil&nbsp;: <code>HUSKY=0</code>.
</div>

<div class="mt-6 grid grid-cols-2 gap-3 text-sm">

<div class="p-3 rounded-lg border border-gray-200">
  <div class="font-medium mb-1">📦 Node.js 20 LTS</div>
  <div class="text-gray-500 text-xs">via NodeSource — runtime de pi</div>
</div>

<div class="p-3 rounded-lg border border-gray-200">
  <div class="font-medium mb-1">🐋 Docker</div>
  <div class="text-gray-500 text-xs">isolation des commandes que l'agent exécute</div>
</div>

<div class="p-3 rounded-lg border border-gray-200">
  <div class="font-medium mb-1">🤖 pi</div>
  <div class="text-gray-500 text-xs"><code>@mariozechner/pi-coding-agent</code></div>
</div>

<div class="p-3 rounded-lg border border-purple-300 bg-purple-50">
  <div class="font-medium mb-1">💬 pi-mom <span class="text-xs text-purple-600">version Les Fadas</span></div>
  <div class="text-gray-500 text-xs">fork de <code>pi-mom</code>, build local depuis sources</div>
</div>

</div>

<div class="mt-4 p-3 rounded-lg bg-gray-50 border border-gray-200 text-xs text-gray-600">
  Crée aussi <code>~/agent-workspace</code> avec un <code>.gitignore</code> qui protège déjà <code>.env</code>.
  <br>Active le <strong>lingering systemd</strong> pour que votre agent tourne 24/7 même quand vous êtes déconnecté.
</div>

---
layout: default
---

# Pendant que ça installe...

<div class="text-sm text-gray-500 mb-4">
  Le script tourne ~10 min. Bon moment pour expliquer ce qu'il fait — et la suite contient une bonne nouvelle.
</div>

<div class="space-y-3">

<v-click>
<div class="flex gap-4 items-start text-sm">
  <div class="text-xl">🐋</div>
  <div>
    <div class="font-medium">Pourquoi Docker ?</div>
    <div class="text-gray-500 text-xs mt-0.5">
      L'agent va exécuter des commandes bash que <strong>vous</strong> lui demandez.
      Docker permet de les sandboxer — l'agent ne peut pas écrire n'importe où sur le serveur.
    </div>
  </div>
</div>
</v-click>

<v-click>
<div class="flex gap-4 items-start text-sm">
  <div class="text-xl">⏰</div>
  <div>
    <div class="font-medium">Lingering systemd, c'est quoi ?</div>
    <div class="text-gray-500 text-xs mt-0.5">
      Par défaut, vos services s'arrêtent quand vous fermez SSH. Lingering = ils tournent même sans vous.
      Indispensable pour un agent toujours actif.
    </div>
  </div>
</div>
</v-click>

<v-click>
<div class="flex gap-4 items-start text-sm">
  <div class="text-xl">🔁</div>
  <div>
    <div class="font-medium">Si ça plante en cours de route ?</div>
    <div class="text-gray-500 text-xs mt-0.5">
      Le script est idempotent. Relancez-le, il reprend où il en était.
    </div>
  </div>
</div>
</v-click>

</div>

<div v-click class="mt-4 p-3 rounded-lg bg-amber-50 border border-amber-200 text-xs text-amber-800">
  ⚠️ À la fin du script : <strong>déconnectez-vous puis reconnectez-vous</strong> (ou tapez <code>newgrp docker</code>) pour que le groupe Docker soit actif sans sudo.
</div>

---
layout: default
---

# Roadmap pi-mom — version Les Fadas 🦞

<div class="text-sm text-gray-500 mb-4">
  Vous installez aujourd'hui pi-mom officiel (Mario Zechner).<br>
  Voici les <strong>features Les Fadas</strong> que je vais activer dans les prochaines sessions :
</div>

<div class="grid grid-cols-2 gap-3 mt-4">

<v-click>
<div class="p-3 rounded-lg border border-gray-200">
  <div class="flex items-center gap-2 font-medium mb-1">
    <span class="text-xl">⏳</span>
    <span>Sabliers visibles dans Slack</span>
  </div>
  <div class="text-gray-500 text-xs">
    Quand l'agent travaille, vous le voyez. Plus jamais le doute "est-ce qu'il a planté ?".
  </div>
</div>
</v-click>

<v-click>
<div class="p-3 rounded-lg border border-gray-200">
  <div class="flex items-center gap-2 font-medium mb-1">
    <span class="text-xl">🚦</span>
    <span>Queue agentique par thread</span>
  </div>
  <div class="text-gray-500 text-xs">
    Un seul call à la fois par conversation. Vous bombardez l'agent, il traite proprement, dans l'ordre.
  </div>
</div>
</v-click>

<v-click>
<div class="p-3 rounded-lg border border-gray-200">
  <div class="flex items-center gap-2 font-medium mb-1">
    <span class="text-xl">🧠</span>
    <span>Mémoire persistante</span>
  </div>
  <div class="text-gray-500 text-xs">
    L'historique sauvegardé entre les sessions. L'agent se souvient de ce qu'on a fait hier.
  </div>
</div>
</v-click>

<v-click>
<div class="p-3 rounded-lg border border-gray-200">
  <div class="flex items-center gap-2 font-medium mb-1">
    <span class="text-xl">🔄</span>
    <span>SYSTEM.md auto-rechargé</span>
  </div>
  <div class="text-gray-500 text-xs">
    Vous éditez la personnalité de l'agent → il la relit tout seul. Pas de redémarrage.
  </div>
</div>
</v-click>

</div>

<div v-click class="mt-4 p-3 rounded-lg bg-blue-50 border border-blue-200 text-xs text-blue-700">
  💡 Mon fork est sur <code>github.com/clawassistantgf-dev/pi-mono</code> — vous pouvez le suivre pour récupérer les features quand elles seront stables.
</div>

---
layout: default
---

# Étape 6 — pi /login

**Votre agent rencontre son cerveau**

```bash
pi
```

Puis dans l’interface pi :

```
/login
```

Choisir votre fournisseur *(ChatGPT / Gemini / GitHub Copilot / …)*. **Tous les OAuth** suivent la même logique : **URL du terminal → navigateur → URL localhost dans la barre d’adresse → vous la collez dans la fenêtre SSH où tourne pi**.

<v-clicks>

1. **Une URL longue** apparaît dans le terminal → **copiez-la entièrement** (aucun provider ne doit avoir une URL coupée à la souris ou au terminal).
2. Ouvrez-la dans le navigateur de **votre ordinateur** et connectez-vous ; **autorisez** l’accès côté fournisseur.
3. Le navigateur affiche alors une redirection du type <code>http://127.0.0.1:</code>… ou <code>http://localhost:</code>… → **copiez cette URL complète** depuis la barre d’adresse *(c’est celle qu’il faut recoller dans le terminal)*.
4. Dans la **session SSH** où <code>pi</code> est lancé, **collez** cette URL lorsque pi la demande.
5. Une fois terminé : <code>Ctrl+C</code> pour quitter pi si vous en avez terminé avec le test.

</v-clicks>

### GitHub Copilot — précisions

<v-clicks>

- **a)** Invite <em>« GitHub Enterprise URL/domain »</em> pour **github.com** : laissez le champ **vide** puis **Entrée** *(Copilot Individual / compte standard)*.
- **b)** Copiez **intégralement** l’URL OAuth sortie dans le terminal — même principe **pour tous les logins**.
- **c)** Après validation sur GitHub, reprenez la **locale** <code>http://127.0.0.1:…</code> / <code>localhost…</code> du navigateur et collez-la dans pi comme aux étapes ci-dessus.

</v-clicks>

### Modèle et test rapide

<v-clicks>

- <code>Ctrl+L</code> : **liste / choix du modèle** *(le bandeau d’aide de pi liste les raccourcis disponibles selon votre build)*.
- Posez une **question de test** pour vérifier que le fournisseur répond.

</v-clicks>

<div v-click class="mt-4 p-3 rounded-lg bg-amber-50 border border-amber-200 text-sm text-amber-900">
  <strong>Ensuite — Étape&nbsp;7 Script&nbsp;3</strong> : tokens Slack, fichier <code>.keys</code>, service systemd pour pi-mom, etc. Le script&nbsp;3 vérifie la présence de <code>~/.pi/agent/auth.json</code> après ce <code>/login</code>.
</div>

<div v-click class="mt-4 p-3 rounded-lg bg-blue-50 border border-blue-200 text-sm text-blue-700">
  OAuth : pas de clé API dans le VPS — vous utilisez l’abonnement du fournisseur.
</div>

---
layout: default
---

# Étape 7 — Script 3 : Configuration

```bash
curl -fsSL https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/03-configure.sh -o /tmp/ws-pi-mom-03-configure.sh && bash /tmp/ws-pi-mom-03-configure.sh
```

<div class="mt-4 space-y-2 text-sm">

Après avoir réussi **pi** + **/login**, le script&nbsp;3 pose **plusieurs questions** :

<v-clicks>

- Tokens Slack APP et Bot *(formats <code>xapp-</code> / <code>xoxb-</code>)*
- Fournisseur et modèle LLM *(repris depuis votre <code>/login</code>, modifiables à la frappe)*
- Prénom / surnom de l’agent
- URL du repo GitHub privé *(facultatif)*

</v-clicks>

</div>

<div v-click class="mt-4 flex flex-wrap gap-2 text-xs">
  <span class="px-2 py-1 rounded-full bg-green-100 text-green-700">.env écrit</span>
  <span class="px-2 py-1 rounded-full bg-green-100 text-green-700">SYSTEM.md créé</span>
  <span class="px-2 py-1 rounded-full bg-green-100 text-green-700">git init + push</span>
  <span class="px-2 py-1 rounded-full bg-green-100 text-green-700">cron backup 6h</span>
  <span class="px-2 py-1 rounded-full bg-green-100 text-green-700">systemd actif</span>
</div>

---
layout: section
---

# Premier contact 🎉

---
layout: center
---

# Ouvrez Slack

<div class="mt-4 font-mono text-lg bg-gray-50 border border-gray-200 rounded-lg px-8 py-6 text-gray-700">
  @[VOTRE_AGENT] Bonjour !<br>
  Qui es-tu et qu'est-ce que tu sais faire ?
</div>

<div class="mt-6 text-gray-400 text-sm">Laissez tourner. Explorez. Demandez-lui n'importe quoi.</div>

---
layout: section
---

# Sécurité

---
layout: default
---

# 3 règles, pas plus

<div class="space-y-6 mt-4">

<div class="flex gap-4 items-start">
  <div class="text-2xl">🔒</div>
  <div>
    <div class="font-medium">.env ne quitte jamais le serveur</div>
    <div class="text-sm text-gray-500 mt-1">Il est dans <code>.gitignore</code> dès le Script 2. Si quelqu'un y accède : changez les tokens immédiatement.</div>
  </div>
</div>

<div class="flex gap-4 items-start">
  <div class="text-2xl">🧠</div>
  <div>
    <div class="font-medium">Votre agent exécute du bash</div>
    <div class="text-sm text-gray-500 mt-1">En cas de doute : demandez-lui d'expliquer ce qu'il va faire avant de le faire.</div>
  </div>
</div>

<div class="flex gap-4 items-start">
  <div class="text-2xl">🔄</div>
  <div>
    <div class="font-medium">Gardez à jour</div>
    <div class="text-sm text-gray-500 mt-1"><code>npm install -g @mariozechner/pi-mom</code> — une ligne, une fois par semaine.</div>
  </div>
</div>

</div>

---
layout: section
---

# Bien utiliser son agent

---
layout: two-cols
---

# Ce qui marche

<v-clicks>

✅ **Soyez précis**
*"Crée un fichier recap.md avec les 5 points clés de notre réunion"*

✅ **Donnez du contexte**
*"Je suis graphiste, mon client est dans la restauration..."*

✅ **Demandez-lui de s'expliquer**
*"Avant de faire X, dis-moi ce que tu vas faire"*

✅ **Construisez des routines**
*"Chaque matin à 9h, envoie-moi un résumé des emails importants"*

</v-clicks>

::right::

# Ce qu'il faut éviter

<v-clicks>

❌ Les demandes vagues

❌ Confiance aveugle sur des actions irréversibles

❌ Oublier les limites de tokens de votre abonnement

❌ Ne jamais lui donner de contexte sur vous

</v-clicks>

---
layout: default
---

# Première mission ensemble

<div class="mt-6 font-mono text-sm bg-gray-50 border border-gray-200 rounded-lg p-5 text-gray-600 leading-relaxed">

Interviewe-moi pour créer mon SYSTEM.md.<br>
Pose-moi des questions <strong>une par une</strong> sur :<br>
<br>
— Ta personnalité et ton ton<br>
— Tes domaines d'expertise<br>
— Ce que tu aimes et ce que tu n'aimes pas faire<br>
— Ton prénom ou surnom<br>
— Tes règles de base<br>
<br>
Quand tu as assez d'infos, écris le fichier<br>
<code>~/agent-workspace/SYSTEM.md</code><br>
et dis-moi de te redémarrer.

</div>

---
layout: section
---

# Bonus — pour aller plus loin

---
layout: default
---

# Cloudflare Voice — projet bonus

**Vocal → site en ligne en quelques minutes** *(à essayer chez vous après le workshop)*

<v-clicks>

1. Envoyer un **message vocal** dans Slack avec votre idée
2. Si Slack a la transcription auto → la copier ; sinon, dictez sur votre téléphone
3. Envoyer à l'agent :

```
Utilise Cloudflare Pages (gratuit) pour créer et déployer :
[votre idée].
Donne-moi le lien quand c'est en ligne.
```

4. L'agent code, déploie, retourne le **lien du site**

</v-clicks>

<div v-click class="mt-4 text-xs text-gray-500 italic">
  La transcription Slack auto nécessite un plan payant. Sur un workspace gratuit : utilisez la dictée de votre téléphone.
</div>

---
layout: default
---

# 🚨 Si ça plante — les 2 pièges connus

<div class="space-y-5 mt-4">

<div class="p-4 rounded-lg border border-amber-300 bg-amber-50">
  <div class="font-medium text-amber-900 mb-1">⚠️ Script 1 — erreur "dpkg was interrupted"</div>
  <div class="text-sm text-amber-800 mt-2">
    Image Hostinger parfois livrée avec dpkg en attente. Fix en root :
  </div>
<pre class="text-xs bg-white rounded p-2 mt-2 border border-amber-200"><code>dpkg --configure -a
deluser --remove-home AGENT 2>/dev/null
rm -f /etc/sudoers.d/90-fadas-agent</code></pre>
  <div class="text-xs text-amber-700 mt-2">Puis relancez le script 1.</div>
</div>

<div class="p-4 rounded-lg border border-red-300 bg-red-50">
  <div class="font-medium text-red-900 mb-1">⚠️ Script 3 — "Container 'mom-sandbox' does not exist"</div>
  <div class="text-sm text-red-800 mt-2">
    Le daemon systemd n'a pas vu le groupe docker. Fix :
  </div>
<pre class="text-xs bg-white rounded p-2 mt-2 border border-red-200"><code>loginctl terminate-user $USER
# Vous serez déconnecté → reconnectez-vous en SSH
systemctl --user start pi-mom</code></pre>
</div>

</div>

<div class="mt-4 text-xs text-gray-500 italic">
  Tous les scripts sont idempotents — relançables sans danger.
</div>

---
layout: intro
---

# C'est à vous 🫒

Votre agent tourne 24h/24 sur votre serveur.

<div class="mt-6 space-y-1 text-sm text-gray-500">
  <div>github.com/clawassistantgf-dev/workshop-pi-mom <span class="text-xs text-gray-400">— scripts du workshop</span></div>
  <div>github.com/clawassistantgf-dev/pi-mono <span class="text-xs text-gray-400">— pi-mom version Les Fadas</span></div>
  <div>github.com/badlogic/pi-mono <span class="text-xs text-gray-400">— pi-mono original (Mario Zechner)</span></div>
</div>

<div class="mt-6 text-sm text-gray-400">
  Le workspace Slack <strong>Les Fadas de l'IA</strong> reste actif.<br>
  @LeJ est là si vous avez des questions.
</div>
