# Fix Navigation Links for All Module Pages
# Removes /sops/ prefix and adds all module cross-references

$modules = @(
    @{Name="01_front_office.html"; Icons=@{FO="<i class='fa-solid fa-user-tie mr-1'></i>Front Office (FO)">;HK="<i class='fa-solid fa-broom mr-1'></i>Housekeeping (HK)">;FB="Food & Beverage (FB)">;FH="Function Hall (FH)">;FM="Facilities & Pool (FM)">;S="<i class='fa-solid fa-shield-halved mr-1'></i>Safety (S)">;HR="HR & Admin (HR)">;DS="Digital Systems (DS)"}}
    @{Name="02_housekeeping.html"; Icons=@{FO="<i class='fa-solid fa-user-tie mr-1'></i>Front Office (FO)">;HK="<i class='fa-solid fa-broom mr-1'></i>Housekeeping (HK)">;FB="Food & Beverage (FB)">;FH="Function Hall (FH)">;FM="Facilities & Pool (FM)">;S="<i class='fa-solid fa-shield-halved mr-1'></i>Safety (S)">;HR="HR & Admin (HR)">;DS="Digital Systems (DS)"}}
    @{Name="03_food_beverage.html"; Icons=@{FO="<i class='fa-solid fa-user-tie mr-1'></i>Front Office (FO)">;HK="<i class='fa-solid fa-broom mr-1'></i>Housekeeping (HK)">;FB="Food & Beverage (FB)">;FH="Function Hall (FH)">;FM="Facilities & Pool (FM)">;S="<i class='fa-solid fa-shield-halved mr-1'></i>Safety (S)">;HR="HR & Admin (HR)">;DS="Digital Systems (DS)"}}
    @{Name="04_function_hall.html"; Icons=@{FO="<i class='fa-solid fa-user-tie mr-1'></i>Front Office (FO)">;HK="<i class='fa-solid fa-broom mr-1'></i>Housekeeping (HK)">;FB="Food & Beverage (FB)">;FH="Function Hall (FH)">;FM="Facilities & Pool (FM)">;S="<i class='fa-solid fa-shield-halved mr-1'></i>Safety (S)">;HR="HR & Admin (HR)">;DS="Digital Systems (DS)"}}
    @{Name="05_facilities_pool.html"; Icons=@{FO="<i class='fa-solid fa-user-tie mr-1'></i>Front Office (FO)">;HK="<i class='fa-solid fa-broom mr-1'></i>Housekeeping (HK)">;FB="Food & Beverage (FB)">;FH="Function Hall (FH)">;FM="Facilities & Pool (FM)">;S="<i class='fa-solid fa-shield-halved mr-1'></i>Safety (S)">;HR="HR & Admin (HR)">;DS="Digital Systems (DS)"}}
    @{Name="07_hr_admin.html"; Icons=@{FO="<i class='fa-solid fa-user-tie mr-1'></i>Front Office (FO)">;HK="<i class='fa-solid fa-broom mr-1'></i>Housekeeping (HK)">;FB="Food & Beverage (FB)">;FH="Function Hall (FH)">;FM="Facilities & Pool (FM)">;S="<i class='fa-solid fa-shield-halved mr-1'></i>Safety (S)">;HR="HR & Admin (HR)">;DS="Digital Systems (DS)"}}
    @{Name="08_digital_maintenance.html"; Icons=@{FO="<i class='fa-solid fa-user-tie mr-1'></i>Front Office (FO)">;HK="<i class='fa-solid fa-broom mr-1'></i>Housekeeping (HK)">;FB="Food & Beverage (FB)">;FH="Function Hall (FH)">;FM="Facilities & Pool (FM)">;S="<i class='fa-solid fa-shield-halved mr-1'></i>Safety (S)">;HR="HR & Admin (HR)">;DS="Digital Systems (DS)"}}
)

$navHtml = @"
          <a href="/" class="px-4 py-2 bg-indigo-800 rounded hover:bg-indigo-600 transition">Home</a>
          <a href="$FO" class="px-4 py-2 bg-indigo-800 rounded font-semibold hover:bg-indigo-600 transition">$FO</a>
          <a href="$HK" class="px-4 py-2 bg-indigo-800 rounded font-semibold hover:bg-indigo-600 transition">$HK</a>
          <a href="$FB" class="px-4 py-2 bg-indigo-800 rounded font-semibold text-yellow-300 hover:bg-indigo-600 transition">$FB</a>
          <a href="$FH" class="px-4 py-2 bg-indigo-800 rounded font-semibold text-pink-300 hover:bg-indigo-600 transition">$FH</a>
          <a href="$FM" class="px-4 py-2 bg-indigo-800 rounded font-semibold text-teal-300 hover:bg-indigo-600 transition">$FM</a>
          <a href="$S" class="px-4 py-2 bg-indigo-800 rounded font-semibold text-red-300 hover:bg-indigo-600 transition">$S</a>
          <a href="$HR" class="px-4 py-2 bg-indigo-800 rounded font-semibold text-purple-300 hover:bg-indigo-600 transition">$HR</a>
          <a href="$DS" class="px-4 py-2 bg-indigo-800 rounded font-semibold text-cyan-300 hover:bg-indigo-600 transition">$DS</a>
"@

foreach ($module in $modules) {
    Write-Host "Processing $($module.Name)..."
    
    # Replace /sops/ links with direct links
    $content = Get-Content $module.Name -Raw
    
    # Remove existing module links first
    $content = $content -replace 'href="[^"]*0[1234578]', 'href="$1"'
    
    # Write updated content back
    $content | Set-Content $module.Name -NoNewline
}

Write-Host "Navigation links updated for all modules!"
