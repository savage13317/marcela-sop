// Marcela's Resort SOP Navigation & Routing Application

document.addEventListener('DOMContentLoaded', () => {
  const contentArea = document.getElementById('content');
  const searchInput = document.getElementById('searchInput');
  const searchBtn = document.getElementById('searchBtn');

  // Load landing page content
  loadLandingPage();

  // Event listeners
  searchBtn.addEventListener('click', performSearch);
  searchInput.addEventListener('keypress', (e) => {
    if (e.key === 'Enter') performSearch();
  });

  function loadLandingPage() {
    const modulesHTML = `
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
        <!-- SOP Modules Section -->
        <section class="bg-white rounded-lg shadow-md p-6 border-l-4 border-indigo-600">
          <h2 class="text-2xl font-bold text-indigo-700 mb-4 flex items-center">
            <i class="fa-solid fa-book mr-3"></i>SOP Modules
          </h2>
          <p class="text-gray-600 mb-4">Select a module to view Standard Operating Procedures</p>
          
          <div class="space-y-3">
            ${[
              { code: 'FO', title: 'Front Office & Guest Services', file: '/sops/01_front_office.html', count: 24 },
              { code: 'HK', title: 'Housekeeping & Laundry', file: '/sops/02_housekeeping.html', count: 24 },
              { code: 'FB', title: 'Food & Beverage Operations', file: '/sops/03_food_beverage.html', count: 26 },
              { code: 'FH', title: 'Function Hall & Events', file: '/sops/04_function_hall.html', count: 8 },
              { code: 'FM', title: 'Facilities, Engineering & Swimming Pool', file: '/sops/05_facilities_pool.html', count: 12 },
              { code: 'SS', title: 'Safety, Security & Typhoon Preparedness', file: '/sops/06_safety_typhoon.html', count: 14, critical: true },
              { code: 'HR', title: 'Human Resources & Administration', file: '/sops/07_hr_admin.html', count: 8 },
              { code: 'DS', title: 'Digital Systems, Records & Maintenance', file: '/sops/08_digital_maintenance.html', count: 11 }
            ].map(m => `
              <a href="${m.file}" 
                 class="block p-4 border rounded hover:bg-indigo-50 transition group ${m.critical ? 'border-red-400 bg-red-50' : 'border-gray-200'}"
                 aria-label="${m.title}">
                <div class="flex justify-between items-center">
                  <div>
                    <span class="${m.critical ? 'text-red-600 font-bold' : 'text-indigo-700 font-semibold'}">
                      ${m.code}
                    </span>
                    <h3 class="ml-2 text-lg font-medium group-hover:text-indigo-800">${m.title}</h3>
                  </div>
                  <i class="fa-solid fa-chevron-right text-gray-400"></i>
                </div>
              </a>
            `).join('')}
          </div>
        </section>

        <!-- Staffing Matrix Section -->
        <section class="bg-white rounded-lg shadow-md p-6 border-l-4 border-blue-600" id="staffing">
          <h2 class="text-2xl font-bold text-blue-700 mb-4 flex items-center">
            <i class="fa-solid fa-users mr-3"></i>Staffing & Organization
          </h2>
          <p class="text-gray-600 mb-4">View organizational structure and position descriptions</p>
          
          <div class="space-y-4">
            <a href="/staff/staffing_matrix.html" 
               class="flex items-center p-4 bg-blue-50 text-blue-700 rounded-lg hover:bg-blue-100 transition font-medium"
               aria-label="View Staffing Matrix">
              <i class="fa-solid fa-diagram-project mr-3"></i>
              <span>Staffing Matrix & Org Chart</span>
            </a>
            
            ${comboPositions.map(pos => `
              <a href="/staff/positions/${pos.file}" 
                 class="block p-4 border rounded hover:bg-blue-50 transition group border-blue-200"
                 aria-label="${pos.title}">
                <div class="flex justify-between items-center">
                  <div>
                    <span class="text-blue-600 font-semibold">${pos.code}</span>
                    <h3 class="ml-2 text-lg font-medium group-hover:text-blue-800">${pos.title}</h3>
                  </div>
                </div>
              </a>
            `).join('')}
          </div>
        </section>
      </div>

      <!-- Search Results Section (hidden by default) -->
      <div id="searchResults" class="hidden space-y-4">
        <h3 class="text-xl font-bold text-gray-800 mb-3">Search Results:</h3>
        <div id="resultsContainer" class="grid grid-cols-1 md:grid-cols-2 gap-4"></div>
      </div>

      <!-- SOP Card Template (dynamically populated) -->
      <template id="sopCardTemplate">
        <div class="sop-card expandable bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow border border-gray-200">
          <div class="sop-header p-4 bg-indigo-50 border-b cursor-pointer flex justify-between items-center group" onclick="toggleSopDetails(this)">
            <div>
              <code class="text-indigo-700 font-bold text-sm mr-2">${sop.code}</code>
              <span class="text-gray-800 font-medium">${sop.title}</span>
            </div>
            <i class="fa-solid fa-chevron-down text-indigo-600 transform group-hover:rotate-180 transition-transform"></i>
          </div>
          <button class="toggle-btn hidden p-2 text-sm text-indigo-600 hover:bg-indigo-50 rounded ml-4 mt-2" onclick="event.stopPropagation()">
            ▼ Show Details
          </button>
          <div class="sop-details hidden p-4 space-y-3 border-t">
            ${sop.sections.map(section => `
              ${section.type === 'objective' ? `
                <div class="bg-gray-50 p-3 rounded">
                  <h4 class="text-sm font-semibold text-gray-700 mb-1">${section.label}</h4>
                  <p class="text-gray-600 text-sm whitespace-pre-wrap">${section.content}</p>
                </div>
              ` : section.type === 'roles' ? `
                <div class="bg-blue-50 p-3 rounded">
                  <h4 class="text-sm font-semibold text-blue-800 mb-1">${section.label}</h4>
                  <ul class="list-disc list-inside text-gray-700 text-sm space-y-1">
                    ${section.content.map(role => `<li>${role}</li>`).join('')}
                  </ul>
                </div>
              ` : section.type === 'steps' ? `
                <div class="bg-green-50 p-3 rounded">
                  <h4 class="text-sm font-semibold text-green-800 mb-1">${section.label}</h4>
                  <ol class="list-decimal list-inside text-gray-700 text-sm space-y-2">
                    ${section.content.map((step, i) => `
                      <li class="mb-2 last:mb-0">
                        <p>${step.text}</p>
                        ${step.substeps ? `<ul class="list-disc list-inside ml-1 mt-1 text-gray-600 text-xs">${step.substeps.map(sub => `<li>${sub}</li>`).join('')}</ul>` : ''}
                      </li>
                    `).join('')}
                  </ol>
                </div>
              ` : section.type === 'localized' ? `
                <div class="bg-amber-50 p-3 rounded border-l-4 border-amber-400">
                  <h4 class="text-sm font-semibold text-amber-800 mb-1 flex items-center">
                    <i class="fa-solid fa-location-dot mr-1"></i>${section.label}
                  </h4>
                  <p class="text-gray-700 text-sm whitespace-pre-wrap">${section.content}</p>
                </div>
              ` : section.type === 'checklist' ? `
                <div class="bg-purple-50 p-3 rounded">
                  <h4 class="text-sm font-semibold text-purple-800 mb-1 flex items-center">
                    <i class="fa-solid fa-check-circle mr-1"></i>${section.label}
                  </h4>
                  ${Array.isArray(section.content) ? `
                    <ul class="space-y-1">
                      ${section.content.map(item => `
                        <li class="flex items-start gap-2 text-sm">
                          <input type="checkbox" class="mt-1 h-4 w-4 border-gray-300 rounded bg-white" />
                          <span class="text-gray-700">${item}</span>
                        </li>
                      `).join('')}
                    </ul>
                  ` : `<p class="text-gray-600 text-sm whitespace-pre-wrap">${section.content}</p>`}
                </div>
              ` : ''}
            `).join('')}
          </div>
        </div>
      </template>
    `;

    contentArea.innerHTML = modulesHTML;

    // Make SOP card template available globally
    window.SOPCardTemplate = document.getElementById('sopCardTemplate').cloneNode(true);
  };

  function toggleSopDetails(header) {
    const card = header.closest('.sop-card');
    const details = card.querySelector('.sop-details');
    const toggleBtn = card.querySelector('.toggle-btn');
    
    if (details.classList.contains('hidden')) {
      details.classList.remove('hidden');
      toggleBtn.classList.add('hidden');
      header.innerHTML = `
        <div>
          <code class="text-indigo-700 font-bold text-sm mr-2">${header.querySelector('code').textContent}</code>
          <span class="text-gray-800 font-medium">${header.querySelector('span').textContent}</span>
        </div>
        <i class="fa-solid fa-chevron-up text-indigo-600 transform"></i>
      `;
    } else {
      details.classList.add('hidden');
      toggleBtn.classList.remove('hidden');
      header.innerHTML = `
        <div>
          <code class="text-indigo-700 font-bold text-sm mr-2">${header.querySelector('code').textContent}</code>
          <span class="text-gray-800 font-medium">${header.querySelector('span').textContent}</span>
        </div>
        <i class="fa-solid fa-chevron-down text-indigo-600 transform group-hover:rotate-180 transition-transform"></i>
      `;
    }
  };

  function performSearch() {
    const query = searchInput.value.trim().toLowerCase();
    if (!query) return hideSearchResults();

    // Index SOPs (in real implementation, would use Fuse.js with pre-built index)
    // For now, filter by code/title in URL
    const resultsContainer = document.getElementById('resultsContainer');
    
    // Clear and rebuild search
    resultsContainer.innerHTML = '';
    
    // Would search here - simplified for static site
    alert(`Searching for: "${query}"\n\nIn production, this would use Fuse.js to search across all SOP codes, titles, and content.`);
    
    hideSearchResults();
  };

  function hideSearchResults() {
    const searchResults = document.getElementById('searchResults');
    if (searchResults) {
      searchResults.classList.add('hidden');
    }
  };
});