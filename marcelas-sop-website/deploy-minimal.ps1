# Quick Deploy - Minimal V1
# Run this script to deploy minimal viable version for testing

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  MINIMAL V1 DEPLOYMENT SCRIPT" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$projectPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $projectPath

Write-Host "[INFO] Current directory: $($PWD.Path)" -ForegroundColor Green
Write-Host ""

# Step 1: Check git status
Write-Host "[STEP 1] Checking git status..." -ForegroundColor Yellow

if (-not (Test-Path ".git")) {
    Write-Host "[WARN] Git repository not found. Initializing..." -ForegroundColor Red
    git init
    Write-Host "[OK] Git repository initialized" -ForegroundColor Green
} else {
    Write-Host "[OK] Git repository exists" -ForegroundColor Green
}

Write-Host ""

# Step 2: Configure git user (run once)
Write-Host "[STEP 2] Configuring git user..." -ForegroundColor Yellow

$gitName = if ($env:USERPROFILE) { Split-Path -Leaf $env:USERPROFILE } else { "Unknown" }
$gitEmail = if ($env:EMAIL) { $env:EMAIL } else { "you@example.com" }

Write-Host "[INFO] Using user: $($gitName)" -ForegroundColor Cyan
Write-Host "[INFO] Using email: $($gitEmail)" -ForegroundColor Cyan

git config user.name "$($gitName)"
git config user.email "$($gitEmail)"

Write-Host "[OK] Git user configured" -ForegroundColor Green
Write-Host ""

# Step 3: Stage all changes
Write-Host "[STEP 3] Staging all changes..." -ForegroundColor Yellow

git add .

$untracked = git status --porcelain | Where-Object { $_ -match "^?" }
if ($untracked) {
    Write-Host "[WARN] Untracked files will be included in commit" -ForegroundColor Yellow
}

Write-Host "[OK] All changes staged" -ForegroundColor Green
Write-Host ""

# Step 4: Commit changes
Write-Host "[STEP 4] Committing changes..." -ForegroundColor Yellow

$commitMessage = "MINIMAL V1: Publish Module 06 Safety + landing page, iterate based on feedback"

git commit -m $commitMessage

Write-Host "[OK] Changes committed" -ForegroundColor Green
Write-Host ""

# Step 5: Add remote (if not exists)
Write-Host "[STEP 5] Checking remote repository..." -ForegroundColor Yellow

$remotes = git remote -v
if (-not $remotes) {
    Write-Host "[WARN] No remote repository configured" -ForegroundColor Red
    Write-Host "[INFO] To add remote, run:" -ForegroundColor Cyan
    Write-Host "  git remote add origin https://github.com/YOUR_USERNAME/marcelas-sop-website.git" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Script stopping. Please configure remote manually." -ForegroundColor Red
    exit 1
} else {
    Write-Host "[OK] Remote repository configured:" -ForegroundColor Green
    $remotes | ForEach-Object { Write-Host "  $_" -ForegroundColor Green }
    Write-Host ""
}

# Step 6: Push to GitHub
Write-Host "[STEP 6] Pushing to GitHub..." -ForegroundColor Yellow

git push origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  ✅ DEPLOYMENT SUCCESSFUL!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "[INFO] GitHub Pages will be available at:" -ForegroundColor Cyan
    Write-Host "https://$(Split-Path -Leaf (git remote get-url origin | Select-String 'github.com' -AllMatches).Matches.Value).io/marcelas-sop-website/" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "[INFO] Enable GitHub Pages:" -ForegroundColor Cyan
    Write-Host "1. Visit: https://github.com/YOUR_USERNAME/marcelas-sop-website/settings/pages" -ForegroundColor Yellow
    Write-Host "2. Set source to 'main' branch at root '/'" -ForegroundColor Yellow
    Write-Host "3. Click 'Save'" -ForegroundColor Yellow
    Write-Host "4. Wait 2-5 minutes for deployment" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "[NEXT] Test live site on mobile device!" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "  ❌ PUSH FAILED!" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "[ERROR] Check for authentication issues:" -ForegroundColor Red
    Write-Host "- Repository may be private (needs auth)" -ForegroundColor Yellow
    Write-Host "- Network connectivity issues" -ForegroundColor Yellow
    Write-Host "- Remote URL incorrect" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "[SUGGESTION] Try using GitHub CLI:" -ForegroundColor Cyan
    Write-Host "  gh auth login" -ForegroundColor Cyan
    Write-Host "  gh repo clone YOUR_USERNAME/marcelas-sop-website" -ForegroundColor Cyan
    Write-Host ""
}

Write-Host ""
Write-Host "Script completed." -ForegroundColor Gray