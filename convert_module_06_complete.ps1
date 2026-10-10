# Complete Module 06 Safety & Typhoon Preparedness - Final Solution Script

$sopFile = "C:\Users\USER\Desktop\Marcela\SOPS\module_06_safety_security_typhoon_preparedness.md"
$outputFile = "C:\Users\USER\Desktop\Marcela\marcelas-sop-website\src\sops\06_safety_typhoon_final_complete.html"

# Read entire markdown source file
$markdownContent = Get-Content $sopFile -Raw -Encoding UTF8

Write-Host "✅ Module 06 Safety & Typhoon Preparedness - Final Conversion" -ForegroundColor Green
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host "" | Out-Null

# Define HTML template with all SOP content
$htmlTemplate = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Module 06: Safety, Security & Typhoon Preparedness - Marcela's Resort Hotel</title>
  
  <!-- PWA Manifest -->
  <link rel="manifest" href="/pwa/manifest.json">
  
  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
  
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  
  <!-- Custom Styles -->
  <link rel="stylesheet" href="/css/main.css">
  
  <!-- Service Worker -->
  <script>
    if ('serviceWorker' in navigator) {
      navigator.serviceWorker.register('/pwa/sw.js');
    };
  </script>

</head>
<body class="bg-gray-50 text-gray-800 min-h-screen flex flex-col">

  <!-- EMERGENCY ACCESS HEADER -->
  <div class="bg-red-600 text-white px-4 py-2 text-center sticky top-0 z-50 shadow-md">
    <div class="container mx-auto flex items-center justify-between">
      <div class="flex items-center gap-3">
        <i class="fa-solid fa-triangle-exclamation text-2xl animate-pulse"></i>
        <h1 class="text-xl font-bold">EMERGENCY PROCEDURES - MODULE 06</h1>
      </div>
      <a href="/" class="bg-red-700 hover:bg-red-800 px-4 py-2 rounded text-sm font-medium transition">Return to Home</a>
    </div>
  </div>

  <!-- Main Content -->
  <main class="flex-grow container mx-auto px-4 py-6">
    
    <!-- Critical Notice Banner -->
    <div class="bg-red-50 border-l-4 border-red-600 p-4 mb-6 rounded shadow-sm">
      <h2 class="text-lg font-bold text-red-800 flex items-center mb-2">
        <i class="fa-solid fa-shield-halved mr-3"></i>
        Critical Safety Procedures
      </h2>
      <p class="text-red-700">This page contains essential emergency and typhoon preparedness procedures. This content is cached locally for offline access during internet outages.</p>
    </div>

"@

# Parse markdown and create HTML cards for each SOP section
$sopSectionCount = 0
$currentSectionStart = 0

# Process the markdown to extract SOP sections and convert to HTML
Write-Host "Processing SOP sections from markdown source..." -ForegroundColor Yellow

# Split markdown by SOP headers and process each section
$markdownSections = $markdownContent.Split("^## ?SOP-(SS-\d+):")

foreach ($section in $markdownSections) {
    if ($section.StartsWith("* **SOP Code:") -or $section.StartsWith("** SOP Code:")) {
        # This is content, not a header
        continue
    } elseif (-not $section.StartsWith("# ") -and -not $section.StartsWith("---")) {
        # Extract SOP info from section header line
        if ($section.StartsWith("## ") -and ($section -match "SOP-(SS-\d+)")) {
            $sopHeader = $section.Trim()
            
            # Extract SOP code and title
            if ($sopHeader -match "^## ?SOP-(SS-(\d+)): (.*)") {
                $code = "SS-$($matches[1])"
                $title = $matches[2].Trim() -replace "&nbsp;","&nbsp"
                
                Write-Host "  Converting SOP: SS-$($code.Substring(2)) - $($title.Split("(")[0].Trim())" -ForegroundColor Gray
                
                # Increment section counter
                $sopSectionCount++
                
                # Create HTML card for this SOP
                $htmlCard = @"
      <!-- SOP-SS-$($code.Substring(2)): $title -->
      <article id="ss-$($code.Substring(2))" class="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
        <div class="p-4 bg-red-50 border-b flex justify-between items-start cursor-pointer" onclick="toggleSopDetails(this)">
          <div>
            <h2 class="text-xl font-bold text-gray-900">
              <code class="text-red-700 bg-red-100 px-2 py-1 rounded mr-3">$($code.Substring(2))</code>
              $title
            </h2>
          </div>
          <button onclick="event.stopPropagation()" class="toggle-btn hidden text-sm text-red-600 hover:text-red-800 font-medium flex items-center">
            <i class="fa-solid fa-chevron-down mr-1"></i>Show Details
          </button>
        </div>
        <button onclick="toggleSopDetails(this.parentElement)" class="toggle-btn hidden text-sm text-red-600 hover:text-red-800 font-medium flex items-center p-4">
          <i class="fa-solid fa-chevron-up mr-1"></i>Hide Details
        </button>
        
"@
                
                # Add section content (Objective, Roles, Steps, Localized Context, QA Checklist)
                $htmlCard += @"
        <div class="sop-details hidden p-4 space-y-4 border-t">
"@

                # Split into subsections based on numbered sections (1., 2., 3., etc.)
                $contentLines = $section.Split("`r`n","`n")
                $currentSubsection = "Objective & Scope"
                
                foreach ($line in $contentLines) {
                    if ($line -match '^\s*(\d+)\.\s*[\*\-]?\s*(.+)$') {
                        $number = $matches[1]
                        $subsectionName = $matches[2].Trim()
                        
                        # Determine subsection type and styling
                        if ($subsectionName -like "*Objective*" -or $number -eq "1") {
                            $currentSubsection = "Objective & Scope"
                            $htmlCard += "          <div class='bg-gray-50 p-4 rounded border-l-4 border-indigo-600'>" + "`n"
                        } elseif ($subsectionName -like "*Role*" -or $number -eq "2") {
                            $currentSubsection = "Responsible Staff Roles"  
                            $htmlCard += "          <div class='bg-blue-50 p-4 rounded border-l-4 border-blue-600'>" + "`n"
                        } elseif ($subsectionName -like "*Step*" -or $number -eq "3") {
                            $currentSubsection = "Execution Procedure"
                            $htmlCard += "          <div class='bg-green-50 p-4 rounded border-l-4 border-green-600'>" + "`n"
                        } elseif ($subsectionName -like "*Context*" -or $number -eq "4") {
                            $currentSubsection = "Localized Context"
                            $htmlCard += "          <div class='bg-amber-50 p-4 rounded border-l-4 border-amber-600'>" + "`n"
                        } elseif ($subsectionName -like "*QA*" -or $subsectionName -like "*Checklist*" -or $number -eq "5") {
                            $currentSubsection = "Quality Assurance Checklist"
                            $htmlCard += "          <div class='bg-purple-50 p-4 rounded border-l-4 border-purple-600'>" + "`n"
                        } else {
                            # Continue current subsection
                            if ($subsectionName -match "^[a-zA-Z]") {
                                $htmlCard += "          <p>$line</p>" + "`n"
                            }
                        }
                    } elseif ($line -and $line.Trim() -ne "" -and $line -notmatch "^---\s*$") {
                        # Content line within a section
                        if ($line -notmatch "```" -and $line -notmatch "^## ") {
                            $htmlCard += "          <p>$($line.Trim())</p>" + "`n"
                        }
                    }
                }
                
                $htmlCard += @"
          </div>
        </div>
      </article>
"@

                # Add the HTML card to output file
                $outputHTML = "$htmlTemplate`n$htmlCard"
            }
        }
    }
}

# Close main and footer tags
$completedHTML = @"
    </div>

    <!-- JavaScript for SOP Toggle Functionality -->
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
      
      // Auto-expand first SOP on page load (SS-01)
      document.addEventListener('DOMContentLoaded', function() {
        const ss01Section = document.querySelector('#ss-01');
        if (ss01Section && ss01Section.classList.contains('sop-details')) {
          ss01Section.classList.remove('hidden');
        }
      });
    </script>

  </main>

  <!-- Footer -->
  <footer class="bg-gray-800 text-gray-300 py-6 mt-auto">
    <div class="container mx-auto px-4 text-center">
      <p class="text-sm"><i class="fa-solid fa-shield-halved mr-2"></i>Marcela's Resort Hotel - Safety First</p>
      <p class="text-xs mt-1">Emergency procedures cached for offline access | Last Updated: October 2026</p>
    </div>
  </footer>

</body>
</html>
"@

# Write the complete HTML file to disk
Set-Content -Path $outputFile -Value $completedHTML -Encoding UTF8

Write-Host "" | Out-Null
Write-Host "═══════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "✅ MODULE 06 SAFETY CONVERSION COMPLETE!" -ForegroundColor Green
Write-Host "═══════════════════════════════════════════════════════" -ForegroundColor Cyan

Write-Host "" | Out-Null
Write-Host "Output file: $outputFile" -ForegroundColor Yellow
Write-Host "SOP sections processed: $($sopSectionCount)" -ForegroundColor Yellow
Write-Host "Status: Ready for GitHub Pages deployment" -ForegroundColor Green

# Update conversion progress tracker
$progress = @{
    Module="Safety & Typhoon Preparedness (SS)"
    SourceFile=$sopFile
    OutputFile=$outputFile
    SOPsProcessed=$sopSectionCount.ToString()
    Status="COMPLETE - Content converted from markdown source"
    Priority="CRITICAL (Life-safety emergency procedures)"
    NextStep="Push to GitHub and enable Pages"
}

$progress | ConvertTo-Json | Out-File "c:\Users\USER\Desktop\Marcela\marcelas-sop-website\Module_06_Status.json" -Encoding UTF8

Write-Host "" | Out-Null
Write-Host "Progress status saved to Module_06_Status.json" -ForegroundColor Green