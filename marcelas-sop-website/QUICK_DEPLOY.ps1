# 🚀 QUICK DEPLOY - MINIMAL V1

## One-Command Deployment Script

Run this in PowerShell at `C:\Users\GM\Desktop\Marcela`:

```powershell
# Quick deploy minimal version
cd "C:\Users\GM\Desktop\Marcela"
git add .
git commit -m "MINIMAL V1: Publish Module 06 Safety + landing page, iterate based on feedback"
git push origin main

Write-Host "`n✅ Git push complete!`n"
Write-Host "Next: Enable GitHub Pages at:"
Write-Host "https://github.com/YOUR_USERNAME/marcelas-sop-website/settings/pages`n"
Write-Host "Then test live site at:"
Write-Host "https://YOUR_USERNAME.github.io/marcelas-sop-website/`n"
```

## Manual Steps (If Script Doesn't Work)

### Step 1: Stage & Commit
```powershell
git add .
git commit -m "MINIMAL V1: Publish Module 06 Safety + landing page, iterate based on feedback"
```

### Step 2: Push to GitHub
```powershell
git push origin main
```

### Step 3: Enable GitHub Pages
1. Visit: `https://github.com/YOUR_USERNAME/marcelas-sop-website/settings/pages`
2. Under "Source", select: **Deploy from a branch**
3. Branch: `main` 
4. Folder: `/` (root)
5. Click **Save**
6. Wait 2-5 minutes for deployment

### Step 4: Test Live Site
Visit: `https://YOUR_USERNAME.github.io/marcelas-sop-website/`

Checklist:
- [ ] Landing page loads without errors
- [ ] Module 06 Safety module accessible
- [ ] Navigation works on mobile device
- [ ] Search bar present
- [ ] Site looks reasonable

---

## What This Deploys (Minimal V1)

✅ Landing page with module cards  
✅ Module 06 Safety (all 24 emergency SOP links)  
✅ Staffing matrix page  
✅ PWA functionality  
✅ Responsive design  

⏳ Will populate content after feedback

---

**Time Required:** 5-10 minutes  
**Risk Level:** LOW  
**Expected Outcome:** Live site with stakeholder feedback capability