# Script to populate Modules 03, 04, 05 SOPs from markdown source to HTML
# Updated: October 10, 2026

$scriptDir = "C:\Users\GM\Desktop\Marcela"
$sopDir = "C:\Users\GM\Desktop\Marcela\marcelas-sop-website\src\sops"

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  MODULES 03, 04, 05 CONTENT POPULATION   " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# Module 03: Food & Beverage
Write-Host "Processing Module 03: Food & Beverage..." -ForegroundColor Yellow
$sourceFile03 = "$scriptDir\SOPS\module_03_food_beverage_operations_sops.md"
$outputFile03 = "$sopDir\03_food_beverage.html"

if (Test-Path $sourceFile03) {
    Write-Host "  Source: $sourceFile03" -ForegroundColor Green
    
    # Read source markdown content
    $markdownContent03 = Get-Content $sourceFile03 -Raw
    
    # Define HTML header for Module 03
    $htmlHeader03 = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Module 03: Food & Beverage Operations - Marcela's Resort Hotel</title>
  <link rel="manifest" href="/pwa/manifest.json">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <link rel="stylesheet" href="/css/main.css">
  <script>
    if ('serviceWorker' in navigator) {
      navigator.serviceWorker.register('/pwa/sw.js');
    };
  </script>
</head>
<body class="bg-gray-50 text-gray-800 min-h-screen flex flex-col">
  <header class="bg-indigo-700 text-white shadow-md sticky top-0 z-40">
    <nav class="container mx-auto px-4 py-3">
      <div class="flex flex-col md:flex-row justify-between items-center gap-4">
        <a href="/" class="text-xl font-bold hover:text-indigo-200 transition-colors">
          <i class="fa-solid fa-hotel mr-2"></i>Marcela's Resort Hotel
        </a>
        <div class="flex gap-2 flex-wrap justify-center">
          <a href="/" class="px-4 py-2 bg-indigo-800 rounded hover:bg-indigo-600 transition">Home</a>
          <a href="/sops/01_front_office.html" class="px-4 py-2 bg-indigo-800 rounded font-semibold hover:bg-indigo-600 transition">Front Office (FO)</a>
          <a href="/sops/03_food_beverage.html" class="px-4 py-2 bg-indigo-800 rounded font-semibold text-yellow-300 hover:bg-indigo-600 transition">Food & Beverage (FB)</a>
          <a href="#staffing" class="px-4 py-2 bg-indigo-800 rounded hover:bg-indigo-600 transition">Staffing</a>
        </div>
        <div class="flex items-center gap-2 w-full md:w-auto">
          <input type="search" id="searchInput" placeholder="Search SOPs..." class="w-full md:w-64 px-3 py-2 rounded text-sm focus:outline-none focus:ring-2 focus:ring-indigo-400" aria-label="Search SOPs">
          <button onclick="window.dispatchEvent(new Event('search'))" class="px-3 py-2 bg-indigo-800 rounded hover:bg-indigo-600 transition"><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
      </div>
    </nav>
  </header>
  <main class="flex-grow container mx-auto px-4 py-6">
    <div class="bg-gradient-to-r from-emerald-50 to-green-50 rounded-lg shadow-sm p-6 mb-6 border-l-4 border-emerald-600">
      <h1 class="text-3xl font-bold text-emerald-900 mb-2"><i class="fa-solid fa-utensils mr-3"></i>Module 03: Food & Beverage Operations</h1>
      <p class="text-gray-700">SOPs for restaurant operations, kitchen procedures, food safety, beverage service, room dining, and F&B management</p>
    </div>
    <div class="space-y-4" id="sop-container">
"@

    # Parse SOP sections from Module 03
    $lines03 = Get-Content $sourceFile03
    $currentSop = $null
    $inSop = $false
    $sopBuffer03 = ""
    
    foreach ($line in $lines03) {
        if ($line -match '## ?SOP-(FB-\d+):') {
            if ($inSop -and $sopBuffer03.Trim() -ne "") {
                $currentSop = [PSCustomObject]@{
                    Code = ($currentSop.Title -replace '## ?SOP-(FB-\d+):', '')
                    Title = $currentSop.Title
                    Content = $sopBuffer03
                }
                $sopSections03 += $currentSop
            }
            $currentSop = [PSCustomObject]@{Title = $line; Content = ""}
            $inSop = $true
            $sopBuffer03 = $line + "`n"
        } elseif ($inSop) {
            $sopBuffer03 += $line + "`n"
        }
    }
    
    if ($inSop -and $sopBuffer03.Trim() -ne "") {
        $currentSop = [PSCustomObject]@{
            Code = ($currentSop.Title -replace '## ?SOP-(FB-\d+):', '')
            Title = $currentSop.Title
            Content = $sopBuffer03
        }
        $sopSections03 += $currentSop
    }
    
    Write-Host "  Extracted $($sopSections03.Count) SOP sections" -ForegroundColor Cyan
    
    # Generate HTML for Module 03
    $sopHTML03 = ""
    foreach ($sop in $sopSections03) {
        $code = $sop.Code
        $title = $sop.Title
        if ($title -match '^## ') { $title = $title.Substring(3).Trim() }
        
        $htmlCard = @"
      <!-- SOP-$code -->
      <article class="bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow border border-gray-200 overflow-hidden">
        <div class="p-4 bg-emerald-50 border-b cursor-pointer flex justify-between items-center group" onclick="toggleSopDetails(this)">
          <div>
            <code class="text-emerald-700 font-bold text-sm mr-2">$code</code>
            <span class="text-gray-800 font-medium text-lg">$title</span>
          </div>
          <i class="fa-solid fa-chevron-down text-emerald-600 transform group-hover:rotate-180 transition-transform"></i>
        </div>
        <button onclick="event.stopPropagation()" class="toggle-btn hidden p-2 text-sm text-emerald-600 hover:bg-emerald-50 rounded ml-4 mt-2">▼ Show Details</button>
        <div class="sop-details hidden p-4 space-y-3 border-t">
"@
        
        if ($sop.Content -match '### 1\. (.*?)###') {
            $htmlCard += @"
          <div class="bg-gray-50 p-4 rounded">
            <h4 class="text-sm font-bold text-gray-700 uppercase tracking-wide mb-2 flex items-center"><i class="fa-solid fa-bullseye mr-2 text-gray-600"></i>1. Objective & Scope</h4>
            <div class="text-gray-700 whitespace-pre-line">$($Matches[1].Trim())</div>
          </div>
"@
        }
        if ($sop.Content -match '### 2\. (.*?)###') {
            $htmlCard += @"
          <div class="bg-blue-50 p-4 rounded">
            <h4 class="text-sm font-bold text-blue-900 uppercase tracking-wide mb-2 flex items-center"><i class="fa-solid fa-users mr-2 text-blue-700"></i>2. Responsible Staff Roles</h4>
            <div class="text-gray-700 whitespace-pre-line">$($Matches[1].Trim())</div>
          </div>
"@
        }
        if ($sop.Content -match '### 3\. Step-by-Step Execution Procedure.*?(?=### )') {
            $htmlCard += @"
          <div class="bg-green-50 p-4 rounded">
            <h4 class="text-sm font-bold text-green-900 uppercase tracking-wide mb-2 flex items-center"><i class="fa-solid fa-list-check mr-2 text-green-700"></i>3. Step-by-Step Execution Procedure</h4>
            <div class="text-gray-700 whitespace-pre-line">$($Matches[0].Trim())</div>
          </div>
"@
        }
        if ($sop.Content -match '### 4\. Localized Context.*?(?=### )') {
            $htmlCard += @"
          <div class="bg-amber-50 p-4 rounded">
            <h4 class="text-sm font-bold text-amber-900 uppercase tracking-wide mb-2 flex items-center"><i class="fa-solid fa-location-dot mr-2 text-amber-700"></i>4. Localized Context</h4>
            <div class="text-gray-700 whitespace-pre-line">$($Matches[0].Trim())</div>
          </div>
"@
        }
        if ($sop.Content -match '### 5\. Quality Assurance Checklist & Metrics') {
            $htmlCard += @"
          <div class="bg-purple-50 p-4 rounded">
            <h4 class="text-sm font-bold text-purple-900 uppercase tracking-wide mb-2 flex items-center"><i class="fa-solid fa-clipboard-check mr-2 text-purple-700"></i>5. Quality Assurance Checklist & Metrics</h4>
            <div class="text-gray-700 whitespace-pre-line">$($Matches[0].Trim())</div>
          </div>
"@
        }
        
        $htmlCard += @"
        </div>
      </article>
"@
        $sopHTML03 += $htmlCard
    }
    
    $htmlFooter03 = @"
    </div>
    <script>
      function toggleSopDetails(button) {
        const details = button.nextElementSibling;
        const siblingToggle = details.previousElementSibling.querySelector('.toggle-btn');
        if (details.classList.contains('hidden')) {
          details.classList.remove('hidden');
          siblingToggle?.classList.add('hidden');
        } else {
          details.classList.add('hidden');
          siblingToggle?.classList.remove('hidden');
        }
      }
    </script>
  </main>
  <footer class="bg-gray-800 text-gray-300 py-6 mt-auto">
    <div class="container mx-auto px-4 text-center">
      <p class="text-sm"><i class="fa-solid fa-utensils mr-2"></i>Marcela's Resort Hotel - Food & Beverage Excellence</p>
      <p class="text-xs mt-1">Last Updated: October 2026</p>
    </div>
  </footer>
</body>
</html>
"@
    
    $outputContent03 = $htmlHeader03.Trim() + "`n" + $sopHTML03.Trim() + "`n" + $htmlFooter03
    Set-Content -Path $outputFile03 -Value $outputContent03 -Encoding UTF8
    
    Write-Host "  ✅ Module 03 HTML created: $outputFile03" -ForegroundColor Green
} else {
    Write-Host "  ⚠️ Source file not found: $sourceFile03" -ForegroundColor Red
}

# Module 04: Function Hall
Write-Host ""
Write-Host "Processing Module 04: Function Hall & Events..." -ForegroundColor Yellow
$sourceFile04 = "$scriptDir\SOPS\module_04_function_hall_events.md"
$outputFile04 = "$sopDir\04_function_hall.html"

if (Test-Path $sourceFile04) {
    Write-Host "  Source: $sourceFile04" -ForegroundColor Green
    
    $markdownContent04 = Get-Content $sourceFile04 -Raw
    $lines04 = Get-Content $sourceFile04
    
    # Define HTML header for Module 04
    $htmlHeader04 = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Module 04: Function Hall & Events - Marcela's Resort Hotel</title>
  <link rel="manifest" href="/pwa/manifest.json">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <link rel="stylesheet" href="/css/main.css">
  <script>
    if ('serviceWorker' in navigator) {
      navigator.serviceWorker.register('/pwa/sw.js');
    };
  </script>
</head>
<body class="bg-gray-50 text-gray-800 min-h-screen flex flex-col">
  <header class="bg-indigo-700 text-white shadow-md sticky top-0 z-40">
    <nav class="container mx-auto px-4 py-3">
      <div class="flex flex-col md:flex-row justify-between items-center gap-4">
        <a href="/" class="text-xl font-bold hover:text-indigo-200 transition-colors">
          <i class="fa-solid fa-hotel mr-2"></i>Marcela's Resort Hotel
        </a>
        <div class="flex gap-2 flex-wrap justify-center">
          <a href="/" class="px-4 py-2 bg-indigo-800 rounded hover:bg-indigo-600 transition">Home</a>
          <a href="/sops/01_front_office.html" class="px-4 py-2 bg-indigo-800 rounded font-semibold hover:bg-indigo-600 transition">Front Office (FO)</a>
          <a href="/sops/03_food_beverage.html" class="px-4 py-2 bg-indigo-800 rounded font-semibold text-yellow-300 hover:bg-indigo-600 transition">Food & Beverage (FB)</a>
          <a href="/sops/04_function_hall.html" class="px-4 py-2 bg-indigo-800 rounded font-semibold text-pink-300 hover:bg-indigo-600 transition">Function Hall (FH)</a>
          <a href="#staffing" class="px-4 py-2 bg-indigo-800 rounded hover:bg-indigo-600 transition">Staffing</a>
        </div>
        <div class="flex items-center gap-2 w-full md:w-auto">
          <input type="search" id="searchInput" placeholder="Search SOPs..." class="w-full md:w-64 px-3 py-2 rounded text-sm focus:outline-none focus:ring-2 focus:ring-indigo-400" aria-label="Search SOPs">
          <button onclick="window.dispatchEvent(new Event('search'))" class="px-3 py-2 bg-indigo-800 rounded hover:bg-indigo-600 transition"><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
      </div>
    </nav>
  </header>
  <main class="flex-grow container mx-auto px-4 py-6">
    <div class="bg-gradient-to-r from-pink-50 to-rose-50 rounded-lg shadow-sm p-6 mb-6 border-l-4 border-pink-600">
      <h1 class="text-3xl font-bold text-pink-900 mb-2"><i class="fa-solid fa-glass-cheers mr-3"></i>Module 04: Function Hall & Events</h1>
      <p class="text-gray-700">SOPs for event reservations, coordination, setup, catering, corporate events, weddings, and special celebrations</p>
    </div>
    <div class="space-y-4" id="sop-container">
"@

    # Parse SOP sections from Module 04
    $currentSop = $null
    $inSop = $false
    $sopBuffer04 = ""
    
    foreach ($line in $lines04) {
        if ($line -match '## ?SOP-(FH-\d+):') {
            if ($inSop -and $sopBuffer04.Trim() -ne "") {
                $currentSop = [PSCustomObject]@{Code = ($currentSop.Title -replace '## ?SOP-(FH-\d+):', ''); Title = $currentSop.Title; Content = $sopBuffer04}
                $sopSections04 += $currentSop
            }
            $currentSop = [PSCustomObject]@{Title = $line; Content = ""}
            $inSop = $true
            $sopBuffer04 = $line + "`n"
        } elseif ($inSop) {
            $sopBuffer04 += $line + "`n"
        }
    }
    
    if ($inSop -and $sopBuffer04.Trim() -ne "") {
        $currentSop = [PSCustomObject]@{Code = ($currentSop.Title -replace '## ?SOP-(FH-\d+):', ''); Title = $currentSop.Title; Content = $sopBuffer04}
        $sopSections04 += $currentSop
    }
    
    Write-Host "  Extracted $($sopSections04.Count) SOP sections" -ForegroundColor Cyan
    
    # Generate HTML for Module 04
    $sopHTML04 = ""
    foreach ($sop in $sopSections04) {
        $code = $sop.Code
        $title = $sop.Title
        if ($title -match '^## ') { $title = $title.Substring(3).Trim() }
        
        $htmlCard = @"
      <!-- SOP-$code -->
      <article class="bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow border border-gray-200 overflow-hidden">
        <div class="p-4 bg-pink-50 border-b cursor-pointer flex justify-between items-center group" onclick="toggleSopDetails(this)">
          <div>
            <code class="text-pink-700 font-bold text-sm mr-2">$code</code>
            <span class="text-gray-800 font-medium text-lg">$title</span>
          </div>
          <i class="fa-solid fa-chevron-down text-pink-600 transform group-hover:rotate-180 transition-transform"></i>
        </div>
        <button onclick="event.stopPropagation()" class="toggle-btn hidden p-2 text-sm text-pink-600 hover:bg-pink-50 rounded ml-4 mt-2">▼ Show Details</button>
        <div class="sop-details hidden p-4 space-y-3 border-t">
"@
        
        if ($sop.Content -match '### 1\. (.*?)###') { $htmlCard += @"          <div class="bg-gray-50 p-4 rounded"><h4 class="text-sm font-bold text-gray-700 uppercase tracking-wide mb-2 flex items-center"><i class="fa-solid fa-bullseye mr-2 text-gray-600"></i>1. Objective & Scope</h4><div class="text-gray-700 whitespace-pre-line">$($Matches[1].Trim())</div></div>" }
        if ($sop.Content -match '### 2\. (.*?)###') { $htmlCard += @"          <div class="bg-blue-50 p-4 rounded"><h4 class="text-sm font-bold text-blue-900 uppercase tracking-wide mb-2 flex items-center"><i class="fa-solid fa-users mr-2 text-blue-700"></i>2. Responsible Staff Roles</h4><div class="text-gray-700 whitespace-pre-line">$($Matches[1].Trim())</div></div>" }
        if ($sop.Content -match '### 3\. Step-by-Step Execution Procedure.*?(?=### )') { $htmlCard += @"          <div class="bg-green-50 p-4 rounded"><h4 class="text-sm font-bold text-green-900 uppercase tracking-wide mb-2 flex items-center"><i class="fa-solid fa-list-check mr-2 text-green-700"></i>3. Step-by-Step Execution Procedure</h4><div class="text-gray-700 whitespace-pre-line">$($Matches[0].Trim())</div></div>" }
        if ($sop.Content -match '### 4\. Localized Context.*?(?=### )') { $htmlCard += @"          <div class="bg-amber-50 p-4 rounded"><h4 class="text-sm font-bold text-amber-900 uppercase tracking-wide mb-2 flex items-center"><i class="fa-solid fa-location-dot mr-2 text-amber-700"></i>4. Localized Context</h4><div class="text-gray-700 whitespace-pre-line">$($Matches[0].Trim())</div></div>" }
        if ($sop.Content -match '### 5\. Quality Assurance Checklist & Metrics') { $htmlCard += @"          <div class="bg-purple-50 p-4 rounded"><h4 class="text-sm font-bold text-purple-900 uppercase tracking-wide mb-2 flex items-center"><i class="fa-solid fa-clipboard-check mr-2 text-purple-700"></i>5. Quality Assurance Checklist & Metrics</h4><div class="text-gray-700 whitespace-pre-line">$($Matches[0].Trim())</div></div>" }
        
        $htmlCard += @"        </div>
      </article>
"@
        $sopHTML04 += $htmlCard
    }
    
    $htmlFooter04 = @"
    </div>
    <script>
      function toggleSopDetails(button) {
        const details = button.nextElementSibling;
        const siblingToggle = details.previousElementSibling.querySelector('.toggle-btn');
        if (details.classList.contains('hidden')) {
          details.classList.remove('hidden');
          siblingToggle?.classList.add('hidden');
        } else {
          details.classList.add('hidden');
          siblingToggle?.classList.remove('hidden');
        }
      }
    </script>
  </main>
  <footer class="bg-gray-800 text-gray-300 py-6 mt-auto">
    <div class="container mx-auto px-4 text-center">
      <p class="text-sm"><i class="fa-solid fa-glass-cheers mr-2"></i>Marcela's Resort Hotel - Event Excellence</p>
      <p class="text-xs mt-1">Last Updated: October 2026</p>
    </div>
  </footer>
</body>
</html>
"@
    
    $outputContent04 = $htmlHeader04.Trim() + "`n" + $sopHTML04.Trim() + "`n" + $htmlFooter04
    Set-Content -Path $outputFile04 -Value $outputContent04 -Encoding UTF8
    
    Write-Host "  ✅ Module 04 HTML created: $outputFile04" -ForegroundColor Green
} else {
    Write-Host "  ⚠️ Source file not found: $sourceFile04" -ForegroundColor Red
}

# Module 05: Facilities & Pool
Write-Host ""
Write-Host "Processing Module 05: Facilities, Engineering & Swimming Pool..." -ForegroundColor Yellow
$sourceFile05 = "$scriptDir\SOPS\module_05_facilities_engineering_swimming_pool.md"
$outputFile05 = "$sopDir\05_facilities_pool.html"

if (Test-Path $sourceFile05) {
    Write-Host "  Source: $sourceFile05" -ForegroundColor Green
    
    $lines05 = Get-Content $sourceFile05
    
    # Define HTML header for Module 05
    $htmlHeader05 = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Module 05: Facilities, Engineering & Swimming Pool - Marcela's Resort Hotel</title>
  <link rel="manifest" href="/pwa/manifest.json">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <link rel="stylesheet" href="/css/main.css">
  <script>
    if ('serviceWorker' in navigator) {
      navigator.serviceWorker.register('/pwa/sw.js');
    };
  </script>
</head>
<body class="bg-gray-50 text-gray-800 min-h-screen flex flex-col">
  <header class="bg-indigo-700 text-white shadow-md sticky top-0 z-40">
    <nav class="container mx-auto px-4 py-3">
      <div class="flex flex-col md:flex-row justify-between items-center gap-4">
        <a href="/" class="text-xl font-bold hover:text-indigo-200 transition-colors">
          <i class="fa-solid fa-hotel mr-2"></i>Marcela's Resort Hotel
        </a>
        <div class="flex gap-2 flex-wrap justify-center">
          <a href="/" class="px-4 py-2 bg-indigo-800 rounded hover:bg-indigo-600 transition">Home</a>
          <a href="/sops/01_front_office.html" class="px-4 py-2 bg-indigo-800 rounded font-semibold hover:bg-indigo-600 transition">Front Office (FO)</a>
          <a href="/sops/03_food_beverage.html" class="px-4 py-2 bg-indigo-800 rounded font-semibold text-yellow-300 hover:bg-indigo-600 transition">Food & Beverage (FB)</a>
          <a href="/sops/04_function_hall.html" class="px-4 py-2 bg-indigo-800 rounded font-semibold text-pink-300 hover:bg-indigo-600 transition">Function Hall (FH)</a>
          <a href="/sops/05_facilities_pool.html" class="px-4 py-2 bg-indigo-800 rounded font-semibold text-teal-300 hover:bg-indigo-600 transition">Facilities & Pool (FM)</a>
          <a href="#staffing" class="px-4 py-2 bg-indigo-800 rounded hover:bg-indigo-600 transition">Staffing</a>
        </div>
        <div class="flex items-center gap-2 w-full md:w-auto">
          <input type="search" id="searchInput" placeholder="Search SOPs..." class="w-full md:w-64 px-3 py-2 rounded text-sm focus:outline-none focus:ring-2 focus:ring-indigo-400" aria-label="Search SOPs">
          <button onclick="window.dispatchEvent(new Event('search'))" class="px-3 py-2 bg-indigo-800 rounded hover:bg-indigo-600 transition"><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
      </div>
    </nav>
  </header>
  <main class="flex-grow container mx-auto px-4 py-6">
    <div class="bg-gradient-to-r from-teal-50 to-cyan-50 rounded-lg shadow-sm p-6 mb-6 border-l-4 border-teal-600">
      <h1 class="text-3xl font-bold text-teal-900 mb-2"><i class="fa-solid fa-screwdriver-wrench mr-3"></i>Module 05: Facilities, Engineering & Swimming Pool</h1>
      <p class="text-gray-700">SOPs for facilities maintenance, engineering systems, pool operations, HVAC, plumbing, electrical, and safety inspections</p>
    </div>
    <div class="space-y-4" id="sop-container">
"@

    # Parse SOP sections from Module 05
    $currentSop = $null
    $inSop = $false
    $sopBuffer05 = ""
    
    foreach ($line in $lines05) {
        if ($line -match '## ?SOP-(FM-\d+):') {
            if ($inSop -and $sopBuffer05.Trim() -ne "") {
                $currentSop = [PSCustomObject]@{Code = ($currentSop.Title -replace '## ?SOP-(FM-\d+):', ''); Title = $currentSop.Title; Content = $sopBuffer05}
                $sopSections05 += $currentSop
            }
            $currentSop = [PSCustomObject]@{Title = $line; Content = ""}
            $inSop = $true
            $sopBuffer05 = $line + "`n"
        } elseif ($inSop) {
            $sopBuffer05 += $line + "`n"
        }
    }
    
    if ($inSop -and $sopBuffer05.Trim() -ne "") {
        $currentSop = [PSCustomObject]@{Code = ($currentSop.Title -replace '## ?SOP-(FM-\d+):', ''); Title = $currentSop.Title; Content = $sopBuffer05}
        $sopSections05 += $currentSop
    }
    
    Write-Host "  Extracted $($sopSections05.Count) SOP sections" -ForegroundColor Cyan
    
    # Generate HTML for Module 05
    $sopHTML05 = ""
    foreach ($sop in $sopSections05) {
        $code = $sop.Code
        $title = $sop.Title
        if ($title -match '^## ') { $title = $title.Substring(3).Trim() }
        
        $htmlCard = @"
      <!-- SOP-$code -->
      <article class="bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow border border-gray-200 overflow-hidden">
        <div class="p-4 bg-teal-50 border-b cursor-pointer flex justify-between items-center group" onclick="toggleSopDetails(this)">
          <div>
            <code class="text-teal-700 font-bold text-sm mr-2">$code</code>
            <span class="text-gray-800 font-medium text-lg">$title</span>
          </div>
          <i class="fa-solid fa-chevron-down text-teal-600 transform group-hover:rotate-180 transition-transform"></i>
        </div>
        <button onclick="event.stopPropagation()" class="toggle-btn hidden p-2 text-sm text-teal-600 hover:bg-teal-50 rounded ml-4 mt-2">▼ Show Details</button>
        <div class="sop-details hidden p-4 space-y-3 border-t">
"@
        
        if ($sop.Content -match '### 1\. (.*?)###') { $htmlCard += @"          <div class="bg-gray-50 p-4 rounded"><h4 class="text-sm font-bold text-gray-700 uppercase tracking-wide mb-2 flex items-center"><i class="fa-solid fa-bullseye mr-2 text-gray-600"></i>1. Objective & Scope</h4><div class="text-gray-700 whitespace-pre-line">$($Matches[1].Trim())</div></div>" }
        if ($sop.Content -match '### 2\. (.*?)###') { $htmlCard += @"          <div class="bg-blue-50 p-4 rounded"><h4 class="text-sm font-bold text-blue-900 uppercase tracking-wide mb-2 flex items-center"><i class="fa-solid fa-users mr-2 text-blue-700"></i>2. Responsible Staff Roles</h4><div class="text-gray-700 whitespace-pre-line">$($Matches[1].Trim())</div></div>" }
        if ($sop.Content -match '### 3\. Step-by-Step Execution Procedure.*?(?=### )') { $htmlCard += @"          <div class="bg-green-50 p-4 rounded"><h4 class="text-sm font-bold text-green-900 uppercase tracking-wide mb-2 flex items-center"><i class="fa-solid fa-list-check mr-2 text-green-700"></i>3. Step-by-Step Execution Procedure</h4><div class="text-gray-700 whitespace-pre-line">$($Matches[0].Trim())</div></div>" }
        if ($sop.Content -match '### 4\. Localized Context.*?(?=### )') { $htmlCard += @"          <div class="bg-amber-50 p-4 rounded"><h4 class="text-sm font-bold text-amber-900 uppercase tracking-wide mb-2 flex items-center"><i class="fa-solid fa-location-dot mr-2 text-amber-700"></i>4. Localized Context</h4><div class="text-gray-700 whitespace-pre-line">$($Matches[0].Trim())</div></div>" }
        if ($sop.Content -match '### 5\. Quality Assurance Checklist & Metrics') { $htmlCard += @"          <div class="bg-purple-50 p-4 rounded"><h4 class="text-sm font-bold text-purple-900 uppercase tracking-wide mb-2 flex items-center"><i class="fa-solid fa-clipboard-check mr-2 text-purple-700"></i>5. Quality Assurance Checklist & Metrics</h4><div class="text-gray-700 whitespace-pre-line">$($Matches[0].Trim())</div></div>" }
        
        $htmlCard += @"        </div>
      </article>
"@
        $sopHTML05 += $htmlCard
    }
    
    $htmlFooter05 = @"
    </div>
    <script>
      function toggleSopDetails(button) {
        const details = button.nextElementSibling;
        const siblingToggle = details.previousElementSibling.querySelector('.toggle-btn');
        if (details.classList.contains('hidden')) {
          details.classList.remove('hidden');
          siblingToggle?.classList.add('hidden');
        } else {
          details.classList.add('hidden');
          siblingToggle?.classList.remove('hidden');
        }
      }
    </script>
  </main>
  <footer class="bg-gray-800 text-gray-300 py-6 mt-auto">
    <div class="container mx-auto px-4 text-center">
      <p class="text-sm"><i class="fa-solid fa-screwdriver-wrench mr-2"></i>Marcela's Resort Hotel - Facilities Excellence</p>
      <p class="text-xs mt-1">Last Updated: October 2026</p>
    </div>
  </footer>
</body>
</html>
"@
    
    $outputContent05 = $htmlHeader05.Trim() + "`n" + $sopHTML05.Trim() + "`n" + $htmlFooter05
    Set-Content -Path $outputFile05 -Value $outputContent05 -Encoding UTF8
    
    Write-Host "  ✅ Module 05 HTML created: $outputFile05" -ForegroundColor Green
} else {
    Write-Host "  ⚠️ Source file not found: $sourceFile05" -ForegroundColor Red
}

# Summary
Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  CONVERSION SUMMARY                       " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "✅ Module 03: Food & Beverage" -ForegroundColor Green
Write-Host "   File: $outputFile03" -ForegroundColor Cyan
Write-Host "   SOPs: $($sopSections03.Count)" -ForegroundColor Cyan
Write-Host ""
Write-Host "✅ Module 04: Function Hall & Events" -ForegroundColor Green
Write-Host "   File: $outputFile04" -ForegroundColor Cyan
Write-Host "   SOPs: $($sopSections04.Count)" -ForegroundColor Cyan
Write-Host ""
Write-Host "✅ Module 05: Facilities & Pool" -ForegroundColor Green
Write-Host "   File: $outputFile05" -ForegroundColor Cyan
Write-Host "   SOPs: $($sopSections05.Count)" -ForegroundColor Cyan
Write-Host ""
Write-Host "🎯 ALL MODULES 03-05 COMPLETED!" -ForegroundColor Green
Write-Host ""
