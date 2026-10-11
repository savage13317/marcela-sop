# Master AI Execution Plan: Standardized Refactoring & Upgrading (Modules 02–08)

## 1. Executive Summary & Core Objective

This document serves as the standardized Master AI Execution Plan to refactor, upgrade, and structure all operational HTML modules (**`02_housekeeping.html`** through **`08_digital_maintenance.html`**) for Marcela's Resort Hotel in Gamay, Northern Samar.

The target of this execution plan is to bring every remaining HTML module up to 100% parity with the architectural standards established in **`01_front_office.html`**. This includes adding interactive Quick Jump navigation, uniform 5-part SOP card components, standardized collapse/expand state handlers, auto-scroll JavaScript triggers, clean structured data tables, and local operational context—all with **Zero Content Loss**.

---

## 2. Master Module Mapping Table (Modules 02–08)

| Module # | Module Name | Code Prefix | File Name | Primary Scope Summary | Critical / Emergency SOPs |
| :---: | :--- | :---: | :--- | :--- | :--- |
| **02** | Housekeeping & Laundry Operations | `HK` | `02_housekeeping.html` | Room cleaning, linen care, public area sanitation, deep cleaning schedules | `SOP-HK-21` (Pest), `SOP-HK-22` (Chemical Safety), `SOP-HK-24` (Typhoon) |
| **03** | Food & Beverage Operations | `FB` | `03_food_beverage.html` | Restaurant, kitchen, bar, food safety, inventory, POS operations | `SOP-FB-12` (Sanitation), `SOP-FB-17` (Cold Chain), `SOP-FB-20` (Food Safety Incident) |
| **04** | Function Hall & Events | `FH` | `04_function_hall.html` | Event bookings, setups, AV configuration, catering coordination | `SOP-FH-08` (AV Setup), `SOP-FH-18` (Damage/Loss), `SOP-FH-19` (Reset) |
| **05** | Facilities, Engineering & Pool | `FM` | `05_facilities_pool.html` | Generator, solar, plumbing, preventive maintenance, pool chemical safety | `SOP-FM-08` (Generator), `SOP-FM-19` (Pool Chem), `SOP-FM-25` (Drowning Response) |
| **06** | Safety, Security & Typhoon Readiness | `SS` | `06_safety_typhoon.html` | Fire evacuation, security incidents, brownouts, typhoon levels, emergency command | `SOP-SS-03` (Fire Alarm), `SOP-SS-08` (Pool Incident), `SOP-SS-15` through `SOP-SS-20` (Typhoon) |
| **07** | Human Resources & Administration | `HR` / `AD` | `07_hr_admin.html` | Hiring, payroll, grooming, purchasing, inventory, government compliance | `SOP-HR-14` (Safety), `SOP-AD-07` (Petty Cash), `SOP-AD-12` (Permit Compliance) |
| **08** | Digital Systems, Records & Maintenance | `DS` | `08_digital_maintenance.html` | PMS, POS, Starlink/LTE monitoring, CCTV, backup, data privacy, website SOP update | `SOP-DS-08` (Wi-Fi/Network), `SOP-DS-14` (Backup), `SOP-DS-16` (Cybersecurity) |

---

## 3. Strict Architectural Specifications & Code Templates

Every target file from `02_housekeeping.html` to `08_digital_maintenance.html` must follow the exact code structures defined below.

### Standard 1: Module Header & Quick Jump Procedure Buttons Bar
Inside the main container, the header card must include a dynamic flex container containing jump buttons for **every SOP** present in the module. Emergency or safety-critical SOPs must use red warning styling.

```html
<div class="bg-gradient-to-r from-indigo-50 to-blue-50 rounded-lg shadow-sm p-6 mb-6 border-l-4 border-indigo-600">
    <h1 class="text-2xl font-bold text-indigo-900 mb-2 flex items-center">
        <i class="fa-solid [MODULE-ICON] mr-3 text-indigo-600"></i>Module [XX]: [MODULE TITLE]
    </h1>
    <p class="text-gray-700 text-base">
        [Module Description detailing scope, department workflows, and operational context.]
    </p>

    <!-- Quick Jump Procedure Navigation Bar -->
    <div class="mt-4 pt-4 border-t border-indigo-200">
        <h3 class="text-xs font-bold uppercase tracking-wider text-indigo-800 mb-2 flex items-center">
            <i class="fa-solid fa-bolt mr-1 text-indigo-600"></i>Quick Jump to Procedure:
        </h3>
        <div class="flex flex-wrap gap-1.5" id="quickNavButtons">
            <!-- Standard SOP Button Template -->
            <button onclick="jumpToSop('sop-[prefix]-01')" class="px-2.5 py-1 text-xs font-semibold bg-white text-indigo-700 hover:bg-indigo-600 hover:text-white border border-indigo-200 rounded shadow-xs transition">
                SOP-[PREFIX]-01: [Short Title]
            </button>
            
            <!-- Emergency/Critical SOP Button Template (Red Alert Styling) -->
            <button onclick="jumpToSop('sop-[prefix]-XX')" class="px-2.5 py-1 text-xs font-semibold bg-red-50 text-red-700 hover:bg-red-600 hover:text-white border border-red-200 rounded shadow-xs transition">
                SOP-[PREFIX]-XX: [Critical Procedure]
            </button>
        </div>
    </div>
</div>
```

---

### Standard 2: 5-Part Collapsible SOP Card Component Structure
Every individual procedure must be rendered as an `<article>` with a target `id` matching its SOP code (e.g., `id="sop-hk-01"`). The details section **must start hidden** (`sop-details hidden`).

```html
<article id="sop-[prefix]-XX" class="bg-white rounded-lg shadow-sm hover:shadow-md transition-all border border-gray-200 overflow-hidden mb-4">
    <!-- Interactive Clickable Card Header -->
    <div class="p-4 bg-indigo-50 border-b cursor-pointer flex justify-between items-center group" onclick="toggleSopDetails(this)">
        <div class="flex items-center">
            <code class="text-indigo-700 font-bold text-sm mr-2">[SOP-[PREFIX]-XX]</code>
            <span class="text-gray-900 font-semibold text-lg">[FULL PROCEDURE TITLE]</span>
        </div>
        <div class="flex items-center gap-2">
            <button onclick="event.stopPropagation(); toggleSopDetails(this.closest('.p-4'))" class="toggle-btn px-4 py-2 text-sm font-medium text-indigo-700 bg-indigo-100 hover:bg-indigo-200 rounded transition">
                ▼ Show Details
            </button>
            <i class="fa-solid fa-chevron-down text-indigo-600 transform transition-transform duration-200"></i>
        </div>
    </div>

    <!-- Collapsible SOP Details Content Wrapper (Hidden by default) -->
    <div class="sop-details hidden p-4 space-y-3 border-t">
        
        <!-- 1. Objective & Scope -->
        <div class="bg-gray-50 p-4 rounded border-l-4 border-indigo-600">
            <h4 class="font-bold text-gray-900 flex items-center mb-2">
                <i class="fa-solid fa-bullseye text-indigo-600 mr-2"></i>1. Objective & Scope
            </h4>
            <p class="text-gray-700 text-sm">[Detailed purpose, goals, and applicable operational scope.]</p>
        </div>

        <!-- 2. Responsible Staff Roles -->
        <div class="bg-blue-50 p-4 rounded border-l-4 border-blue-600">
            <h4 class="font-bold text-gray-900 flex items-center mb-2">
                <i class="fa-solid fa-users text-blue-600 mr-2"></i>2. Responsible Staff Roles
            </h4>
            <ul class="list-disc list-inside text-gray-700 text-sm space-y-1">
                <li><strong>Primary Role:</strong> [Role name & key duties]</li>
                <li><strong>Supervisory Role:</strong> [Managerial oversight responsibilities]</li>
            </ul>
        </div>

        <!-- 3. Execution Procedure -->
        <div class="bg-green-50 p-4 rounded border-l-4 border-green-600">
            <h4 class="font-bold text-gray-900 flex items-center mb-2">
                <i class="fa-solid fa-list-check text-green-600 mr-2"></i>3. Execution Procedure
            </h4>
            <ol class="list-decimal list-inside text-gray-700 text-sm space-y-2">
                <li><strong>Step 1:</strong> [Step description]</li>
                <li><strong>Step 2:</strong> [Step description]</li>
            </ol>
        </div>

        <!-- 4. Localized Context (Gamay, Northern Samar) -->
        <div class="bg-amber-50 p-4 rounded border-l-4 border-amber-600">
            <h4 class="font-bold text-gray-900 flex items-center mb-2">
                <i class="fa-solid fa-location-dot text-amber-600 mr-2"></i>4. Localized Context (Gamay, Northern Samar)
            </h4>
            <p class="text-gray-700 text-sm">
                [Local infrastructure constraints, SAMELCO I power grid notes, PAGASA Signal protocols, Starlink/LTE failovers, or local vendor suppliers.]
            </p>
        </div>

        <!-- 5. QA Checklist & Key Metrics -->
        <div class="bg-purple-50 p-4 rounded border-l-4 border-purple-600">
            <h4 class="font-bold text-gray-900 flex items-center mb-2">
                <i class="fa-solid fa-check-circle text-purple-600 mr-2"></i>5. QA Checklist & Key Metrics
            </h4>
            <ul class="list-disc list-inside text-gray-700 text-sm space-y-1">
                <li><strong>Quality Standard:</strong> [Expected qualitative result]</li>
                <li><strong>Target SLA / KPI:</strong> [Quantitative metric or time SLA]</li>
            </ul>
        </div>

    </div>
</article>
```

---

### Standard 3: Standardized JavaScript Control Logic
Placed directly before the closing `</body>` tag, this script enables toggle states, icon rotation, automatic card expansion during jump navigation, and smooth scrolling with temporary highlight rings.

```html
<script>
/**
 * Toggles the expanded/collapsed state of an SOP card details section.
 * @param {HTMLElement} header - The card header or child element clicked.
 */
function toggleSopDetails(header) {
    const card = header.closest('article');
    if (!card) return;
    
    const details = card.querySelector('.sop-details');
    const chevron = card.querySelector('.fa-chevron-down, .fa-chevron-up');
    const toggleBtn = card.querySelector('.toggle-btn');
    
    if (details) {
        const isHidden = details.classList.contains('hidden');
        if (isHidden) {
            details.classList.remove('hidden');
            if (chevron) chevron.classList.add('rotate-180');
            if (toggleBtn) toggleBtn.textContent = '▲ Hide Details';
        } else {
            details.classList.add('hidden');
            if (chevron) chevron.classList.remove('rotate-180');
            if (toggleBtn) toggleBtn.textContent = '▼ Show Details';
        }
    }
}

/**
 * Auto-expands, scrolls to, and highlights a targeted SOP card via Quick Jump.
 * @param {string} sopId - The element ID of the target SOP article.
 */
function jumpToSop(sopId) {
    const card = document.getElementById(sopId);
    if (!card) return;
    
    const header = card.querySelector('.p-4.bg-indigo-50');
    const details = card.querySelector('.sop-details');

    // Automatically expand card if currently collapsed
    if (details && details.classList.contains('hidden')) {
        toggleSopDetails(header);
    }

    // Smooth scroll to the SOP card header
    card.scrollIntoView({ behavior: 'smooth', block: 'start' });

    // Apply temporary focus highlight ring
    card.classList.add('ring-4', 'ring-indigo-400');
    setTimeout(() => {
        card.classList.remove('ring-4', 'ring-indigo-400');
    }, 2000);
}
</script>
```

---

### Standard 4: Master Module Summary Table
Positioned at the bottom of the page, directly above the module footer.

```html
<div class="mt-10 bg-white rounded-lg shadow-sm border border-gray-200 p-6">
    <h3 class="text-xl font-bold text-indigo-900 mb-4 flex items-center">
        <i class="fa-solid fa-table-list mr-2 text-indigo-600"></i>Module [XX] Summary Table
    </h3>
    <div class="overflow-x-auto">
        <table class="w-full text-left text-sm text-gray-700 border-collapse">
            <thead class="bg-indigo-50 text-indigo-900 uppercase font-semibold text-xs border-b">
                <tr>
                    <th class="py-3 px-4">SOP Code</th>
                    <th class="py-3 px-4">Procedure Title</th>
                    <th class="py-3 px-4">Primary Responsible Role</th>
                    <th class="py-3 px-4">Key SLA / KPI Metric</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-200">
                <!-- Data row repeated for each SOP -->
                <tr class="hover:bg-gray-50">
                    <td class="py-2.5 px-4 font-bold text-indigo-700">SOP-[PREFIX]-01</td>
                    <td class="py-2.5 px-4 text-gray-900 font-medium">[Title]</td>
                    <td class="py-2.5 px-4 text-gray-700">[Primary Role]</td>
                    <td class="py-2.5 px-4 text-gray-600">[Key Metric / SLA]</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
```

---

## 4. Step-by-Step Refactoring Workflow for Any Module

When tasked with generating or refactoring a module (`02_housekeeping.html` through `08_digital_maintenance.html`), execute the process following these 6 steps:

```
[Step 1: Data Extraction] -> [Step 2: Container & Quick Jump Setup] -> [Step 3: Component Conversion] 
                          -> [Step 4: JS Integration] -> [Step 5: Table & Footer] -> [Step 6: Audit]
```

### Step 1: Data Extraction & Audit
* Read the source markdown SOP file corresponding to the module.
* Inventory every SOP code, title, role, procedure, local context, and metric.
* Ensure **Zero Content Loss**—no step or local detail (e.g., SAMELCO I power line issues, PAGASA signal levels, Starlink backups) may be truncated.

### Step 2: Container & Header Construction
* Create the standardized document shell with top navigation.
* Insert the Module Description Card.
* Build the Quick Jump Navigation Bar containing buttons for every SOP in the module. Assign red button styles to emergency/safety SOPs.

### Step 3: Card Component Transformation
* Convert every raw markdown SOP section into an `<article>` card using the exact 5-section layout (Objective, Roles, Procedure, Localized Context, QA/Metrics).
* Verify each card has a unique lowercase `id="sop-[prefix]-xx"`.
* Confirm the wrapper has `class="sop-details hidden p-4 space-y-3 border-t"`.

### Step 4: JavaScript & Interaction Layer
* Embed `toggleSopDetails` and `jumpToSop` scripts before `</body>`.
* Ensure `onclick` handlers on card headers and quick jump buttons correctly point to matching element IDs.

### Step 5: Summary Table & Regional Footer
* Render the Master Module Summary Table mapping all SOPs to their primary roles and key SLAs.
* Append the standard resort footer displaying Marcela's Resort Hotel branding, Gamay location badges, and operational status indicators.

### Step 6: QA & Code Verification Checklist
* [ ] **Syntax:** Are all HTML tags closed cleanly without markdown residual formatting?
* [ ] **Interactivity:** Do all Quick Jump buttons successfully auto-expand and scroll to target cards?
* [ ] **Collapsibility:** Do cards start collapsed by default and open smoothly upon interaction?
* [ ] **Local Context:** Are Gamay, Northern Samar, SAMELCO I, MDRRMO, and local weather references fully preserved?
* [ ] **Completeness:** Is every single SOP accounted for in both the Quick Jump bar and the Summary Table?

---

## 5. Execution Summary Matrix

By following this master plan, all modules from **`02_housekeeping.html`** to **`08_digital_maintenance.html`** will achieve uniform styling, high performance, mobile-first responsiveness, and complete operational utility for Marcela's Resort Hotel staff.