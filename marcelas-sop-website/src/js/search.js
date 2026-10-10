// Marcela's Resort - Client-Side Search Implementation

(function() {
  'use strict';

  // Initialize when DOM is ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initSearch);
  } else {
    initSearch();
  };

  let searchIndex = null;
  const SEARCH_THRESHOLD = 0.45; // Minimum relevance score
  const DEBOUNCE_MS = 150;      // Debounce delay for input

  /**
   * Initialize the search functionality
   */
  function initSearch() {
    indexSOPs();
    setupEventListeners();
  };

  /**
   * Index all SOP files for fuzzy search
   * In production, this would be pre-generated or fetched from a JSON file
   */
  function indexSOPs() {
    const sopFiles = [
      '01_front_office.html',
      '02_housekeeping.html',
      '03_food_beverage.html',
      '04_function_hall.html',
      '05_facilities_pool.html',
      '06_safety_typhoon.html',
      '07_hr_admin.html',
      '08_digital_maintenance.html'
    ];

    // For static site, we create a simple index structure
    // In production: fetch('/search-index.json')
    
    searchIndex = {
      version: '1.0.0',
      indexedAt: new Date().toISOString(),
      sopCards: []
    };

    console.log(`Search index created with ${sopFiles.length} modules`);
  };

  /**
   * Setup event listeners for search input
   */
  function setupEventListeners() {
    const input = document.getElementById('searchInput');
    
    // Debounced search
    let debounceTimer;
    input.addEventListener('input', () => {
      clearTimeout(debounceTimer);
      debounceTimer = setTimeout(performSearch, DEBOUNCE_MS);
    });

    // Keyboard accessibility
    const searchBtn = document.getElementById('searchBtn');
    searchBtn.addEventListener('click', performSearch);
  };

  /**
   * Perform the actual search
   */
  function performSearch() {
    if (!searchIndex) return;

    const query = document.getElementById('searchInput').value.trim().toLowerCase();
    
    if (!query) {
      hideSearchResults();
      return;
    };

    // Simple filter (production would use Fuse.js results)
    const results = searchIndex.sopCards.filter(card => {
      const matchesCode = card.code.toLowerCase().includes(query);
      const matchesTitle = card.title.toLowerCase().includes(query);
      const matchesContent = Object.values(card.sections).some(section => 
        section.content.toLowerCase().includes(query)
      );

      return matchesCode || matchesTitle || matchesContent;
    });

    displaySearchResults(results);
  };

  /**
   * Display search results in the DOM
   */
  function displaySearchResults(results) {
    const container = document.getElementById('resultsContainer');
    if (!container) return;

    container.innerHTML = `
      <div class="space-y-3">
        ${results.map((result, index) => createSopCard(result)).join('')}
        ${results.length === 0 ? `<p class="text-gray-500 text-center py-4">No results found. Try different keywords.</p>` : ''}
      </div>
    `;

    // Show search results section
    const searchResults = document.getElementById('searchResults');
    if (searchResults) {
      searchResults.classList.remove('hidden');
    };
  };

  /**
   * Create an SOP card from data
   */
  function createSopCard(sopData) {
    const sections = Object.values(sopData.sections);
    
    return `
      <div class="sop-card expandable bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow border border-gray-200">
        <div class="sop-header p-4 bg-indigo-50 border-b cursor-pointer flex justify-between items-center group" onclick="toggleSopDetails(this)">
          <div>
            <code class="text-indigo-700 font-bold text-sm mr-2">${sopData.code}</code>
            <span class="text-gray-800 font-medium truncate max-w-xs md:max-w-md lg:max-w-lg">
              ${sopData.title}
            </span>
          </div>
          <i class="fa-solid fa-chevron-down text-indigo-600 transform group-hover:rotate-180 transition-transform"></i>
        </div>
        
        <button class="toggle-btn hidden p-2 text-sm text-indigo-600 hover:bg-indigo-50 rounded ml-4 mt-2" onclick="event.stopPropagation()">
          ▼ Show Details
        </button>
        
        <div class="sop-details hidden p-4 space-y-3 border-t">
          
          ${sections[0]?.type === 'objective' ? `
            <div class="bg-gray-50 p-3 rounded">
              <h4 class="text-sm font-semibold text-gray-700 mb-1">Objective & Scope:</h4>
              <p class="text-gray-600 text-sm whitespace-pre-wrap">${escapeHtml(sections[0].content)}</p>
            </div>
          ` : ''}

          ${sections[1]?.type === 'roles' ? `
            <div class="bg-blue-50 p-3 rounded">
              <h4 class="text-sm font-semibold text-blue-800 mb-1">Responsible Staff Roles:</h4>
              <ul class="list-disc list-inside text-gray-700 text-sm space-y-1">
                ${sections[1].content.map(role => `<li>${escapeHtml(role)}</li>`).join('')}
              </ul>
            </div>
          ` : ''}

          ${sections[2]?.type === 'steps' ? `
            <div class="bg-green-50 p-3 rounded">
              <h4 class="text-sm font-semibold text-green-800 mb-1">Execution Procedure:</h4>
              <ol class="list-decimal list-inside text-gray-700 text-sm space-y-2">
                ${sections[2].content.map((step, i) => `
                  <li class="mb-2 last:mb-0">
                    <p>${escapeHtml(step.text)}</p>
                    ${step.substeps ? `<ul class="list-disc list-inside ml-1 mt-1 text-gray-600 text-xs">${step.substeps.map(sub => `<li>${escapeHtml(sub)}</li>`).join('')}</ul>` : ''}
                  </li>
                `).join('')}
              </ol>
            </div>
          ` : ''}

          ${sections.find(s => s.type === 'localized')?.content ? `
            <div class="bg-amber-50 p-3 rounded border-l-4 border-amber-400">
              <h4 class="text-sm font-semibold text-amber-800 mb-1 flex items-center">
                <i class="fa-solid fa-location-dot mr-1"></i>Localized Context:
              </h4>
              <p class="text-gray-700 text-sm whitespace-pre-wrap">${escapeHtml(sections.find(s => s.type === 'localized').content)}</p>
            </div>
          ` : ''}

          ${Array.isArray(sections.find(s => s.type === 'checklist')?.content) ? `
            <div class="bg-purple-50 p-3 rounded">
              <h4 class="text-sm font-semibold text-purple-800 mb-1 flex items-center">
                <i class="fa-solid fa-check-circle mr-1"></i>QA Checklist & Key Metrics:
              </h4>
              <ul class="space-y-1">
                ${sections.find(s => s.type === 'checklist').content.map(item => `
                  <li class="flex items-start gap-2 text-sm">
                    <input type="checkbox" class="mt-1 h-4 w-4 border-gray-300 rounded bg-white cursor-pointer" />
                    <span class="text-gray-700">${escapeHtml(item)}</span>
                  </li>
                `).join('')}
              </ul>
            </div>
          ` : ''}

        </div>
      </div>
    `;
  };

  /**
   * Escape HTML to prevent XSS
   */
  function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
  };

  /**
   * Hide search results section
   */
  function hideSearchResults() {
    const searchResults = document.getElementById('searchResults');
    if (searchResults) {
      searchResults.classList.add('hidden');
    };
  };

})();