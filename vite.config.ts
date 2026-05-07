import os from 'node:os'
import type { IncomingMessage } from 'node:http'
import type { Plugin } from 'vite'
import { defineConfig } from 'vite'

/** Dev middleware path — évite tout conflit avec les routes Slidev `/__slidev/…`. */
const LAN_JSON_PATH = '/__fadas_lan.json'

function pickLanIPv4(): string | null {
  const nets = os.networkInterfaces()
  const candidates: string[] = []
  for (const entries of Object.values(nets)) {
    if (!entries) continue
    for (const net of entries) {
      if (net.internal) continue
      const isV4 =
        typeof net.family === 'string'
          ? net.family === 'IPv4'
          : Number(net.family) === 4
      if (!isV4) continue
      const { address } = net
      if (address === '127.0.0.1') continue
      /** Link-local peu fiable pour un scan QR depuis la salle */
      if (address.startsWith('169.254.')) continue
      candidates.push(address)
      if (/^192\.168\.\d+\.\d+$/.test(address)) return address
      if (/^10\.\d+\.\d+\.\d+$/.test(address)) return address
      if (/^172\.(1[6-9]|2\d|3[01])\.\d+\.\d+$/.test(address)) return address
    }
  }
  return candidates[0] ?? null
}

function pathnameOnly(req: IncomingMessage): string {
  const u = req.url?.split(/[?#]/)[0] ?? ''
  if (u.length > 1 && u.endsWith('/')) return u.slice(0, -1)
  return u || '/'
}

/** Serves LAN URLs as JSON — doit tourner très tôt dans la pile des middlewares. */
function slidevWorkshopLanPlugin(): Plugin {
  return {
    name: 'slidev-workshop-lan-json',
    enforce: 'pre',
    configureServer(server) {
      server.middlewares.use((req, res, next) => {
        if (req.method !== 'GET') {
          return next()
        }
        if (pathnameOnly(req) !== LAN_JSON_PATH) {
          return next()
        }

        let port = 3030
        const addr = server.httpServer?.address()
        if (addr && typeof addr === 'object' && typeof addr.port === 'number') {
          port = addr.port
        }

        const lan = pickLanIPv4()
        const slideshowUrl = lan !== null ? `http://${lan}:${port}/` : null
        const remoteUrl = lan !== null ? `http://${lan}:${port}/entry/` : null
        const localhostUrl = `http://127.0.0.1:${port}/`

        const body = JSON.stringify({
          lanIPv4: lan,
          port,
          slideshowUrl,
          remoteUrl,
          localhostUrl,
        })

        res.setHeader('Content-Type', 'application/json; charset=utf-8')
        res.setHeader('Cache-Control', 'no-store')
        res.statusCode = 200
        res.end(body)
      })
    },
  }
}

export default defineConfig({
  plugins: [slidevWorkshopLanPlugin()],
})
