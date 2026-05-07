<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import type { SlidevLanPayload } from '../composables/slidevLan'
import {
  buildShowQrSrc,
  fetchSlidevLan,
  normalizeShowUrl,
} from '../composables/slidevLan'

const envUrl = (import.meta.env.VITE_SLIDE_FOLLOW_URL as string | undefined)
  ?.trim()
  ?? ''

const lanPayload = ref<SlidevLanPayload | null>(null)
const loading = ref(true)

/** Manual override from .env.local wins; else auto LAN from dev server. */
const followUrl = computed(() => {
  if (envUrl && /^https?:\/\//i.test(envUrl)) return normalizeShowUrl(envUrl)
  const fromLan = lanPayload.value?.slideshowUrl
  return fromLan ?? null
})

const qrSrc = computed(() => {
  const u = followUrl.value
  return u ? buildShowQrSrc(u, 380) : null
})

const usedEnv = computed(
  () => Boolean(envUrl && /^https?:\/\//i.test(envUrl)),
)

onMounted(async () => {
  loading.value = true
  try {
    lanPayload.value = await fetchSlidevLan()
  } finally {
    loading.value = false
  }
})
</script>

<template>
  <div class="rounded-2xl border border-gray-200 bg-gray-50/80 p-4 md:p-5">
    <div v-if="loading" class="text-sm text-gray-600 py-2">
      Lecture de l’adresse du serveur…
    </div>

    <div
      v-else-if="!followUrl || !qrSrc"
      class="text-sm leading-relaxed text-amber-900 space-y-2"
    >
      <p class="font-medium">Impossible d’afficher le QR automatiquement</p>
      <p class="text-xs text-gray-700 leading-relaxed">
        Démarrez la prés avec <code class="rounded bg-white px-1 py-0.5 text-xs border border-gray-200">npx slidev slides/slides.md --remote</code>
        puis ouvrez le deck sur la slide d’intro (le QR s’affiche tout seul), ou créez un override
        <code class="rounded bg-white px-1 py-0.5 text-xs border border-gray-200">.env.local</code>
        comme dans <code class="rounded bg-white px-1 py-0.5 text-xs border border-gray-200">.env.example</code>.
      </p>
    </div>

    <div v-else class="grid md:grid-cols-2 gap-6 items-start">
      <div class="space-y-3 text-sm text-gray-700">
        <p class="font-semibold text-gray-900">
          Pour suivre depuis votre téléphone
        </p>
        <ul class="list-disc pl-4 space-y-1 text-xs leading-relaxed">
          <li>Même réseau <strong>Wi‑Fi</strong> que la salle.</li>
          <li>Ouvrir l’URL ou scanner le QR (gardez le cadre blanc visible).</li>
        </ul>
        <p
          v-if="usedEnv"
          class="text-xs text-amber-800 bg-amber-50 rounded-lg px-2 py-1 border border-amber-200"
        >
          URL fournie via <code class="font-mono">VITE_SLIDE_FOLLOW_URL</code> (.env.local) — prévaut sur la détection auto.
        </p>
        <a
          :href="followUrl"
          class="break-all rounded-lg bg-white border border-gray-200 px-3 py-2 font-mono text-xs text-blue-700 hover:bg-blue-50 block"
          target="_blank"
          rel="noopener noreferrer"
        >{{ followUrl }}</a>
        <p class="text-xs text-gray-500 pt-1">
          Détection automatique via le serveur Slidev lorsque vous n’avez pas de <code>.env.local</code>.
        </p>
      </div>

      <div class="flex flex-col items-center">
        <div
          class="rounded-3xl bg-white p-5 md:p-6 shadow-lg border border-gray-100 shrink-0 max-w-sm pb-8"
        >
          <img
            :src="qrSrc"
            alt="QR code pour ouvrir la présentation sur le réseau local"
            width="290"
            height="290"
            class="block mx-auto rounded-xl bg-white shadow-inner"
            style="width: min(72vw, 290px); max-width: 290px; height: auto"
            loading="lazy"
          >
          <p class="mt-4 text-xs text-gray-500 text-center leading-snug px-2">
            Scannez en gardant toute la marge blanche dans le cadre.
          </p>
        </div>
      </div>
    </div>
  </div>
</template>
