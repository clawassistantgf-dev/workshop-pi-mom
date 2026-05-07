<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { buildShowQrSrc, fetchSlidevLan } from '../composables/slidevLan'

const payload = ref<Awaited<ReturnType<typeof fetchSlidevLan>>>(null)
const loading = ref(true)

/** URL de la fenêtre où tourne Slidev — toujours dispo après mount. */
const browserBaseUrl = ref('')

const showUrlFromServer = computed(() => payload.value?.slideshowUrl ?? null)
const localhostFromServer = computed(() => payload.value?.localhostUrl ?? null)

/** Si tu ouvres déjà depuis une IP LAN (pas localhost), même URL pour les téléphones. */
function hostLooksLikeIpv4(hostname: string): boolean {
  return /^\d{1,3}(?:\.\d{1,3}){3}$/.test(hostname)
}

const effectivePhoneUrl = computed(() => {
  if (showUrlFromServer.value) return showUrlFromServer.value
  if (!browserBaseUrl.value) return null
  try {
    const u = new URL(browserBaseUrl.value)
    if (hostLooksLikeIpv4(u.hostname)) return browserBaseUrl.value
  } catch {
    return null
  }
  return null
})

const qrSrc = computed(() => {
  const u = effectivePhoneUrl.value
  return u ? buildShowQrSrc(u, 168) : null
})

/** localhost / lien signalé — utile depuis une origin en IP différente. */
const presenterCopyUrl = computed(() => {
  if (localhostFromServer.value) return localhostFromServer.value
  if (typeof window === 'undefined') return ''
  const port = window.location.port || '3030'
  return `http://127.0.0.1:${port}/`
})

/** Pour ne pas répéter une URL déjà affichée en vert « principale ». */
const sameUrlNormalized = (
  a: string | null | undefined,
  b: string | null | undefined,
): boolean =>
  (a ?? '').replace(/\/+$/, '/') === (b ?? '').replace(/\/+$/, '/')

const showLanHintFoot = computed(() => {
  const p = presenterCopyUrl.value
  if (!p) return false
  return !sameUrlNormalized(effectivePhoneUrl.value ?? null, p)
})

/** Réafficher « ce navigateur » seulement s’il diffère du lien vert. */
const showBrowserSubtitle = computed(() => {
  const b = browserBaseUrl.value
  const main = effectivePhoneUrl.value ?? ''
  return Boolean(b && main && !sameUrlNormalized(b, main))
})

onMounted(async () => {
  if (typeof window !== 'undefined') {
    browserBaseUrl.value = `${window.location.origin}/`
  }

  loading.value = true
  try {
    payload.value = await fetchSlidevLan()
  } finally {
    loading.value = false
  }
})
</script>

<template>
  <div
    class="mt-5 pt-5 border-t border-gray-200/80 w-full max-w-5xl mx-auto text-left pb-10 overflow-visible mb-4"
  >
    <p class="text-xs font-semibold text-gray-700 mb-2 leading-tight">
      Suivre sur votre téléphone (même Wi‑Fi que la salle)
    </p>

    <div v-if="loading" class="text-xs text-gray-500 py-1">
      Détection du serveur…
    </div>

    <div
      v-else-if="effectivePhoneUrl && qrSrc"
      class="flex flex-col sm:flex-row sm:items-start gap-4 sm:gap-6 pt-1"
    >
      <div
        class="rounded-2xl bg-white px-3 py-3 shadow-md border border-gray-100 shrink-0 self-center sm:self-start"
      >
        <img
          :src="qrSrc"
          alt="QR code slides réseau local"
          width="168"
          height="168"
          class="block mx-auto rounded-md bg-white"
          style="width: 168px; height: 168px; object-fit: contain"
          loading="lazy"
        >
      </div>
      <div class="flex-1 min-w-0 space-y-2">
        <p class="text-xs text-gray-600 leading-snug">
          Scanner ou ouvrir le lien sur le téléphone (Wi‑Fi salle uniquement sans 4G).
        </p>
        <a
          :href="effectivePhoneUrl"
          target="_blank"
          rel="noopener noreferrer"
          class="break-all rounded-lg bg-emerald-50 border border-emerald-200 px-3 py-2 font-mono text-xs text-emerald-900 hover:bg-emerald-100 transition-colors w-full max-w-lg block leading-snug"
        >{{ effectivePhoneUrl }}</a>
        <p
          v-if="showLanHintFoot"
          class="text-xs text-gray-500 leading-snug"
        >
          <span v-if="showBrowserSubtitle">
            Ce navigateur&nbsp;: <strong class="font-mono text-gray-600">{{ browserBaseUrl }}</strong>
            <br>
          </span>
          localhost (réglages sur ce Mac)&nbsp;:
          <strong class="font-mono text-gray-600">{{ presenterCopyUrl }}</strong>
        </p>
      </div>
    </div>

    <div
      v-else
      class="rounded-xl bg-amber-50 border border-amber-200 px-4 py-3 text-sm text-amber-950 space-y-3"
    >
      <p class="font-medium">
        Pas d’adresse LAN détectée pour un QR automatique
      </p>
      <p class="text-xs leading-relaxed text-amber-900">
        Méthodes rapides :
      </p>
      <ol class="list-decimal text-xs leading-relaxed pl-5 space-y-1">
        <li>
          Lancez <code class="rounded bg-white/80 px-1">npx slidev slides/slides.md --remote -o</code>
          puis ouvrez le deck avec l’URL <strong>sous forme IP</strong> affichée par Slidev dans le terminal
          (<code class="rounded bg-white/80 px-1">http://192.168.x.x:3030/</code>), pas uniquement «&nbsp;localhost&nbsp;».
        </li>
        <li>
          macOS (Wi‑Fi) : <code class="rounded bg-white/80 px-1">ipconfig getifaddr en0</code> — remplacez
          <strong>192.168.x.x</strong> dans
          <code class="rounded bg-white/80 px-1">http://&lt;cette‑IP&gt;:3030/</code> sur le téléphone.
        </li>
      </ol>
      <p
        v-if="browserBaseUrl"
        class="text-xs pt-2 border-t border-amber-200 text-gray-800"
      >
        <strong>Ouvert dans ce navigateur&nbsp;:</strong>
        <a
          class="break-all font-mono text-emerald-800 underline block mt-1"
          :href="browserBaseUrl"
        >{{ browserBaseUrl }}</a>
      </p>
      <p
        v-if="presenterCopyUrl"
        class="text-xs leading-relaxed border-t border-amber-200 pt-2"
      >
        <strong>Sur cette machine (boucle locale)</strong>&nbsp;: <strong class="font-mono">{{ presenterCopyUrl }}</strong>
      </p>
      <p
        v-if="!payload && browserBaseUrl"
        class="text-xs text-gray-600 leading-snug"
      >
        Si le problème persiste après <strong>F5</strong>, vérifiez que
        <code class="rounded bg-white/80 px-1">vite.config.ts</code> est bien dans le même dossier que
        les slides puis redémarrez Slidev.
      </p>
    </div>
  </div>
</template>
