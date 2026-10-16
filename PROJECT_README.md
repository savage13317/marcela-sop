# Marcela's Resort Hotel — Project Structure

Quick reference for the repository layout. See `README.md` for the full guide.

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

## Notes
- **No build step.** Tailwind CSS v3 and Font Awesome 6.5.1 load from CDN.
- **Service Worker scope:** `src/pwa/sw.js` is registered by `offline.js` with an explicit root `scope` so it can cache every page (a SW's default scope is its own directory).
- **Manifest paths are relative** to `src/pwa/` (`start_url: ../../index.html`, icons `icon-*.png`).
- **Search** is implemented in `src/js/search.js` (loaded by `index.html`); the search input id is `search-input`.
- **SOP card interactions** (`toggleSopDetails`, `jumpToSop`) are inline per page — there is no shared `sop-cards.js`.
