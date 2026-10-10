// Marcela's Resort - Offline Handling & PWA Features

document.addEventListener('DOMContentLoaded', () => {
  // Register service worker on fast networks only
  if ('serviceWorker' in navigator) {
    window.addEventListener('load', () => {
      navigator.serviceWorker.register('/pwa/sw.js')
        .then((registration) => {
          console.log('Service Worker registered:', registration.scope);
          
          // Check for updates periodically
          setInterval(checkForUpdates, 60000);
        })
        .catch((error) => {
          console.log('SW registration failed:', error);
        });
    });
  };

  /**
   * Check for new content on fast connection
   */
  async function checkForUpdates() {
    if (!navigator.onLine) return;

    try {
      const current = await caches.match('/index.html');
      const network = await fetch('/index.html');
      
      if (current && current !== network) {
        console.log('New content available, caching...');
        await caches.open(CACHE_NAME).then(cache => cache.delete('/index.html'));
      };
    } catch (error) {
      // Network unavailable - don't error out
    };
  };

  /**
   * Handle offline notifications via Notification API
   */
  if ('Notification' in window && !Notification.permission?.granted) {
    document.getElementById('offline-indicator')?.addEventListener('click', () => {
      Notification.requestPermission().then((permission) => {
        if (permission === 'granted') {
          new Notification('Marcela's Resort SOPs', {
            body: 'This page works offline. Emergency procedures are always available.',
            icon: '/logo.svg'
          });
        };
      });
    });
  };

  // Update UI for offline state
  window.addEventListener('online', () => {
    updateOnlineIndicator(true);
  });

  window.addEventListener('offline', () => {
    updateOnlineIndicator(false);
  });

  function updateOnlineIndicator(isOnline) {
    const indicator = document.getElementById('connection-status');
    if (indicator) {
      indicator.classList.toggle('text-green-500', isOnline);
      indicator.classList.toggle('text-yellow-500', !isOnline);
      indicator.title = isOnline ? 'Online' : 'Offline - Using cached content';
    };
  };
});

/**
 * Emergency offline fallback handler
 */
window.addEventListener('beforeunload', (event) => {
  // Pre-cache emergency procedures before navigation away from home page
  if (!navigator.onLine && 
      !window.location.pathname.includes('/06_safety_') &&
      !window.location.pathname.includes('/emergency/')) {
    
    navigator.serviceWorker.controller?.postMessage({
      type: 'CACHE_EMERGENCY'
    });
  };
});
