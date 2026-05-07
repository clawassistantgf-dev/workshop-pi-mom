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

<p class="font-semibold mb-2">Workspace</p>
<v-clicks>

- slack.com → "Create a workspace"
- Nom = nom de votre agent
- Créer le canal `#agent`

</v-clicks>

</div>
<div>

<p class="font-semibold mb-2">Slack App</p>
<v-clicks>

- api.slack.com/apps → From Scratch
- Socket Mode → <strong>ON</strong>
- App Token <code>connections:write</code> → copier <code>xapp-...</code>
- Bot Scopes → Install → copier <code>xoxb-...</code>

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

# Étape 3 — Aujourd’hui, on va jusqu’où ?

<div class="text-sm text-gray-600 mb-4 leading-relaxed max-w-3xl">

<strong>But de la séance</strong> : votre <strong>agent répond dans Slack</strong> sur le VPS, workspace propre.<br>
Rien d’autre n’est obligatoire pour dire « l’atelier est réussi ».

</div>

<v-clicks>

<ul class="text-sm space-y-3 mt-2 max-w-3xl list-disc pl-6 text-left break-words">

<li><strong>Script 1</strong> — Clé SSH (PC) + compte Linux + pare-feu. <em>Une fois.</em></li>

<li><strong>Script 2</strong> — Node, build <strong>pi-mom</strong>, <code>~/agent-workspace</code>, <strong>lingering</strong> <span class="text-gray-500">(actif sans session SSH)</span>.</li>

<li><strong>Script 3</strong> — Slack, LLM, nom, <code>SYSTEM.md</code>, dossiers <code>projects/</code> <code>missions/</code> <code>tools/</code>, <strong>systemd</strong>.</li>

</ul>

</v-clicks>

<div v-click class="mt-5 p-4 rounded-xl bg-violet-50 border border-violet-200 text-sm text-violet-950 max-w-3xl leading-snug">

<p class="font-medium mb-2">Pas de GitHub dans le script 3 ?</p>

<p class="mb-0">D’abord <strong>voir l’agent vivre</strong>. Git reste <strong>local sur le VPS</strong> — pas besoin de compte GitHub pour la démo.</p>

</div>

<div v-click class="mt-4 p-4 rounded-xl bg-gray-50 border border-gray-200 text-sm text-gray-800 max-w-3xl leading-snug">

<p class="mb-0"><strong>GitHub</strong> plus tard (backup / partage) : <strong>SSH uniquement</strong>, voir <code>docs/MISSIONS.md</code> <em>(après l’exercice Slack)</em>.</p>

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

# Avant le serveur — générer une clé SSH

<div class="text-sm text-gray-600 mb-3 max-w-3xl leading-snug space-y-2">

<p class="mb-0"><strong>Même nom partout :</strong> <code>MON_AGENT</code> → identifiant court <em>sans espaces</em> (ex. <code>marie</code>, <code>bot01</code>).</p>

<p class="mb-0">Nom du fichier sous <code>~/.ssh/</code>, même nom en <code>ssh -i …</code> et user Linux au script&nbsp;1.</p>

</div>

À faire **sur votre PC** (terminal local), pas sur le VPS.

## Mac

```bash
ssh-keygen -t ed25519 -f ~/.ssh/MON_AGENT -N "" && cat ~/.ssh/MON_AGENT.pub | pbcopy && echo "✅ Clé copiée"
```

## Linux

```bash
ssh-keygen -t ed25519 -f ~/.ssh/MON_AGENT -N "" && cat ~/.ssh/MON_AGENT.pub | xclip -selection clipboard && echo "✅ Clé copiée"
```

## Windows (PowerShell)

```powershell
ssh-keygen -t ed25519 -f "$env:USERPROFILE\.ssh\MON_AGENT" -N '""'
Get-Content "$env:USERPROFILE\.ssh\MON_AGENT.pub" | Set-Clipboard
Write-Host "Copié dans le presse-papiers"
```

<div class="mt-3 text-xs text-gray-500 max-w-3xl leading-snug">

Pas de <code>xclip</code> sur Linux ? <code>sudo apt install xclip</code> ou ouvrez <code>cat ~/.ssh/MON_AGENT.pub</code> et copiez la ligne à la main.

<div v-click class="mt-2 text-xs text-gray-500 italic">

💡 Une commande <code>curl … -o … && bash …</code> évite les soucis de <code>/dev/fd/…</code>. Pour le script&nbsp;1, télécharger sous <strong><code>$HOME</code></strong> limite l’erreur « curl (23) » sur certains VPS.

</div>
</div>

---
layout: default
---

# Étape 4 — SSH + Script 1

<div class="text-sm text-gray-600 mb-2 max-w-3xl leading-snug">

<strong>Prérequis :</strong> clé créée (slide précédente). IP + mot de passe root = e-mail Hostinger.

</div>

**1) Connexion au VPS** — remplacez **`MON_AGENT`** (même nom que pour la clé) et **`VOTRE_IP`** :

```bash
ssh root@VOTRE_IP
```

<ul class="text-sm text-gray-600 list-disc pl-5 max-w-3xl space-y-1 mt-2">
<li>Première fois : si SSH demande la signature du serveur → tapez <code>yes</code> puis Entrée.</li>
<li>Mot de passe root : rien ne s’affiche quand vous tapez, c’est normal.</li>
<li>Pas de clé encore ? Générez-la sur la slide précédente, puis revenez ici.</li>
</ul>

**2) Sur le VPS** (invite <code>root@…#</code>), lancer le script&nbsp;1 :

```bash
curl -fsSL https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/01-secure.sh -o "$HOME/ws-pi-mom-01-secure.sh" && bash "$HOME/ws-pi-mom-01-secure.sh"
```

<v-clicks>

<ul class="text-sm text-gray-700 list-disc pl-5 max-w-3xl space-y-1">
<li><strong>Nom</strong> → votre futur user Linux (cohérent avec <code>MON_AGENT</code> si vous voulez vous simplifier la vie).</li>
<li><strong>Mot de passe</strong> (double saisie, invisible).</li>
<li><strong>Clé publique</strong> — collez celle du presse-papiers (slide d’avant).</li>
</ul>

<p class="text-sm text-gray-600 mt-2 max-w-3xl">Si <code>curl: (23) Failure writing</code> : <code>df -h</code>, puis essayez <code>-o /root/ws-pi-mom-01-secure.sh</code> à la place de <code>"$HOME/…"</code>.</p>

</v-clicks>

<div class="mt-3 p-3 rounded-lg bg-amber-50 border border-amber-200 text-xs text-amber-900 max-w-3xl">

⚠️ Gardez la session <strong>root</strong> ouverte jusqu’à avoir testé la connexion avec votre <strong>nouvel utilisateur</strong>.

</div>

<div v-click class="mt-2 text-xs text-gray-500 max-w-3xl">

💡 Télécharger le script sous <code>$HOME</code> évite souvent l’erreur curl (23) sur certains VPS.

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
  <div class="font-medium mb-1">🐋 Docker <span class="text-gray-400 font-normal">(optionnel)</span></div>
  <div class="text-gray-500 text-xs">seulement si <code>--with-docker</code> ou <code>INSTALL_DOCKER=1</code> — pi-mom ne l'utilise pas</div>
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
  <div class="text-xl">🖥️</div>
  <div>
    <div class="font-medium">Agent sur le serveur (sans sandbox Docker)</div>
    <div class="text-gray-500 text-xs mt-0.5">
      <code>pi-mom</code> tourne avec <strong>votre utilisateur Unix</strong> : même pouvoir qu'un shell sur le VPS.
      Soyez conscients des risques — pas de conteneur qui isole l'agent.
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
  ⚠️ Si vous avez installé Docker (<code>--with-docker</code>) : <strong>reconnectez-vous</strong> ou <code>newgrp docker</code> pour le groupe docker. Sinon, ignorez ce message.
</div>

---
layout: default
---

# Pi-mom Les Fadas — ce que ce build contient déjà 🦞

<div class="text-sm text-gray-600 mb-4 max-w-3xl leading-snug">

Vous installez le fork <strong>clawassistantgf-dev/pi-mono</strong> — build local au script&nbsp;2. Les points ci-dessous ne sont <strong>pas</strong> une feuille de route « à venir » : ils sont <strong>déjà livrés</strong> dans la version que vous compilez aujourd’hui.

</div>

<div class="grid grid-cols-2 gap-3 mt-4">

<v-click>
<div class="p-3 rounded-lg border border-gray-200">
  <div class="flex items-center gap-2 font-medium mb-1">
    <span class="text-xl">⏳</span>
    <span>Sabliers visibles dans Slack</span>
  </div>
  <div class="text-gray-500 text-xs">
    Pendant que l’agent travaille, vous voyez l’activité — moins de « est-ce qu’il a planté ? ».
  </div>
</div>
</v-click>

<v-click>
<div class="p-3 rounded-lg border border-gray-200">
  <div class="flex items-center gap-2 font-medium mb-1">
    <span class="text-xl">🚦</span>
    <span>File d’attente par fil de discussion</span>
  </div>
  <div class="text-gray-500 text-xs">
    Un flux ordonné par conversation : les messages sont traités proprement, dans l’ordre.
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
    Historique conservé entre les sessions pour enchaîner sur ce qui a déjà été fait.
  </div>
</div>
</v-click>

<v-click>
<div class="p-3 rounded-lg border border-gray-200">
  <div class="flex items-center gap-2 font-medium mb-1">
    <span class="text-xl">🔄</span>
    <span>Rechargement de SYSTEM.md</span>
  </div>
  <div class="text-gray-500 text-xs">
    Personnalité et règles : le fork est conçu pour intégrer les mises à jour de configuration sans friction manuelle.
  </div>
</div>
</v-click>

</div>

<div v-click class="mt-4 p-3 rounded-lg bg-blue-50 border border-blue-200 text-xs text-blue-800 max-w-3xl">

Sources : <code>github.com/clawassistantgf-dev/pi-mono</code> (fork) · upstream <code>github.com/badlogic/pi-mono</code>.

</div>

---
layout: default
---

# Étape 6 — pi /login (OAuth)

<div class="text-base leading-snug text-gray-600 mb-3">
  Votre agent rencontre son cerveau — flux commun à tous les providers.
</div>

```bash
pi
```

<div class="text-lg mt-2">
Ensuite taper <code>/login</code> puis choisir le fournisseur (ChatGPT, Gemini, **Copilot**, …).
</div>

<div class="mt-3 text-base text-gray-600 leading-snug">
  <strong>Résumé</strong> : URL du terminal → navigateur PC → redirection <strong>localhost</strong> dans la barre → recoller dans la session SSH où <code>pi</code> tourne.
</div>

<v-clicks>

<div class="mt-4 text-lg leading-snug space-y-3">

1. **Copier l’URL complète** affichée par pi (sans la tronquer).

2. Navigateur **sur votre PC** → connexion au provider → **Autoriser**.

3. Dans la barre d’adresse : copier <code>http://127.0.0.1:…</code> ou <code>http://localhost:…</code>.

4. **Coller dans le terminal SSH** où pi attend l’URL. Puis éventuellement <code>Ctrl+C</code>.

</div>

</v-clicks>

<div v-click class="mt-6 p-3 rounded-lg bg-blue-50 border border-blue-200 text-base leading-snug text-blue-900">
  Pas de clé API sur le VPS : OAuth + votre abonnement fournisseur.
</div>

---
layout: default
---

# Étape 6 — Copilot · modèle · ensuite

<div class="text-lg leading-relaxed">

<v-clicks>

**GitHub Copilot** (<code>github.com</code>)

- **a)** <em>GitHub Enterprise URL</em> : **vide** + **Entrée** pour le compte public standard.
- **b)** Copier **toute** l’URL OAuth du terminal (comme pour les autres logins).
- **c)** Après GitHub, reprendre l’URL **localhost / 127.0.0.1** du navigateur et la coller dans pi.

**Modèle & test**

- <code>Ctrl+L</code> : liste / choix du modèle (voir raccourcis en bas de pi).
- Une **question courte** pour valider que ça répond.

</v-clicks>

</div>

<div v-click class="mt-6 p-3 rounded-lg bg-amber-50 border border-amber-200 text-base leading-snug text-amber-900">
  → <strong>Étape&nbsp;7 — Script&nbsp;3</strong> : Slack, <code>.keys</code>, systemd… Vérifie <code>~/.pi/agent/auth.json</code> après <code>/login</code>.
</div>

---
layout: default
---

# Étape 7 — Script 3 : Configuration

```bash
curl -fsSL https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/03-configure.sh -o /tmp/ws-pi-mom-03-configure.sh && bash /tmp/ws-pi-mom-03-configure.sh
```

<div class="mt-4 space-y-2 text-sm max-w-3xl">

<p>Après avoir réussi <strong>pi</strong> + <code>/login</code>, le script&nbsp;3 demande le token Slack <strong>APP</strong>, le token Slack <strong>BOT</strong>, le fournisseur / modèle LLM et le <strong>nom</strong> de l’agent. <strong>Aucune</strong> question GitHub — c’est volontaire (voir <code>docs/MISSIONS.md</code> après l’atelier).</p>

</div>

<div v-click class="mt-4 flex flex-wrap gap-2 text-xs">
  <span class="px-2 py-1 rounded-full bg-green-100 text-green-700">.keys écrit</span>
  <span class="px-2 py-1 rounded-full bg-green-100 text-green-700">SYSTEM.md créé</span>
  <span class="px-2 py-1 rounded-full bg-green-100 text-green-700">structure projects/ missions/ tools/</span>
  <span class="px-2 py-1 rounded-full bg-green-100 text-green-700">git local + hook validate</span>
  <span class="px-2 py-1 rounded-full bg-green-100 text-green-700">systemd actif (pi-mom direct)</span>
</div>

---
layout: default
---

# Ce soir ou plus tard — GitHub <span class="text-gray-500 font-normal text-2xl">(optionnel)</span>

<div class="text-sm text-gray-600 mb-4 max-w-3xl leading-relaxed">

<strong>Ce n’est pas une « étape » du même genre</strong> que VPS ou Slack : c’est un <strong>bonus</strong> quand vous voudrez <strong>sauvegarder</strong> ou <strong>partager</strong> votre workspace hors du serveur.

</div>

<v-clicks>

<ul class="text-sm text-gray-700 list-disc pl-6 max-w-3xl space-y-2 text-left">

<li>Le script <strong>3</strong> ne pose <strong>aucune</strong> question GitHub — <strong>normal</strong>, ce n’est pas le critère de réussite du jour.</li>

<li>Vous créerez un repo (souvent <strong>privé</strong>), une <strong>clé SSH</strong>, un remote <code>git@github.com:…</code>, puis <code>git push</code> — guidé dans <code>docs/MISSIONS.md</code> avec LE J.</li>

<li><strong>Pas de push HTTPS</strong> sur ce parcours ; <code>.keys</code> et secrets <strong>jamais</strong> commités <em>(déjà exclus par <code>.gitignore</code>)</em>.</li>

</ul>

</v-clicks>

<div v-click class="mt-5 p-3 rounded-lg bg-amber-50 border border-amber-200 text-xs text-amber-900 max-w-3xl">

💡 Si vous n’avez <strong>jamais</strong> utilisé Git : ce n’est <strong>pas</strong> un prérequis pour dire bonjour à votre agent dans Slack — on le fait ensemble <strong>après</strong>, au calme.

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
    <div class="font-medium">Gardez pi-mom à jour (fork Les Fadas)</div>
    <div class="text-sm text-gray-500 mt-1">Ce n’est <strong>pas</strong> <code>npm install -g @mariozechner/pi-mom</code> (paquet upstream). Sur le VPS : <strong>relancer le script 2</strong> (même <code>curl</code> que l’atelier), puis <code>systemctl --user restart pi-mom</code> — voir <code>docs/UPDATE.md</code> sur le repo workshop.</div>
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

# Après l'atelier

---
layout: default
---

# Missions — la suite sur ton VPS

<v-clicks>

<ul class="text-sm space-y-4 max-w-3xl list-disc pl-6 text-left">

<li><strong>Personnaliser</strong> <code>SYSTEM.md</code> avec ton agent (Slack), puis <code>systemctl --user restart pi-mom</code>.</li>

<li><strong>GitHub comme nuage</strong> : pousser <code>~/agent-workspace</code> en <strong>SSH</strong> — sauvegarde, historique, accès depuis n’importe où. Étapes détaillées : <code>docs/MISSIONS.md</code> du repo workshop.</li>

<li><strong>Quand tout ça tourne</strong> → lance ton <strong>premier projet agentique</strong> : une mission claire dans Slack, travail sous <code>projects/&lt;nom&gt;/</code>, commits locaux puis <code>git push</code>.</li>

</ul>

</v-clicks>

<div v-click class="mt-6 text-sm text-gray-600 max-w-3xl leading-snug">

💡 Les **messages vocaux Slack** peuvent être **transcrits** par Slack selon ton workspace — inutile d’empiler un autre outil pour capturer une idée avant de la donner à l’agent.

</div>

---
layout: default
---

# Mises à jour sur le VPS

<div class="text-sm text-gray-700 max-w-3xl space-y-4 leading-relaxed">

<p><strong>Code <code>pi-mom</code> (fork)</strong> : derniers changements sur <code>github.com/clawassistantgf-dev/pi-mono</code> → sur le serveur, <strong>relancez le script 2</strong> — il resynchronise <code>~/pi-mono-fadas</code>, rebuild et réinstalle le CLI. Puis <code>systemctl --user restart pi-mom</code>.</p>

<p><strong>Scripts atelier uniquement</strong> (<code>01</code> / <code>02</code> / <code>03</code>) : même idée, <code>curl</code> depuis <code>raw.githubusercontent.com/…/workshop-pi-mom/main/</code> puis exécution.</p>

<p class="text-xs text-gray-500 mb-0">Guide complet : <strong><code>docs/UPDATE.md</code></strong> dans le dépôt workshop — pas besoin de publier sur le registre npm pour suivre notre fork.</p>

</div>

<pre class="text-xs bg-gray-50 border border-gray-200 rounded-lg p-3 mt-4 max-w-3xl text-left"><code>curl -fsSL https://raw.githubusercontent.com/clawassistantgf-dev/workshop-pi-mom/main/02-install.sh -o /tmp/ws-pi-mom-02-install.sh && bash /tmp/ws-pi-mom-02-install.sh</code></pre>

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
  <div class="font-medium text-red-900 mb-1">⚠️ Script 3 — service pi-mom inactif</div>
  <div class="text-sm text-red-800 mt-2">
    Vérifiez les logs et la config ; causes fréquentes : <code>.keys</code> manquant, <code>~/.pi/mom/auth.json</code>, ou lingering désactivé après déconnexion SSH.
  </div>
<pre class="text-xs bg-white rounded p-2 mt-2 border border-red-200"><code>tail -40 ~/.pi-mom.log
systemctl --user status pi-mom
loginctl show-user $USER | grep Linger    # doit afficher Linger=yes
# sinon : sudo loginctl enable-linger $USER && systemctl --user restart pi-mom</code></pre>
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
  <div>github.com/clawassistantgf-dev/workshop-pi-mom <span class="text-xs text-gray-400">— scripts + <code>docs/UPDATE.md</code> · <code>docs/MISSIONS.md</code></span></div>
  <div>github.com/clawassistantgf-dev/pi-mono <span class="text-xs text-gray-400">— pi-mom version Les Fadas</span></div>
  <div>github.com/badlogic/pi-mono <span class="text-xs text-gray-400">— pi-mono original (Mario Zechner)</span></div>
</div>

<div class="mt-6 text-sm text-gray-400">
  Le workspace Slack <strong>Les Fadas de l'IA</strong> reste actif.<br>
  @LeJ est là si vous avez des questions.
</div>
