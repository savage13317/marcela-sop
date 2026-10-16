# Marcela's Resort Hotel — SOPs & Staffing Documentation

Static Progressive Web App (PWA) documenting the Standard Operating Procedures (SOPs) and staffing matrix for **Marcela's Resort Hotel**, Gamay, Northern Samar, Philippines.

- **Live URL:** <https://savage13317.github.io/marcela-sop/>
- **Tech Stack:** HTML5 + Tailwind CSS v3 (CDN) + Font Awesome 6.5.1 (CDN) — no build step.
- **PWA:** installable, offline-first via a Service Worker (`src/pwa/sw.js`).

## 📦 Site Structure (actual)

```
marcela-sop/
├── index.html                       # Landing page — module cards + search
├── staffing_matrix.html             # Staffing matrix + organization chart (9 positions)
├── 01_front_office.html             # Module 01 — Front Office (FO)
├── 02_housekeeping.html             # Module 02 — Housekeeping (HK)
├── 03_food_beverage.html            # Module 03 — Food & Beverage (FB)
├── 04_function_hall.html            # Module 04 — Function Hall (FH)
├── 05_facilities_pool.html          # Module 05 — Facilities & Pool (FM)
├── 06_safety_typhoon_final.html     # Module 06 — Safety & Typhoon (S)  ⚠ EMERGENCY
├── 07_hr_admin.html                 # Module 07 — HR & Administration (HR)
├── 08_digital_maintenance.html      # Module 08 — Digital Systems (DS)
├── offline.js                       # Page script: registers the Service Worker (root scope)
├── package.json                     # Deploy helper (git add/commit/push)
├── .github/workflows/deploy.yml     # GitHub Pages deploy (upload-pages-artifact, path '.')
├── src/
│   ├── css/main.css                 # Shared styles + Tailwind overrides
│   ├── js/search.js                 # Client-side search (index.html search bar)
│   └── pwa/
│       ├── manifest.json            # PWA manifest (relative start_url + icon paths)
│       ├── sw.js                    # Service Worker — offline-first cache
│       └── icon-*.png               # App icons (72–512 px)
├── tools/
│   ├── gen-icons.js                 # Regenerates the PNG app icons (Node, no deps)
│   └── verify-staffing.js           # Sanity-checks staffing_matrix.html
└── Staffing/                        # Source notes: position .md files + org chart
```

> **Scope note:** the Service Worker lives at `src/pwa/sw.js`. A SW's default scope is its own directory, so `offline.js` registers it with an explicit `scope` of the site root — otherwise it could not cache the module pages. The manifest's `start_url` is relative (`../../index.html`) so it resolves to the root.

## 🚀 Quick Start

### For end users (staff, guests, management)
1. Open the GitHub Pages URL on any device.
2. Browse by module or use the search bar on the landing page.
3. **Optional:** install as a PWA for offline access. Module 06 (Safety/Typhoon) and the staffing page are pre-cached, so they survive internet/grid-power outages.

### For developers / maintenance
1. Edit the relevant `NN_module.html` to add or update SOP cards (follow the expandable-card template).
2. Add new SOP cards using the existing `<article id="sop-...">` pattern with `toggleSopDetails` / `jumpToSop`.
3. Deploy by pushing to `main`; GitHub Pages serves the site automatically.

## 🛠 Deploy

```
npm run deploy      # git add . && git commit -m "Update SOPs" && git push origin main
```

Regenerate icons after editing the logo:

```
node tools/gen-icons.js
```

## 🧑 Staffing Matrix

`staffing_matrix.html` maps every operational position (ST-01 General Manager → ST-09 IT Administrator) to its supervising authority and primary SOP module. Source position notes live in `Staffing/`.

## 📱 PWA / Offline

- **Manifest:** `src/pwa/manifest.json` — theme `#06b6d4`, standalone display, 72–512 px icons.
- **Service Worker:** `src/pwa/sw.js` — cache-first, network+store, offline fallback to the emergency page for navigation requests.
- **Registration:** `offline.js` registers `src/pwa/sw.js` with root scope on page load.

---
**Last Updated:** after full structural cleanup (dead files removed, docs reconciled).
