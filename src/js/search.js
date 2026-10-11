function initSearch() {
    const searchInput = document.getElementById('search-input');
    if (!searchInput) return;

    // Comprehensive index of modules and key SOP items derived from source documentation
    const searchIndex = [
        {
            title: "Module 01: Front Office",
            category: "Front Office (FO)",
            url: "01_front_office.html",
            description: "Guest services, check-in/check-out procedures, reservations, cashiering, emergency communication[cite: 1, 4]",
            keywords: ["front office", "check-in", "check-out", "reservation", "concierge", "cashier", "vip", "audit", "fo-01", "fo-04", "fo-14", "fo-24"]
        },
        {
            title: "Module 02: Housekeeping & Laundry",
            category: "Housekeeping (HK)",
            url: "02_housekeeping.html",
            description: "Room cleaning standards, linen management, laundry operations, public areas, pest control[cite: 1, 3]",
            keywords: ["housekeeping", "laundry", "cleaning", "room cleaning", "linen", "towels", "minibar", "lost and found", "pest control", "hk-01", "hk-04", "hk-16"]
        },
        {
            title: "Module 03: Food & Beverage",
            category: "Food & Beverage (FB)",
            url: "03_food_beverage.html",
            description: "Restaurant operations, food safety, kitchen hygiene, dining service",
            keywords: ["food", "beverage", "restaurant", "dining", "kitchen", "safety", "bar"]
        },
        {
            title: "Module 04: Function Hall & Events",
            category: "Function Hall (FH)",
            url: "04_function_hall.html",
            description: "Event reservations, client consultations, audio-visual staging, banquet catering, weddings[cite: 1, 2]",
            keywords: ["function hall", "events", "banquet", "wedding", "reservation", "audio-visual", "catering", "fh-01", "fh-06", "fh-10"]
        },
        {
            title: "Module 05: Facilities & Pool",
            category: "Facilities & Pool (FM)",
            url: "05_facilities_pool.html",
            description: "Resort maintenance, swimming pool water treatment, engineering repairs[cite: 1]",
            keywords: ["facilities", "pool", "maintenance", "pool treatment", "engineering", "repair", "water"]
        },
        {
            title: "Module 06: Safety, Security & Typhoon",
            category: "Safety & Emergency (S)",
            url: "06_safety_typhoon_final.html",
            description: "Typhoon preparedness, emergency evacuation, security protocols, disaster response[cite: 1, 5]",
            keywords: ["safety", "security", "typhoon", "emergency", "evacuation", "storm", "disaster", "signal"]
        },
        {
            title: "Module 07: HR & Administration",
            category: "HR & Admin (HR)",
            url: "07_hr_admin.html",
            description: "Human resources, staff code of conduct, personnel scheduling, administration[cite: 1]",
            keywords: ["hr", "admin", "human resources", "staff", "personnel", "training", "policy"]
        },
        {
            title: "Module 08: Digital Systems",
            category: "Digital Systems (DS)",
            url: "08_digital_maintenance.html",
            description: "PMS operations, IT systems, Starlink/network backup, digital records management[cite: 1]",
            keywords: ["digital", "systems", "it", "pms", "software", "network", "starlink", "records"]
        }
    ];

    // Create results dropdown container dynamically
    const parentContainer = searchInput.parentElement;
    parentContainer.classList.add('relative');

    const resultsDropdown = document.createElement('div');
    resultsDropdown.id = 'search-results-dropdown';
    resultsDropdown.className = 'absolute left-0 right-0 mt-2 bg-white rounded-lg shadow-xl border border-gray-200 max-h-96 overflow-y-auto hidden z-50 text-left';
    parentContainer.appendChild(resultsDropdown);

    // Event listener for typing
    searchInput.addEventListener('input', function(e) {
        const query = e.target.value.toLowerCase().trim();
        const moduleCards = document.querySelectorAll('.module-card');

        if (query.length === 0) {
            resultsDropdown.classList.add('hidden');
            moduleCards.forEach(card => card.style.display = 'block');
            return;
        }

        // 1. Filter homepage module cards
        moduleCards.forEach(card => {
            const cardText = card.textContent.toLowerCase();
            if (cardText.includes(query)) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });

        // 2. Populate dropdown matches
        const matches = searchIndex.filter(item => 
            item.title.toLowerCase().includes(query) || 
            item.description.toLowerCase().includes(query) ||
            item.keywords.some(kw => kw.includes(query))
        );

        if (matches.length > 0) {
            resultsDropdown.innerHTML = matches.map(match => `
                <a href="${match.url}" class="block px-4 py-3 hover:bg-cyan-50 border-b border-gray-100 transition-colors">
                    <div class="text-sm font-bold text-gray-900 flex items-center justify-between">
                        <span>${match.title}</span>
                        <span class="text-xs bg-cyan-100 text-cyan-800 px-2 py-0.5 rounded">${match.category}</span>
                    </div>
                    <p class="text-xs text-gray-600 mt-1 line-clamp-1">${match.description}</p>
                </a>
            `).join('');
            resultsDropdown.classList.remove('hidden');
        } else {
            resultsDropdown.innerHTML = `
                <div class="px-4 py-3 text-sm text-gray-500 text-center">
                    No matching SOP modules found for "${query}"
                </div>
            `;
            resultsDropdown.classList.remove('hidden');
        }
    });

    // Close dropdown when clicking outside
    document.addEventListener('click', function(e) {
        if (!parentContainer.contains(e.target)) {
            resultsDropdown.classList.add('hidden');
        }
    });
}
}