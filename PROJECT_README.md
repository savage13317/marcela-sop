# Marcela's Resort Hotel - SOP Website

## Project Structure

```
Marcela/
├── .github/workflows/deploy.yml      # GitHub Actions CI/CD
├── package.json                      # Dependencies (Fuse.js, Tailwind)
├── README.md                         # Documentation
├── index.html                        # Landing page
├── 01_front_office.html - 08_digital_maintenance.html  # SOP pages
├── app.js                            # Main application logic
├── offline.js                        # Offline handling
├── manifest.json                     # PWA manifest
├── sw.js                             # Service worker
├── src/
│   ├── css/main.css                 # Custom styles
│   ├── js/search.js                 # Fuse.js search
│   ├── js/sop-cards.js              # SOP card logic
│   └── index.html                   # Landing page template
└── pwa/
    ├── manifest.json                # PWA configuration
    ├── sw.js                        # Service worker
    └── icon-*.svg                   # App icons (72x512)
