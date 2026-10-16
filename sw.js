// Marcela's Resort Hotel - Service Worker (offline-first caching)
// Lives at the site ROOT so its default scope covers every page.
// Bump CACHE_NAME when site content changes so cached copies refresh.
const CACHE_NAME = 'marcelas-sop-v1';

// Critical pages pre-cached on activation (paths relative to site root)
const PRECACHE_PATHS = [
  'index.html',
  '06_safety_typhoon_final.html',
  '01_front_office.html',
  'staffing_matrix.html',
  'src/css/main.css',
  'src/js/search.js',
  'offline.js'
];

function precache() {
  return caches.open(CACHE_NAME).then(function (cache) {
    return Promise.all(PRECACHE_PATHS.map(function (path) {
      var request = new Request(new URL(path, self.registration.scope));
      return fetch(request).then(function (response) {
        if (response.ok) {
          return cache.put(request, response.clone());
        }
      });
    }));
  });
}

// Pre-cache critical pages whenever this service worker script loads
precache().catch(function () {});

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (keys) {
      return Promise.all(keys.filter(function (key) {
        return key !== CACHE_NAME;
      }).map(function (key) {
        return caches.delete(key);
      }));
    }).then(function () {
      return self.clients.claim();
    })
  );
});

self.addEventListener('fetch', function (event) {
  var requestUrl = new URL(event.request.url);

  // Let cross-origin CDN assets pass through untouched
  if (requestUrl.origin !== self.location.origin) {
    return;
  }

  event.respondWith(
    caches.match(event.request).then(function (cached) {
      if (cached) {
        return cached;
      }
      return fetch(event.request).then(function (response) {
        if (response && response.ok) {
          caches.open(CACHE_NAME).then(function (cache) {
            cache.put(event.request, response.clone());
          });
        }
        return response;
      }).catch(function () {
        // Offline fallback: emergency procedures for navigation requests
        if (event.request.mode === 'navigate') {
          return caches.match(new Request(new URL('06_safety_typhoon_final.html', self.registration.scope)))
            .then(function (emergency) {
              if (emergency) {
                return emergency;
              }
              return new Response(
                'Offline - this page has not been cached yet.',
                { status: 503, headers: { 'Content-Type': 'text/plain' } }
              );
            });
        }
        return new Response(
          'Offline - subresource not cached.',
          { status: 503, headers: { 'Content-Type': 'text/plain' } }
        );
      });
    })
  );
});
