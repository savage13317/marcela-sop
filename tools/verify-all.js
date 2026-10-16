const fs = require('fs');
const root = '.';

// 1. JS syntax check via node --check on each JS file
const jsFiles = ['offline.js', 'src/pwa/sw.js', 'src/js/search.js'];
for (const f of jsFiles) {
  try {
    new Function(fs.readFileSync(f, 'utf8'));
    console.log('JS parse OK:', f);
  } catch (e) {
    console.log('JS PARSE FAIL:', f, '->', e.message);
  }
}

// 2. JSON check
try { JSON.parse(fs.readFileSync('src/pwa/manifest.json', 'utf8')); console.log('manifest.json OK'); }
catch (e) { console.log('manifest.json FAIL:', e.message); }
try { JSON.parse(fs.readFileSync('package.json', 'utf8')); console.log('package.json OK'); }
catch (e) { console.log('package.json FAIL:', e.message); }

// 3. Dead-file references must be gone from live pages
const livePages = ['index.html', 'staffing_matrix.html',
  '01_front_office.html','02_housekeeping.html','03_food_beverage.html','04_function_hall.html',
  '05_facilities_pool.html','06_safety_typhoon_final.html','07_hr_admin.html','08_digital_maintenance.html'];

const badPatterns = ['srcsrc', '[cite:', 'toggleMobileMenu', 'comboPositions', 'app.js', 'sop-cards.js'];
let badCount = 0;
for (const p of livePages) {
  const s = fs.readFileSync(p, 'utf8');
  for (const pat of badPatterns) {
    if (s.includes(pat)) { console.log('BAD:', p, 'contains', pat); badCount++; }
  }
  // offline.js must be loaded
  if (!s.includes('offline.js')) { console.log('MISSING offline.js in', p); badCount++; }
  // manifest must be referenced
  if (!s.includes('src/pwa/manifest.json')) { console.log('MISSING manifest ref in', p); badCount++; }
}
console.log('bad references found:', badCount);

// 4. staffing_matrix.html sanity
const st = fs.readFileSync('staffing_matrix.html', 'utf8');
const cards = [...st.matchAll(/id="sop-st-\d+"/g)].map(m => m[1]);
console.log('staffing cards:', cards.length, cards.join(','));
console.log('staffing size KB:', (fs.statSync('staffing_matrix.html').size / 1024).toFixed(1));

// 5. index links resolve to existing files
const idx = fs.readFileSync('index.html', 'utf8');
const hrefs = [...idx.matchAll(/href="([^"]+\.html)"/g)].map(m => m[1]);
for (const h of hrefs) {
  if (!fs.existsSync(h)) console.log('BROKEN LINK in index.html ->', h);
}
console.log('index html links checked:', hrefs.length);

// 6. icons present
const icons = fs.readdirSync('src/pwa').filter(f => f.endsWith('.png'));
console.log('icon count:', icons.length);

console.log('--- VERIFICATION DONE ---');
