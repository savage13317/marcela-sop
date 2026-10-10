# Update all module pages with enhanced navigation and page highlighting
$moduleFiles = @(
    "01_front_office.html",
    "02_housekeeping.html", 
    "03_food_beverage.html",
    "04_function_hall.html",
    "05_facilities_pool.html",
    "07_hr_admin.html",
    "08_digital_maintenance.html"
)

$highlightScript = @"`n    <!-- Page Highlight Script -->`n    <script>`n      (function() {`n        const currentPage = window.location.pathname.split('/').pop() || 'index.html';`n        const navLinks = document.querySelectorAll('#moduleNav a');`n        `n        navLinks.forEach(link => {`n          link.classList.remove('bg-yellow-600', 'text-white', 'font-bold', 'ring-2', 'ring-yellow-400');`n          link.classList.add('bg-indigo-800', 'hover:bg-indigo-600');`n          `n          // Highlight current page if it's a module page (not home)`n          if (currentPage && !currentPage.includes('#') && currentPage !== 'index.html' && currentPage !== '') {`n            link.classList.add('bg-yellow-600', 'text-white', 'font-bold', 'ring-2', 'ring-yellow-400');`n            link.classList.remove('bg-indigo-800', 'hover:bg-indigo-600');`n          }`n        });`n      })();`n    </script>`"@

foreach ($file in $moduleFiles) {
    Write-Host "Processing $file..."
    
    # Read file content
    $content = Get-Content $file -Raw
    
    # 1. Add id="moduleNav" to the nav div if not present
    if ($content -notmatch 'id="moduleNav"') {
        $content = $content -replace '(class="flex gap-2 flex-wrap justify-center")', '$1 id="moduleNav"'
        Write-Host "  - Added moduleNav ID"
    }
    
    # 2. Remove staffing link if present
    $content = $content -replace '<a href="#staffing"[^>]*>[^<]*Staffing[^<]*</a>\s*$', ''
    if ($content -match '</div>\s*</div>') {
        Write-Host "  - Removed staffing link"
    }
    
    # 3. Add page highlight script before </main> tag
    if ($content -notmatch 'Page Highlight Script') {
        $content = $content -replace '(</nav>\s+)</main>', "</nav>`n`n$highlightScript`n  <main"
        Write-Host "  - Added highlight script"
    }
    
    # Write back to file
    $content | Set-Content $file -NoNewline
    
    Write-Host "  Done!"
}

Write-Host "`nAll module pages updated successfully!"
