/**
 * Standard SOP Card Toggle Function
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
