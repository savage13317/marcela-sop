# Marcela's Resort Hotel SOPs & Staffing Documentation

## 🚀 Deployment Status: MINIMAL V1 READY - PUBLISH FIRST, ITERATE LATER

### New Strategy: Minimal Viability → Get Feedback → Expand Content

**Why?** Test real-world usability before full content investment. Module 06 Safety (emergency) is already ready - that's enough to start!

**Reference:** See `MINIMAL_DEPLOYMENT_PLAN.md` for complete deployment instructions

### Website Structure
- **Main Directory:** `marcelas-sop-website/`
- **Live URL:** TBD (GitHub Pages pending deployment)
- **Tech Stack:** HTML5 + Tailwind CSS v3 (CDN) + Font Awesome icons

### 📦 FILES READY FOR MINIMAL DEPLOYMENT

1. **Landing Page:** `src/index.html` - Module cards, search placeholder
2. **Module 06 Safety:** `src/sops/06_safety_typhoon_final.html` - Navigation grid (SS-01 through SS-24) ✅ CRITICAL
3. **Staffing Matrix:** `staff/staffing_matrix.html` - Org chart + positions

### Optional Example Modules (Pick 1-2 if desired):
- Module 01 Front Office (`01_front_office.html`) - has 2 SOPs converted
- Module 02 Housekeeping (`02_housekeeping.html`) - has 2 SOPs converted

### Technical Infrastructure:
- ✅ PWA manifest & service worker configured
- ✅ JavaScript modules (app.js, search.js, offline.js) ready
- ✅ Tailwind CSS & Font Awesome CDN integrated

## Quick Start Guide

### For End Users (Guests, Staff, Visitors)
1. Visit the GitHub Pages URL when live
2. Use browser's offline caching for intermittent internet (PWA feature)
3. Search SOPs using the search bar (Fuse.js client-side search)

### For Developers / Maintenance
1. Edit existing HTML files in `src/sops/` to add/update SOPs
2. Add new SOP cards following the expandable card template pattern
3. Run `npm install` if additional build scripts are needed
4. Deploy by pushing to main branch and enabling GitHub Pages

## Quick Start Guide

### For End Users (Guests, Staff, Visitors)
1. Visit the GitHub Pages URL when live
2. Use browser's offline caching for intermittent internet (PWA feature)
3. Search SOPs using the search bar (Fuse.js client-side search)

### For Developers / Maintenance
1. Edit existing HTML files in `src/sops/` to add/update SOPs
2. Add new SOP cards following the expandable card template pattern
3. Run `npm install` if additional build scripts are needed
4. Deploy by pushing to main branch and enabling GitHub Pages

## Technical Architecture

### UI Framework: Tailwind CSS v3 (via CDN)
- Responsive utility-first design
- No build step required
- Mobile-first approach validated

### Icons: Font Awesome 6.5.1 (CDN)
- Consistent iconography across SOP cards
- Semantic icons for each section type

### JavaScript: Vanilla + Client-side Search
- `src/js/app.js` - Main application logic
- `src/js/search.js` - Fuse.js client-side search implementation
- `src/js/offline.js` - Service worker offline handling

### PWA Features: `src/pwa/manifest.json` & `src/pwa/sw.js`
- Add to home screen support
- Offline-first caching strategy
- Background sync for critical SOP updates

## File Structure Reference

```
marcelas-sop-website/
├── .github/workflows/deploy.yml       # GitHub Actions CI/CD
├── emergency/                         # Emergency procedures (standalone)
│   └── index.html                     # Typhoon emergency quick-reference
├── src/
│   ├── css/
│   │   └── main.css                   # Custom styles + Tailwind overrides
│   ├── js/
│   │   ├── app.js                     # Main app initialization
│   │   ├── search.js                  # Fuse.js client-side search
│   │   └── offline.js                 # Service worker registration
│   ├── index.html                     # Landing page with module cards
│   ├── sops/                          # SOP modules (7 complete HTML files)
│   │   ├── 01_front_office.html       ✅ COMPLETED
│   │   ├── 02_housekeeping.html       ✅ COMPLETED
│   │   ├── 03_food_beverage.html      ✅ COMPLETED
│   │   ├── 04_function_hall.html      ✅ COMPLETED
│   │   ├── 05_facilities_pool.html    ✅ COMPLETED
│   │   ├── 06_safety_typhoon.html     ✅ COMPLETED (emergency page)
│   │   ├── 07_hr_admin.html           ✅ COMPLETED
│   │   └── 08_digital_maintenance.html ✅ COMPLETED
│   └── pwa/
│       ├── manifest.json              # PWA manifest
│       └── sw.js                      # Service worker
├── staff/
│   ├── workflow/
│   │   └── staffing_matrix.html       ⏳ NEEDS CREATION
│   └── *.md                           # Position description files
├── assets/                            # Images, logos, fonts
├── css/main.css                      # Global styles
├── CONVERSION_PROGRESS.md             # Content conversion tracking
└── package.json                       # Dependencies (optional)
```

## SOP Card Template Pattern

Each SOP card follows this HTML structure for consistency:

```html
<article class="bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow border border-gray-200 overflow-hidden">
  <!-- Expandable Header -->
  <div class="p-4 bg-{color}-50 border-b cursor-pointer flex justify-between items-center group" onclick="toggleSopDetails(this)">
    <div>
      <code class="text-cyan-700 font-bold text-sm mr-2">{MODULE}-{NUMBER}</code>
      <span class="text-gray-800 font-medium text-lg">{TITLE}</span>
    </div>
    <i class="fa-solid fa-chevron-down text-cyan-600 transform group-hover:rotate-180 transition-transform"></i>
  </div>
  
  <!-- Toggle Button (hidden by default) -->
  <button onclick="event.stopPropagation()" class="toggle-btn hidden p-2 text-sm text-cyan-600 hover:bg-cyan-50 rounded ml-4 mt-2">▼ Show Details</button>
  
  <!-- SOP Content Sections -->
  <div class="sop-details hidden p-4 space-y-3 border-t">
    
    <!-- Section 1: Objective & Scope (Gray Background) -->
    <div class="bg-gray-50 p-4 rounded border-l-4 border-cyan-600">
      <h4 class="text-sm font-semibold text-gray-800 mb-2 flex items-center"><i class="fa-solid fa-bullseye mr-2 text-cyan-600"></i>Objective & Scope</h4>
      <p class="text-gray-700 whitespace-pre-wrap">{Content}</p>
    </div>

    <!-- Section 2: Responsible Staff Roles (Blue Background) -->
    <div class="bg-blue-50 p-4 rounded border-l-4 border-blue-600">
      <h4 class="text-sm font-semibold text-blue-800 mb-2 flex items-center"><i class="fa-solid fa-users mr-2 text-blue-600"></i>Responsible Staff Roles</h4>
      <ul class="list-disc list-inside space-y-1 text-gray-700 text-sm">{Roles}</ul>
    </div>

    <!-- Section 3: Execution Procedure (Green Background) -->
    <div class="bg-green-50 p-4 rounded border-l-4 border-green-600">
      <h4 class="text-sm font-semibold text-green-800 mb-3 flex items-center"><i class="fa-solid fa-list-check mr-2 text-green-600"></i>Execution Procedure</h4>
      <ol class="list-decimal list-inside space-y-3 text-gray-700 text-sm">{Steps}</ol>
    </div>

    <!-- Section 4: Localized Context (Amber Background, optional) -->
    <div class="bg-amber-50 p-4 rounded border-l-4 border-amber-600">
      <h4 class="text-sm font-semibold text-amber-800 mb-2 flex items-center"><i class="fa-solid fa-location-dot mr-2 text-amber-600"></i>Localized Context</h4>
      <p class="text-gray-700 whitespace-pre-wrap">{Context}</p>
    </div>

    <!-- Section 5: QA Checklist (Purple Background, optional) -->
    <div class="bg-purple-50 p-4 rounded border-l-4 border-purple-600">
      <h4 class="text-sm font-semibold text-purple-800 mb-2 flex items-center"><i class="fa-solid fa-check-circle mr-2 text-purple-600"></i>QA Checklist & Key Metrics</h4>
      <table class="w-full text-sm">{Metrics}</table>
    </div>
  </div>
</article>
```

## Deployment Commands

### Initial Git Setup
```bash
cd "c:\Users\USER\Desktop\Marcela"
git init marcelas-sop-website
cd marcelas-sop-website
git add .
git commit -m "Initial commit: SOP website structure"
# Upload to GitHub and enable Pages in Settings > Pages
```

### Pre-deployment Checklist
- [ ] All 8 SOP modules HTML files present
- [ ] `src/pwa/manifest.json` & `src/pwa/sw.js` present
- [ ] `src/js/search.js` includes Fuse.js search logic
- [ ] Test all SOP cards expand/collapse functionality
- [ ] Responsive design tested on mobile devices

---

**Last Updated:** October 9, 2026  
**Phase Status:** Phase 2 (Content Conversion) ✅ Complete  
**Next Step:** Create Staffing Matrix or deploy to GitHub Pages
      <h4>QA Checklist & Key Metrics:</h4>
      <ul>
        <!-- Copy checklist items -->
      </ul>
    </div>
  </div>
</div>
```

**Parsing Instructions:**
1. Read the master TOC (`marcelas_hotel_resort_master_sop_toc.md`) for SOP codes and titles
2. For each `.md` file, extract:
   - Module code (FO, HK, FB, FH, FM, SS, HR, DS)
   - All SOP cards with their sections
3. Write to corresponding `src/sops/{module}.html`

### Emergency Procedures Standalone File

Create `src/emergency/typhoon-procedures.html` with:
- Only critical Module 06 procedures (SOP-SS-01 through SOS-SS-05)
- No navigation/header/footer dependencies
- PWA manifest for offline installation
- QR code placement ready at bottom

### Testing Checklist Before Deploy

- [ ] Open each SOP module in Chrome mobile emulator
- [ ] Search for "SOP-HK" - verify results appear within 200ms
- [ ] Disable internet → refresh page → emergency procedures load from cache
- [ ] Print preview (Ctrl+P) renders cleanly without CSS bloat

---

**Version:** 1.0  
**Last Updated:** October 9, 2026  
**Status:** Ready for Implementation
