# Plan: Deploy Marcela's Resort Hotel SOPs & Staffing to Git Pages Website

## TL;DR
Deploy a static, PWA-enabled website on GitHub Pages hosting 147 SOPs across 8 modules, 11 core + 16-20 on-call staffing documentation, with offline-first design for Gamay, Northern Samar's intermittent internet. Convert `.md` source to responsive HTML using Tailwind CSS, implement client-side search and emergency protocol quick-access, configure CI/CD auto-deploy from main branch.

## Background & Context
**Property:** Marcela's Resort Hotel (30 rooms, restaurant, function hall, pool)  
**Location:** Gamay, Northern Samar, Philippines (coastal province, intermittent internet)  
**Existing Content:** 8 SOP modules with 147+ SOPs, staffing plans with org chart image, position descriptions for 11 core + on-call pool

## Critical Constraints
- **Internet Reliability:** Starlink primary + 4G LTE backup; local landline unreliable during typhoons
- **Offline Need:** Critical emergency procedures (Module 06) must be immediately accessible even offline
- **Mobile Access:** Field staff (HK, F&B, Pool) need responsive design on mobile devices
- **Print-Friendly:** Some SOPs may need printed hard copies for reference

## Technical Architecture Decisions

### Recommended Stack (Option A - RECOMMENDED)
1. **Hosting:** GitHub Pages (free, reliable, Git-native)
2. **Static Site Generation:** Pre-built HTML with Tailwind CSS via CDN
3. **PWA Features:** Service worker for offline caching of critical SOPs
4. **Search:** Client-side JavaScript (Fuse.js or Alfred) for instant local search
5. **Version Control:** Git tags per SOP revision date for audit trail

### Alternative Options
- **Option B (Lower Cost):** Plain HTML without PWA, static site only
- **Option C (Higher Features):** Jekyll/Hugo for auto-rendering markdown (adds build complexity)

## Complete Implementation Steps with Dependencies

### Phase 1: Repository Setup & Infrastructure (Days 1-2)
**Dependencies:** None
**Parallel Tasks:**

#### Step 1.1: Create GitHub Repository
1. Navigate to `c:\Users\USER\Desktop\Marcela` on local machine
2. Create new folder: `marcelas-sop-website`
3. Initialize Git repo with initial commit containing:
   - `README.md` (deployment instructions)
   - `.gitignore` (exclude node_modules, build outputs)
   - `package.json` (empty or minimal scripts)

#### Step 1.2: Enable GitHub Pages
1. In GitHub repo Settings > Pages
2. Set source branch to `main` at root `/`
3. Note Pages URL: `https://<username>.github.io/marcelas-sop-website/`

#### Step 1.3: Create Base HTML Template
Create `src/index.html` with responsive Tailwind CSS structure (see plan.md in session memory for detailed code)

#### Step 1.4: Create Supporting Files
- `src/css/main.css` - Custom styles
- `src/js/app.js` - Navigation and search logic
- `src/js/search.js` - Client-side search implementation
- `.github/workflows/deploy.yml` - CI/CD for auto-deploy on push

### Phase 2: Content Migration & Conversion (Days 3-7)
**Dependencies:** Step 1.4 complete
**Parallel Tasks:** Convert SOP modules and staffing docs simultaneously

#### Step 2.1: SOP Module Conversion Strategy
For each `.md` file in `SOPS/` folder, convert to responsive HTML:

1. **Module 01 (Front Office - 24 SOPs):**
   - Source: `module_01_front_office_guest_services_operations_manual.md`
   - Output: `src/sops/01_front_office.html`
   - Extract SOP list from table of contents
   - Create individual SOP cards with expandable details

2. **Module 02 (Housekeeping - 24 SOPs):**
   - Source: `module_02_housekeeping_laundry_sops.md`
   - Output: `src/sops/02_housekeeping.html`

3. **Module 03 (Food & Beverage - 26 SOPs):**
   - Source: `module_03_food_beverage_operations_sops.md`
   - Output: `src/sops/03_food_beverage.html`

4. **Module 04 (Function Hall):**
   - Source: `module_04_function_hall_events.md`
   - Output: `src/sops/04_function_hall.html`

5. **Module 05 (Facilities & Pool):**
   - Source: `module_05_facilities_engineering_swimming_pool.md`
   - Output: `src/sops/05_facilities_pool.html`

6. **Module 06 (Safety & Typhoon - CRITICAL):**
   - Source: `module_06_safety_security_typhoon_preparedness.md`
   - Output: `src/sops/06_safety_typhoon.html`
   - Add "Emergency Access" button that bypasses navigation

7. **Module 07 (HR & Administration):**
   - Source: `module_07_human_resources_and_administration.md`
   - Output: `src/sops/07_hr_admin.html`

8. **Module 08 (Digital Systems):**
   - Source: `module_08_digital_systems_records_maintenance.md`
   - Output: `src/sops/08_digital_maintenance.html`

#### Step 2.2: Staffing Documentation Conversion
Convert staffing `.md` files to standalone pages:

1. **Staffing Matrix:**
   - Source: `Final_staffing_plan.md`, `marcelas_hotel_resort_staffing_plan.md`
   - Output: `src/staff/staffing_matrix.html`
   - Include org chart diagram

2. **Position Detail Pages (Optional):**
   - Create `/staff/positions/` subdirectory with individual position cards

#### Step 2.3: Emergency Procedures Standalone Page
Create `src/emergency/typhoon-procedures.html` as a lightweight PWA-ready single file for offline access. Contains only critical Module 06 procedures.

#### Step 2.4: Asset Preparation
- Use Font Awesome CDN for icons (avoids local storage needs)
- Create SVG logo/favicon if needed

### Phase 3: Technical Features Implementation (Days 5-9)
**Dependencies:** Content conversion started (can be parallel with Step 2)

#### Step 3.1: PWA Manifest & Service Worker
Create `src/pwa/manifest.json` for app-like experience
Create `src/pwa/sw.js` service worker for offline caching using cache-first strategy

#### Step 3.2: Client-Side Search Implementation
Implement Fuse.js or Alfred search library in `src/js/search.js`:
- Index all SOP titles and codes
- Support fuzzy search for typos
- Highlight matches in results
- Debounced input to avoid excessive re-indexing

#### Step 3.3: Navigation & Routing
Implement tab-based navigation with hash routing:
- Home/Overview section
- SOP modules as tabs/cards
- Staffing matrix section
- Emergency access link in footer/header

#### Step 3.4: Print Styles
Add `@media print` CSS rules to generate print-friendly versions of SOP pages.

### Phase 4: Testing & Optimization (Days 10-12)
**Dependencies:** Content complete, PWA features implemented

#### Step 4.1: Functional Testing Checklist
- [ ] All 8 SOP modules load without errors
- [ ] Search returns results for partial SOP codes (e.g., "SOP-HK")
- [ ] Navigation tabs work on mobile viewport (< 768px)
- [ ] Emergency procedures accessible without internet
- [ ] Print preview renders correctly
- [ ] Back/forward browser navigation preserves state

#### Step 4.2: Performance Testing
- [ ] Load time < 3 seconds on 3G connection
- [ ] Images lazy-load properly
- [ ] Service worker caches static assets
- [ ] No console errors or warnings in DevTools

#### Step 4.3: Cross-Browser Testing
Test on:
- Chrome/Edge (desktop + mobile)
- Safari (iOS) - critical for Philippines iOS adoption
- Firefox (fallback)

### Phase 5: Deployment & Go-Live (Days 13-15)
**Dependencies:** All testing passed

#### Step 5.1: Pre-Deployment Checklist
- [ ] Run build script or manually commit all changes
- [ ] Update GitHub Pages source to `main` branch root
- [ ] Verify HTTPS is enabled
- [ ] Review GitHub Pages URL for custom domain (if needed)

#### Step 5.2: Deploy to GitHub Pages
- Push final commit to `main` branch
- Trigger GitHub Pages build
- Wait ~3-5 minutes for deployment
- Verify site accessible at `https://<username>.github.io/marcelas-sop-website/`

#### Step 5.3: Post-Deployment Validation
- [ ] Site loads on mobile device
- [ ] Emergency procedures accessible offline (test with airplane mode)
- [ ] All SOPs viewable without errors
- [ ] Search functionality operational

### Phase 6: Monitoring & Maintenance Setup (Day 16+)

#### Step 6.1: CI/CD Workflow
Create `.github/workflows/deploy.yml` for automated deployment on push to main branch

#### Step 6.2: Version Tagging Strategy
- Tag releases with format: `sops-v1.0.0`
- Include SOP revision date in release notes
- Create changelog documenting updates

#### Step 6.3: Content Update Protocol
Document in README.md how to:
- Add new SOP to existing module
- Create standalone emergency update file
- Rebuild and redeploy site

## Relevant Files & Directories

### Source Content (Local)
```
c:\Users\USER\Desktop\Marcela\SOPS\
  ├── marcela_s_resort_hotel_sop_manual.html
  ├── marcelas_hotel_resort_master_sop_toc.md
  ├── module_01_front_office_guest_services_operations_manual.md
  ├── module_02_housekeeping_laundry_sops.md
  ├── module_03_food_beverage_operations_sops.md
  ├── module_04_function_hall_events.md
  ├── module_05_facilities_engineering_swimming_pool.md
  ├── module_06_safety_security_typhoon_preparedness.md
  ├── module_07_human_resources_and_administration.md
  └── module_08_digital_systems_records_maintenance.md

c:\Users\USER\Desktop\Marcela\Staffing\
  ├── Final_staffing_plan.md
  ├── Marcela_Hotel_Resort_Lean_Staffing_Organizational_Plan.md
  ├── marcelas_hotel_resort_staffing_plan.md
  ├── org chart.jpg (or embed diagram)
  └── pos_01_general_manager.md through POS-03, combo positions/
```

### Target Repository Structure (GitHub Pages)
```
marcelas-sop-website/
├── .github/
│   └── workflows/
│       └── deploy.yml
├── src/
│   ├── index.html                    # Landing page
│   ├── sops/
│   │   ├── 01_front_office.html      # Module 01 (24 SOPs)
│   │   ├── 02_housekeeping.html      # Module 02 (24 SOPs)
│   │   ├── 03_food_beverage.html     # Module 03 (26 SOPs)
│   │   ├── 04_function_hall.html     # Module 04
│   │   ├── 05_facilities_pool.html   # Module 05
│   │   ├── 06_safety_typhoon.html    # Module 06 (EMERGENCY)
│   │   ├── 07_hr_admin.html          # Module 07
│   │   └── 08_digital_maintenance.html # Module 08
│   ├── staff/
│   │   ├── staffing_matrix.html      # Staffing overview
│   │   └── org_chart/
│   │       └── chart.jpg
│   ├── emergency/
│   │   └── typhoon-procedures.html   # Standalone offline access
│   ├── assets/
│   │   ├── css/
│   │   │   └── main.css
│   │   ├── js/
│   │   │   ├── app.js               # Main navigation
│   │   │   ├── search.js            # Client-side search
│   │   │   └── offline.js           # PWA offline handlers
│   │   └── pwa/
│   │       ├── manifest.json        # PWA manifest
│   │       └── sw.js                # Service worker
│   └── favicon.ico, logo.svg
├── package.json                     # Scripts and dependencies
├── README.md                       # Deployment instructions
└── .gitignore                      # Git ignore rules
```

## Verification Checklist (Pre-Production)

### Content Completeness
- [ ] All 8 SOP modules present in `src/sops/` directory
- [ ] Module 06 has "Emergency Access" button prominently displayed
- [ ] Staffing matrix shows all 11 core positions + on-call roster
- [ ] Org chart diagram included and accessible
- [ ] Each SOP card displays code, title, brief description

### Technical Requirements
- [ ] Site loads in all major browsers (Chrome, Safari, Edge)
- [ ] Mobile responsive design validated (< 768px width)
- [ ] Search returns results within 200ms
- [ ] Service worker caches static resources
- [ ] Offline mode works with cached SOP pages
- [ ] Print preview generates clean layouts

### Accessibility (WCAG 2.1 AA)
- [ ] Proper heading hierarchy (h1-h6)
- [ ] Alt text on all images
- [ ] Color contrast ratio > 4.5:1
- [ ] Keyboard navigable navigation
- [ ] Screen reader compatible

## Decision Options & Tradeoffs

### Option A: Pure Static HTML + PWA (RECOMMENDED)
**Pros:**
- Zero server dependencies or costs
- Fastest load times
- Easiest security model (no database vulnerabilities)
- Git version control works perfectly

**Cons:**
- Content updates require manual file editing or scripted conversion
- No built-in analytics without third-party scripts

**Best For:** Marcela's Resort given need for offline reliability and simple architecture

### Option B: Jekyll/Hugo Static Site Generator
**Pros:**
- Can automatically render markdown files to HTML
- Version-friendly workflow from `.md` source

**Cons:**
- Requires build step (increases complexity)
- Larger site payload
- More GitHub Actions configuration needed

**Tradeoff:** Adds build pipeline but automates `.md` → HTML conversion

### Option C: CMS-Based (WordPress, etc.)
**Pros:**
- Easy content editing without code
- Built-in analytics, search plugins

**Cons:**
- Not suitable for GitHub Pages (requires external hosting)
- Security vulnerabilities from updates
- Slower load times
- Violates offline-first principle

**Recommendation:** Avoid unless ownership transfers to managed host

### Emergency Access Strategy Options

1. **Direct Link Bypass** (Recommended): Module 06 always visible in footer/header, separate URL path `/emergency/` that loads even if main site is compromised.

2. **QR Code Physical Copies**: Generate static QR codes linking to emergency procedures for placement in staff rooms, pool area, lobby.

3. **PDF Exports**: Critical SOPs (fire evacuation, typhoon response) also available as downloadable PDFs for offline printing.

**Recommendation:** Use Option 1 + Option 2 combination for redundancy.

## Risk Mitigation Strategies

### Internet Outage Scenario
- [ ] Emergency procedures cached locally via service worker
- [ ] Critical SOPs (Module 06) pre-cached on device installation
- [ ] QR codes provided for physical access to backup PDF links

### Content Accuracy Concerns
- [ ] Version tags include SOP revision dates
- [ ] Git history maintains full audit trail of changes
- [ ] Release notes document each update with date, author, SOPs modified

### Data Privacy (Personal Information)
- [ ] Review all SOPs for PII (guest names, staff contacts)
- [ ] Redact or anonymize sensitive contact information
- [ ] Ensure compliance with Philippines Data Privacy Act of 2012

## Rollback Plan
If deployment fails:
1. Keep previous commit tagged as `sops-v1.0.0`
2. Revert to tagged commit using `git revert <commit-hash>`
3. GitHub Pages automatically redeloys previous version
4. Document issue and resolution in changelog

## Success Metrics (Post-Launch)
- [ ] 100% of staff can access SOPs within 5 minutes of training
- [ ] Zero incidents from missing/incorrect procedure documentation
- [ ] Emergency procedures accessible during internet outage
- [ ] Monthly content update cycle < 4 hours per module

## Next Steps & Immediate Actions
1. **Create GitHub repository today (Day 1)** - Folder already created at `marcelas-sop-website/`
2. **Upload all starter files to GitHub** - All templates now in place (`package.json`, `.gitignore`, `src/index.html`, etc.)
3. **Begin converting SOP Module 06 first (critical safety content)** - Template HTML already created at `src/sops/06_safety_typhoon.html`
4. **Implement remaining SOP modules** - Copy `06_safety_typhoon.html` pattern, paste content from source `.md` files using the extraction template in README.md

---

## ✅ Plan Review Summary

### Is This Comprehensive? YES ✅
- All 8 SOP modules accounted for
- Staffing documentation covered
- Emergency procedures standalone file specified
- PWA/offline requirements fully addressed
- Testing checklists provided
- Risk mitigation strategies included

### Is This AI-Agent Doable? YES ✅ (Now)
Previously needed code templates, but now all starter files created:
- [x] `src/index.html` - Base template with Tailwind CSS
- [x] `src/js/app.js` - Navigation and routing logic
- [x] `src/js/search.js` - Client-side Fuse.js search implementation
- [x] `src/js/offline.js` - PWA offline handling
- [x] `src/css/main.css` - Print styles, responsive design
- [x] `src/pwa/manifest.json` - PWA manifest
- [x] `src/pwa/sw.js` - Service worker for offline caching
- [x] `.github/workflows/deploy.yml` - CI/CD GitHub Actions workflow
- [x] `package.json` - Scripts and dependencies
- [x] `.gitignore` - Git ignore rules
- [x] `src/sops/06_safety_typhoon.html` - Emergency SOPs template
- [x] `README.md` - Deployment instructions and SOP card extraction template

### What the AI Agent Needs to Do Next:
1. Read each source `.md` file from `c:\Users\USER\Desktop\Marcela\SOPS/`
2. Extract SOP codes, titles, and section content using pattern in README.md
3. Generate HTML files for remaining 7 modules (`01_front_office.html` through `08_digital_maintenance.html`)
4. Convert staffing documents to `/staff/staffing_matrix.html`
5. Push all changes to GitHub repository
6. Enable GitHub Pages in repo settings
7. Test offline functionality with airplane mode

---

**Document Status:** ✅ COMPLETE - Ready for AI Agent Execution  
**Author:** Copilot Agent  
**Date Generated:** October 9, 2026  
**Last Updated:** All code templates added - plan now executable  
**Review Due:** N/A - Ready for implementation begins immediately
