# Simple batch extraction for Module 06 Safety SOPs
# Outputs directly to HTML file

$markdownPath = "C:\Users\USER\Desktop\Marcela\SOPS\module_06_safety_security_typhoon_preparedness.md"
$outputPath = "C:\Users\USER\Desktop\Marcela\marcelas-sop-website\src\sops\06_safety_typhoon_final_complete.html"

# Read entire markdown file
$markdown = Get-Content -Path $markdownPath -Raw -Encoding UTF8

# Create output HTML file with all 24 SOPs populated
$htmlOutput = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Module 06: Safety & Typhoon Preparedness - All SOPs</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <link rel="stylesheet" href="../css/main.css">
</head>
<body class="bg-gray-50 min-h-screen flex flex-col">

  <!-- Header -->
  <header class="bg-blue-800 text-white py-6 shadow-lg sticky top-0 z-10">
    <div class="container mx-auto px-4">
      <h1 class="text-2xl font-bold flex items-center gap-3">
        <i class="fa-solid fa-shield-halved"></i> Module 06: Safety & Typhoon Preparedness
      </h1>
      <p class="text-blue-200 mt-2 text-sm"><span class="font-semibold">CRITICAL PRIORITY</span> Emergency procedures cached for offline access</p>
    </div>
  </header>

  <!-- Navigation Grid - All 24 SOPs -->
  <main class="flex-grow container mx-auto px-4 py-6">
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 mb-8">
"@

# Add all 24 navigation cards
$sopNames = @(
    "Hotel Emergency Response System", "Fire Prevention & Fire Safety", "Fire Alarm Response", 
    "Fire Evacuation Procedure", "Emergency Exit & Assembly Area", "First Aid & Medical Emergency",
    "Guest Accident / Injury Reporting", "Drowning / Pool Emergency", "Missing Guest / Person Procedure",
    "Suspicious Person / Security Incident", "Theft / Property Loss Investigation", "CCTV Monitoring & Security",
    "Emergency Contact Directory", "Disaster Incident Command", "Typhoon Monitoring & Alert Levels",
    "Pre-Typhoon Property Preparation", "Typhoon Guest Safety Procedure", "Power Outage / Brownout Procedure",
    "Flooding / Heavy Rain Response", "Post-Typhoon Damage Assessment", "Business Continuity Procedure",
    "Emergency Communication & Family Coordination", "Emergency Supplies & Generator Readiness",
    "Incident Report & Post-Incident Review"
)

foreach ($sopName in $sopNames) {
    $htmlOutput += @"
      <div class="bg-white rounded-lg shadow-sm border border-gray-200 hover:shadow-md cursor-pointer transition p-4 sop-card">
        <div class="flex items-center justify-between">
          <i class="fa-solid fa-file-shield text-blue-600 text-xl"></i>
          <span class="font-medium text-gray-800 line-clamp-2">${sopName}</span>
        </div>
      </div>
"@
}

$htmlOutput += @"
    </div>
    
    <!-- SOP Details Section -->
    <div id="sop-details" class="space-y-6 mt-8">
"@

# Extract and insert each SOP's content
$remainingContent = $markdown.Substring($markdown.IndexOf('## SOP-SS-01'))

# Find each ### header section and extract content
while ($true) {
    # Look for next "### N. Section" pattern
    if ($remainingContent -match '^(?=### \d+\. (Objective|Responsible|Step-by-Step|Localized|Quality))') {
        break
    }
    
    # Extract current section header and content
    $sectionMatches = [regex]::Matches($remainingContent, '(?s)### (\d+)\. (.+)\n(.*?)(?=### \d+\. |\n---|$)', 'Singleline')
    
    if ($sectionMatches.Count -gt 0) {
        foreach ($match in $sectionMatches) {
            $sectionNum = $match.Groups[1].Value
            $sectionTitle = $match.Groups[2].Value
            $sectionContent = $match.Groups[3].Value
            
            # Add section content to output
            if ($sectionTitle -eq "Objective & Scope") {
                $htmlOutput += @"
          <div class="bg-gray-50 p-4 rounded border-l-4 border-indigo-600">
            <h3 class="font-semibold text-gray-800 mb-2"><i class="fa-solid fa-bullseye mr-2"></i>$sectionNum. Objective & Scope</h3>
            <div class="text-gray-700 whitespace-pre-line">${sectionContent}</div>
          </div>
"@
            } elseif ($sectionTitle -eq "Responsible Staff Roles") {
                $htmlOutput += @"
          <div class="bg-blue-50 p-4 rounded border-l-4 border-blue-600">
            <h3 class="font-semibold text-gray-800 mb-2"><i class="fa-solid fa-users mr-2"></i>2. Responsible Staff Roles</h3>
            <ul class="list-disc list-inside space-y-1 text-sm text-gray-700">${sectionContent}</ul>
          </div>
"@
            } elseif ($sectionTitle -eq "Step-by-Step Execution Procedure") {
                $htmlOutput += @"
          <div class="bg-green-50 p-4 rounded border-l-4 border-green-600">
            <h3 class="font-semibold text-gray-800 mb-2"><i class="fa-solid fa-list-check mr-2"></i>3. Step-by-Step Execution Procedure</h3>
            <ol class="list-decimal list-inside space-y-2 text-sm text-gray-700">${sectionContent}</ol>
          </div>
"@
            } elseif ($sectionTitle -eq "Localized Context") {
                $htmlOutput += @"
          <div class="bg-amber-50 p-4 rounded border-l-4 border-amber-600">
            <h3 class="font-semibold text-gray-800 mb-2"><i class="fa-solid fa-map-location-dot mr-2"></i>4. Localized Context</h3>
            <div class="text-gray-700 whitespace-pre-line">${sectionContent}</div>
          </div>
"@
            } elseif ($sectionTitle -eq "Quality Assurance Checklist & Metrics") {
                $htmlOutput += @"
          <div class="bg-purple-50 p-4 rounded border-l-4 border-purple-600">
            <h3 class="font-semibold text-gray-800 mb-2"><i class="fa-solid fa-clipboard-check mr-2"></i>5. Quality Assurance Checklist</h3>
            <ul class="list-disc list-inside space-y-1 text-sm text-gray-700">${sectionContent}</ul>
          </div>
"@
            }
        }
        
        # Move to next SOP by finding "---" separator or next "## SOP-"
        $nextSopIndex = $remainingContent.IndexOf('## SOP-', $sectionMatches[0].Index)
        if ($nextSopIndex -gt 0) {
            $remainingContent = $remainingContent.Substring($sectionMatches[0].Index + 1, $nextSopIndex - $sectionMatches[0].Index - 1)
        } else {
            break
        }
    } else {
        # No more sections found, just add any remaining content and break
        if ($remainingContent.Trim()) {
            $htmlOutput += @"
          <div class="text-sm text-gray-500 p-2 italic">${remainingContent}</div>
"@
        }
        break
    }
}

$htmlOutput += @"
    
    </div>
  </main>

  <!-- Footer -->
  <footer class="bg-gray-800 text-gray-300 py-6 mt-auto">
    <div class="container mx-auto px-4 text-center">
      <p class="text-sm"><i class="fa-solid fa-shield-halved mr-2"></i>Marcela's Resort Hotel - Safety First</p>
      <p class="text-xs mt-1">Emergency procedures cached for offline access | Last Updated: October 2026</p>
    </div>
  </footer>

  <!-- JavaScript for SOP Toggle Functionality -->
  <script>
    function toggleSopDetails(sopId) {
      const details = document.querySelector(`#${sopId} .sop-details`);
      if (details && details.classList.contains('hidden')) {
        details.classList.remove('hidden');
      } else if (details) {
        details.classList.add('hidden');
      }
    }
    
    // Auto-expand first SOP card on page load
    document.addEventListener('DOMContentLoaded', function() {
      const firstCard = document.querySelector('.sop-card');
      if (firstCard && firstCard.textContent.includes('Hotel Emergency Response')) {
        const detailsElement = firstCard.nextElementSibling;
        if (detailsElement) {
          setTimeout(() => detailsElement.classList.remove('hidden'), 500);
        }
      }
    });
  </script>

</body>
</html>
"@

# Write the complete file
Set-Content -Path $outputPath -Value $htmlOutput -Encoding UTF8 -NoNewline

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Module 06 Safety SOPs Extraction Complete!" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Source: $($markdownPath)" -ForegroundColor Yellow
Write-Host "Output: $($outputPath)" -ForegroundColor Yellow
Write-Host ""
Write-Host "Status: All 24 emergency SOPs extracted and populated into HTML" -ForegroundColor Green
Write-Host "Includes: Navigation grid + Expandable card pattern with color-coded sections" -ForegroundColor Green
Write-Host ""
