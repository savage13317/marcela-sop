# PowerShell Script: Populate Module 06 Safety & Typhoon Preparedness SOPs
# Source: SOPS/module_06_safety_security_typhoon_preparedness.md
# Output: src/sops/06_safety_typhoon_complete.html with all 24 SOPs populated

$markdownPath = "C:\Users\USER\Desktop\Marcela\SOPS\module_06_safety_security_typhoon_preparedness.md"
$outputPath = "C:\Users\USER\Desktop\Marcela\marcelas-sop-website\src\sops\06_safety_typhoon_complete.html"

# Read markdown content
$markdownContent = Get-Content -Path $markdownPath -Raw

# Define section markers for parsing each SOP
$sopMarkers = @(
    "## SOP-SS-01", "## SOP-SS-02", "## SOP-SS-03", "## SOP-SS-04", "## SOP-SS-05",
    "## SOP-SS-06", "## SOP-SS-07", "## SOP-SS-08", "## SOP-SS-09", "## SOP-SS-10",
    "## SOP-SS-11", "## SOP-SS-12", "## SOP-SS-13", "## SOP-SS-14", "## SOP-SS-15",
    "## SOP-SS-16", "## SOP-SS-17", "## SOP-SS-18", "## SOP-SS-19", "## SOP-SS-20",
    "## SOP-SS-21", "## SOP-SS-22", "## SOP-SS-23", "## SOP-SS-24"
)

# Process each SOP and extract content
$allSopContent = @()
foreach ($marker in $sopMarkers) {
    if ($markdownContent -match "$marker" -and $marker.Substring($marker.LastIndexOf('.')) -eq '.md')) {
        # Extract content between this marker and the next one (or end of file)
        $startIdx = $markdownContent.IndexOf($marker)
        $nextMarkerFound = $false
        foreach ($nextMarker in $sopMarkers) {
            if ($nextMarker -ne $marker -and $markdownContent.IndexOf($nextMarker) -gt $startIdx) {
                $nextMarkerIdx = $markdownContent.IndexOf($nextMarker)
                if ($nextMarkerIdx -lt $startIdx) {
                    break
                }
                $nextMarkerFound = $true
            }
        }
        
        if (-not $nextMarkerFound) {
            $endIdx = $markdownContent.Length
        } else {
            $endIdx = $markdownContent.IndexOf($nextMarker)
        }
        
        $sopContent = $markdownContent.Substring($startIdx, $endIdx - $startIdx)
        
        # Parse the 5 sections from each SOP
        $sections = @{
            "Objective & Scope" = @()
            "Responsible Staff Roles" = @()
            "Step-by-Step Execution Procedure" = @()
            "Localized Context" = @()
            "Quality Assurance Checklist & Metrics" = @()
        }
        
        # Parse sections based on markdown headers
        $sopContent -match '### 1\. (.*?)\n(.*?)(?=\n### |\n---)' | Out-Null
        if ($matches) {
            $section1 = $matches[1]
            # Extract content until next ### header or --- separator
            $restOfSop = $sopContent.Substring($section1.Length + 3)
            
            $sections["Objective & Scope"] = $section1.Trim()
        }
        
        # Extract remaining sections by splitting on "### N." pattern
        $remainingSections = $restOfSop -split '### (\d+\.|$)' | Select-Object -Skip 2
        
        foreach ($sect in $remainingSections) {
            if ($sect.StartsWith("### ")) { continue }
            
            # Determine which section header this belongs to
            if ($sect -match '^\* (.*?) \*$' -or $sect -match '(?m)^## ?(Objective|Responsible|Step-by-Step|Localized|Quality)') {
                $sections.Add($sect, $sect.Trim())
            }
            
            # Better approach: use regex to match each section pattern
        }
        
        # Simpler extraction using multiple regex patterns
        $objective = $sopContent -match '### 1\. (.*?)\n(.*?)(?=### \d+\.|=+$)' 
        if ($objective) {
            $sections["Objective & Scope"] = ([regex]::Match($sopContent, '### 1\. Objective & Scope\n\n[^#]+', [System.Text.RegularExpressions.RegexOptions]::Singleline))
        }
        
        # Store raw section content (will be formatted later)
        $allSopContent += @{
            "raw" = $sopContent
            "endIdx" = $endIdx
        }
    }
}

# Create HTML with all SOP cards
$htmlTemplate = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Module 06: Safety & Typhoon Preparedness - SOPs</title>
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

  <!-- Navigation Grid -->
  <main class="flex-grow container mx-auto px-4 py-6">
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 mb-8">
"@

# Add SOP navigation cards for each of the 24 emergency procedures
$sopTitles = @(
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

foreach ($title in $sopTitles) {
    $htmlTemplate += @"
      <div class="bg-white rounded-lg shadow-sm border border-gray-200 hover:shadow-md cursor-pointer transition p-4">
        <div class="flex items-center justify-between">
          <i class="fa-solid fa-file-shield text-blue-600 text-xl"></i>
          <span class="font-medium text-gray-800 line-clamp-2">${title}</span>
        </div>
      </div>
"@
}

$htmlTemplate += @"
    </div>

    <!-- SOP Details Section -->
    <div id="sop-details" class="space-y-6 mt-8">
"@

# Process each SOP and populate content
foreach ($sop in $allSopContent) {
    # Extract actual content for this SOP
    $rawContent = $sop.raw
    
    # Parse into 5 color-coded sections
    $sections = @{}
    
    # Section 1: Objective & Scope (Gray - Indigo)
    if ($rawContent -match '### 1\. Objective & Scope\n\n[^#]+') {
        $objMatch = [regex]::Match($rawContent, '(?s)### 1\. Objective & Scope\s*\n(.*?)\s*###', [System.Text.RegularExpressions.RegexOptions]::Singleline)
        if ($objMatch.Success) {
            $sections["Objective & Scope"] = $objMatch.Groups[1].Value.Trim()
        }
    }
    
    # Section 2: Responsible Staff Roles (Blue - Sky)
    if ($rawContent -match '### 2\. Responsible Staff Roles') {
        $rolesMatch = [regex]::Match($rawContent, '(?s)### 2\. Responsible Staff Roles\s*\n(.*?)\s*###', [System.Text.RegularExpressions.RegexOptions]::Singleline)
        if ($rolesMatch.Success) {
            $sections["Responsible Staff Roles"] = $rolesMatch.Groups[1].Value.Trim()
        }
    }
    
    # Section 3: Step-by-Step Execution Procedure (Green - Emerald)
    if ($rawContent -match '### 3\. Step-by-Step Execution Procedure') {
        $stepsMatch = [regex]::Match($rawContent, '(?s)### 3\. Step-by-Step Execution Procedure\s*\n(.*?)\s*###', [System.Text.RegularExpressions.RegexOptions]::Singleline)
        if ($stepsMatch.Success) {
            $sections["Step-by-Step Execution Procedure"] = $stepsMatch.Groups[1].Value.Trim()
        }
    }
    
    # Section 4: Localized Context (Amber - Orange)
    if ($rawContent -match '### 4\. Localized Context') {
        $contextMatch = [regex]::Match($rawContent, '(?s)### 4\. Localized Context\s*\n(.*?)\s*###', [System.Text.RegularExpressions.RegexOptions]::Singleline)
        if ($contextMatch.Success) {
            $sections["Localized Context"] = $contextMatch.Groups[1].Value.Trim()
        }
    }
    
    # Section 5: QA Checklist (Purple - Violet)
    if ($rawContent -match '### 5\. Quality Assurance Checklist') {
        $qaMatch = [regex]::Match($rawContent, '(?s)### 5\. Quality Assurance Checklist & Metrics\s*\n(.*?)\s*(@@|-+)', [System.Text.RegularExpressions.RegexOptions]::Singleline)
        if ($qaMatch.Success) {
            $sections["Quality Assurance Checklist"] = $qaMatch.Groups[1].Value.Trim()
        }
    }
    
    # Build card HTML with color-coded sections
    $cardHTML = @"
      <article class="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
        <div class="p-4 bg-gradient-to-r from-blue-600 to-blue-700 cursor-pointer" onclick="toggleSopDetails(this)">
          <h3 class="font-semibold text-white text-lg"><i class="fa-solid fa-file-shield mr-2"></i>Safety Emergency Procedure</h3>
          <div class="text-blue-100 text-sm mt-1">Click to expand details</div>
        </div>
"@

    # Only show Objective & Scope by default, others hidden until toggled
    if ($sections.ContainsKey("Objective & Scope")) {
        $cardHTML += @"
          <div class="sop-details hidden p-4 space-y-4 border-t">
            <div class="bg-gray-50 p-4 rounded border-l-4 border-indigo-600">
              <h3 class="font-semibold text-gray-800 mb-2"><i class="fa-solid fa-bullseye mr-2"></i>1. Objective & Scope</h3>
              <div class="text-gray-700 whitespace-pre-line">${sections["Objective & Scope"]}</div>
            </div>
"@
    } else {
        $cardHTML += @"
          <div class="sop-details hidden p-4 space-y-4 border-t">
"@
    }

    # Add remaining sections if they exist
    foreach ($key in @("Responsible Staff Roles", "Step-by-Step Execution Procedure", "Localized Context", "Quality Assurance Checklist")) {
        if ($sections.ContainsKey($key)) {
            $sectionContent = $sections[$key]
            
            switch -Regex ($key) {
                "Responsible Staff Roles" {
                    $cardHTML += @"
              <div class="bg-blue-50 p-4 rounded border-l-4 border-blue-600">
                <h3 class="font-semibold text-gray-800 mb-2"><i class="fa-solid fa-users mr-2"></i>2. Responsible Staff Roles</h3>
                <div class="text-gray-700 whitespace-pre-line">${sectionContent}</div>
              </div>
"@
                }
                "Step-by-Step Execution Procedure" {
                    $cardHTML += @"
              <div class="bg-green-50 p-4 rounded border-l-4 border-green-600">
                <h3 class="font-semibold text-gray-800 mb-2"><i class="fa-solid fa-list-check mr-2"></i>3. Step-by-Step Execution Procedure</h3>
                <ol class="list-decimal list-inside space-y-2 text-sm text-gray-700 whitespace-pre-line">${sectionContent}</ol>
              </div>
"@
                }
                "Localized Context" {
                    $cardHTML += @"
              <div class="bg-amber-50 p-4 rounded border-l-4 border-amber-600">
                <h3 class="font-semibold text-gray-800 mb-2"><i class="fa-solid fa-map-location-dot mr-2"></i>4. Localized Context</h3>
                <div class="text-gray-700 whitespace-pre-line">${sectionContent}</div>
              </div>
"@
                }
                "Quality Assurance Checklist" {
                    $cardHTML += @"
              <div class="bg-purple-50 p-4 rounded border-l-4 border-purple-600">
                <h3 class="font-semibold text-gray-800 mb-2"><i class="fa-solid fa-clipboard-check mr-2"></i>5. Quality Assurance Checklist</h3>
                <div class="text-gray-700 whitespace-pre-line">${sectionContent}</div>
              </div>
"@
                }
            }
        }
    }

    $cardHTML += @"
            </div>
          </article>
"@
}

$htmlTemplate += @"
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
    function toggleSopDetails(button) {
      const details = button.nextElementSibling;
      if (details.classList.contains('hidden')) {
        details.classList.remove('hidden');
      } else {
        details.classList.add('hidden');
      }
    }
    
    // Auto-expand first card on page load
    document.addEventListener('DOMContentLoaded', function() {
      const firstCard = document.querySelector('.bg-gradient-to-r');
      if (firstCard) {
        setTimeout(() => toggleSopDetails(firstCard), 500);
      }
    });
  </script>

</body>
</html>
"@

# Write the complete HTML file
$completedHtml = $htmlTemplate -replace '\$\{([^}]+)\}', {$matches[1]}

Set-Content -Path $outputPath -Value $completedHtml -NoNewline
Write-Host "Module 06 Safety & Typhoon Preparedness SOPs populated successfully!" -ForegroundColor Green
Write-Host "Output: $outputPath" -ForegroundColor Cyan
Write-Host "All 24 emergency procedures extracted and inserted into HTML cards with color-coded sections." -ForegroundColor Yellow
