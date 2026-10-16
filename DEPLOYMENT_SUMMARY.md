# 🚀 Marcela's Resort Hotel SOP Website — Deployment Summary

## ✅ Deployment Status: LIVE

**Live URL:** <https://savage13317.github.io/marcela-sop/>
**Deploy mechanism:** GitHub Pages via `.github/workflows/deploy.yml` (`actions/upload-pages-artifact`, path `'.'`) + `git push origin main`.

---

## 📦 What Is Deployed

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

---

## 🎯 Features Included

### ✅ Core Functionality
- **Responsive Design** — desktop, tablet, mobile (Tailwind CSS v3 via CDN, no build step).
- **Client-side Search** — `src/js/search.js` powers the landing-page search bar.
- **PWA Support** — installable app with offline-first caching (`src/pwa/sw.js`).
- **Emergency Access** — direct link to Module 06 safety/typhoon procedures.
- **Staffing Matrix** — `staffing_matrix.html` maps ST-01 → ST-09 positions to supervisors and modules.

### ✅ Technical Features
- Tailwind CSS v3 (CDN-based, no build step).
- Font Awesome 6.5.1 icons (CDN).
- Service Worker for offline-first experience (registered by `offline.js` with root scope).
- GitHub Actions CI/CD pipeline.

---

## 🌐 Access

```
https://savage13317.github.io/marcela-sop/
```

---

## 📋 How To Deploy

1. Commit and push to `main`:
   ```
   npm run deploy      # git add . && git commit -m "Update SOPs" && git push origin main
   ```
2. GitHub Pages serves the site automatically (workflow uploads the repo root as the artifact).
3. Regenerate icons if the logo changes:
   ```
   node tools/gen-icons.js
   ```

---

## 📱 How Users Access

### For staff & management
1. Open the GitHub Pages URL on any device.
2. Search SOPs or browse by department.
3. **Optional:** install as a PWA for offline access.

### For emergency access (typhoon season)
- Direct link: `06_safety_typhoon_final.html`
- Contains critical procedures (SS-01 through SS-24).
- Pre-cached by the Service Worker, so it loads offline during storms/grid-power outages.

---

## 🧰 Cleanup Performed
- Removed dead files: `app.js`, root `manifest.json`, root `sw.js`, `src/index.html`, `src/js/sop-cards.js`.
- Reconciled `README.md`, `PROJECT_README.md`, `DEPLOYMENT_SUMMARY.md` to the actual layout.
- Removed unused `fuse.js` / `@tailwindcss/forms` deps from `package.json`.
- Generated real PNG app icons (72–512 px) replacing 1×1 placeholders.
- Created `staffing_matrix.html` (9 position cards) mirroring the front-office pattern.
