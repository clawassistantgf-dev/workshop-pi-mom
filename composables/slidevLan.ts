/** Dev middleware path (voir vite.config.ts) */
export const SLIDEV_LAN_JSON = '/__fadas_lan.json'

/** Réponse JSON du middleware (serveur Slidev uniquement). */
export type SlidevLanPayload = {
  lanIPv4: string | null
  port: number
  /** Slides ouverts depuis les téléphones (même Wi‑Fi). */
  slideshowUrl: string | null
  /** Pilotage télécommande — `/entry/`. */
  remoteUrl: string | null
  localhostUrl: string
}

/** Parse sécurisé : Vite peut renvoyer du HTML avec statut 200 sur route inconnue. */
export async function fetchSlidevLan(): Promise<SlidevLanPayload | null> {
  try {
    const res = await fetch(SLIDEV_LAN_JSON, {
      credentials: 'same-origin',
      cache: 'no-store',
    })
    const text = await res.text()
    if (!text.trimStart().startsWith('{')) return null

    let data: SlidevLanPayload | null = null
    try {
      data = JSON.parse(text) as SlidevLanPayload
    } catch {
      return null
    }

    if (typeof data?.port !== 'number' || typeof data.localhostUrl !== 'string')
      return null

    return data
  } catch {
    return null
  }
}

export function normalizeShowUrl(raw: string): string {
  const t = raw.trim().replace(/\/+$/, '')
  return `${t}/`
}

/** PNG QR lisible avec marge tranquille dans l’API. */
export function buildShowQrSrc(slideshowUrl: string, px = 300): string {
  const url = slideshowUrl.endsWith('/') ? slideshowUrl : `${slideshowUrl}/`
  const encoded = encodeURIComponent(url)
  return `https://api.qrserver.com/v1/create-qr-code/?size=${px}x${px}&ecc=H&margin=26&bgcolor=ffffff&color=1f2937&format=png&data=${encoded}`
}
