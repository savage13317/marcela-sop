// Marcela's Resort - Service Worker for Offline/PWA Support

const CACHE_NAME = 'marcelas-sops-v1';
const STATIC_ASSETS = [
  '/',
  '/index.html',
  '/pwa/manifest.json',
  '/css/main.css',
  '/js/app.js',
  '/js/search.js',
  '/js/offline.js',
  '/sops/06_safety_typhoon.html'  // Critical emergency procedures always cached
];

// Install Event - Cache static assets
self.addEventListener('install', (event) => {
  console.log('[SW] Installing service worker...');
  
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then((cache) => {
        console.log('[SW] Caching static assets');
        return cache.addAll(STATIC_ASSETS);
      })
      .then(() => self.skipWaiting())
  );
});

// Activate Event - Clean old caches
self.addEventListener('activate', (event) => {
  console.log('[SW] Service worker activated');
  
  event.waitUntil(
    caches.keys()
      .then((keys) => {
        return Promise.all(
          keys.filter(key => key !== CACHE_NAME)
            .map(key => caches.delete(key))
        );
      })
      .then(() => self.clients.claim())
  );
});

// Fetch Event - Network First, Then Cache Strategy
self.addEventListener('fetch', (event) => {
  const { request } = event;
  const url = new URL(request.url);

  // Don't intercept third-party CDN requests
  if (!url.hostname.includes(url.origin)) {
    return;
  };

  event.respondWith(
    caches.match(request)
      .then((response) => {
        if (response) {
          console.log('[SW] Serving from cache:', request.url);
          return response;
        };

        // Network request
        return fetch(request)
          .then((response) => {
            // Cache successful responses
            if (!response || response.status !== 200 || response.type === 'error') {
              return response;
            };

            // Clone the request to read from cache in parallel with network
            const fetchPromise = fetch(request);
            const cachePromise = caches.open(CACHE_NAME)
              .then((cache) => cache.put(request, response.clone()));

            return Promise.all([fetchPromise, cachePromise]);
          })
          .catch((error) => {
            console.log('[SW] Network request failed:', error.message);
            
            // Try offline fallback - especially for Module 06 (safety)
            if (request.url.includes('06_safety') || 
                request.headers.get('accept')?.includes('text/html')) {
              
              return caches.match('/sops/06_safety_typhoon.html');
            };

            // Return offline fallback for other pages
            return caches.match(request) || caches.match('/');
          });
      })
  );
});

console.log('[SW] Service worker loaded');