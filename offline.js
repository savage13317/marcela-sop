// Marcela's Resort - Offline Handling & PWA Features
// Registers the service worker (src/pwa/sw.js) so offline caching actually activates.

(function () {
  'use strict';

  if (!('serviceWorker' in navigator)) {
    return;
  }

  window.addEventListener('load', function () {
    // The Service Worker lives at the site ROOT (sw.js) so its default scope
    // covers every page. Registering relative to the page origin makes it
    // resolve correctly on GitHub Pages sub-paths (e.g. /marcela-sop/).
    navigator.serviceWorker.register(new URL('sw.js', location.href))
      .then(function (registration) {
        console.log('[Offline] Service Worker registered. Scope:', registration.scope);
      })
      .catch(function (error) {
        console.log('[Offline] Service Worker registration failed:', error);
      });
  });

  // Reflect online/offline state in the UI (indicator element is optional).
  function updateOnlineIndicator(online) {
    var indicator = document.getElementById('connection-status');
    if (!indicator) return;
    indicator.classList.toggle('text-green-500', online);
    indicator.classList.toggle('text-yellow-500', !online);
    indicator.title = online ? 'Online' : 'Offline - Using cached content';
  }

  window.addEventListener('online', function () { updateOnlineIndicator(true); });
  window.addEventListener('offline', function () { updateOnlineIndicator(false); });
})();
