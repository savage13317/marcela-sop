# ✅ GITHUB PAGES DEPLOYMENT CHECKLIST

## Phase 1: Create Repository on GitHub (DO IN BROWSER)

### Step 1: Open GitHub New Repository Page
```
https://github.com/new
```

### Step 2: Fill In Form
- **Repository name:** `marcelas-sop-website`
- **Description:** `Marcela's Resort Hotel SOPs & Staffing Documentation`
- **Visibility:** ✅ **Public** (anyone can view)
- **Initialize with README:** ❌ Uncheck

### Step 3: Click "Create repository" button

**Expected Result:** Success message + redirect to new repo page

---

## Phase 2: Push Code to GitHub (DO IN POWERSHELL)

### Commands to Run:
```powershell
cd "C:\Users\GM\Desktop\Marcela"

# Add remote repository
git remote add origin https://github.com/savage13317/marcelas-sop-website.git

# Set main as default branch
git branch -M main

# Push all code
git push -u origin main
```

### Expected Output:
```
Enumerating objects: 100, from cache
Counting objects: 100% (71), done
Delta compression using up to 8 threads
Compressing objects: 100% (65), done
Writing objects: 100% (123), 12.34 KiB | 1.23 MiB/s, done
Total 123 (delta 65), reused 0 (delta 0)
remote: Resolving delta
remote: Total 123 (delta 65), reused 0 (delta 0)
To https://github.com/savage13317/marcelas-sop-website.git
 * [new branch]      main -> main
```

**Success Indicators:**
- ✅ No errors in output
- ✅ "main -> main" appears
- ✅ Terminal returns to prompt

---

## Phase 3: Enable GitHub Pages (DO IN BROWSER)

### Step 1: Navigate to Pages Settings
```
https://github.com/savage13317/marcelas-sop-website/settings/pages
```

### Step 2: Configure Source
- **Source:** ✅ "Deploy from a branch"
- **Branch:** `main`
- **Folder:** `/` (root)

### Step 3: Click "Save"

### Step 4: Wait for Build
- Status shows: "Building..." → "Deployed!"
- Takes 2-5 minutes

---

## Phase 4: Test Live Website

### Your Live URL:
```
https://savage13317.github.io/marcelas-sop-website/
```

### Test Checklist:
- [ ] Site loads without errors
- [ ] Landing page displays module cards
- [ ] Module 06 Safety navigation grid visible
- [ ] Search bar present
- [ ] Navigation works on mobile device

---

## Phase 5: Test on Mobile Device (PWA)

### Android:
1. Open site in Chrome
2. Tap menu (⋮) → "Install app"
3. Should install successfully

### iPhone:
1. Open site in Safari
2. Tap share button (□ with arrow)
3. Select "Add to Home Screen"
4. Test from home screen

### Offline Mode Test:
1. Toggle airplane mode ON
2. Site should still load cached content
3. Module 06 Safety accessible

---

## 🎉 SUCCESS CRITERIA

You've successfully deployed when:
- ✅ Live URL works on desktop browser
- ✅ Site loads without console errors
- ✅ All module cards visible
- ✅ Mobile responsive design works
- ✅ PWA install prompt appears (optional)
- ✅ Stakeholders can access via link

---

## 📊 DEPLOYMENT SUMMARY

| Component | Status | Notes |
|-----------|--------|-------|
| Git Repository | ⏳ Pending | Create on GitHub first |
| Code Push | ⏳ Pending | Run push commands after repo created |
| GitHub Pages | ⏳ Pending | Enable after push succeeds |
| Live Site Test | ⏳ Pending | Test after Pages deploy |

---

## 🚀 QUICK START (Copy-Paste)

### Browser Tab 1: Create Repository
```
https://github.com/new
```

### Terminal Commands (After Repo Created):
```powershell
cd "C:\Users\GM\Desktop\Marcela"
git remote add origin https://github.com/savage13317/marcelas-sop-website.git
git branch -M main
git push -u origin main
```

### Browser Tab 2: Enable Pages
```
https://github.com/savage13317/marcelas-sop-website/settings/pages
```

### Browser Tab 3: Test Live Site
```
https://savage13317.github.io/marcelas-sop-website/
```

---

**Last Updated:** October 10, 2026  
**Estimated Time:** 10-15 minutes total