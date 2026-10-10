# 🌐 GITHUB REPOSITORY SETUP GUIDE - STEP BY STEP

## Overview
We need to create a GitHub repository first, then push our code to it.

---

## 🔴 CRITICAL: CREATE REPOSITORY ON GITHUB FIRST

### Step 1: Open GitHub in Browser
**Open this URL in your browser:**
```
https://github.com/new
```

### Step 2: Fill Out Repository Creation Form

| Field | What to Enter | Notes |
|-------|---------------|--------|
| **Repository name** | `marcelas-sop-website` | No spaces, lowercase recommended |
| **Description** | `Marcela's Resort Hotel SOPs & Staffing Documentation` | Brief description |
| **Visibility** | ✅ Select **"Public"** | Anyone can view the SOP website |
| **Initialize with README** | ❌ Uncheck this | We already have README in our folder |

### Step 3: Click "Create repository" button

Wait for success message: "Congratulations! Your repository has been created."

---

## ✅ VERIFY REPOSITORY CREATED

1. You'll be redirected to your new repository page
2. URL should look like: `https://github.com/savage13317/marcelas-sop-website`
3. You should see:
   - README.md file (empty since we unchecked initialization)
   - "About" section with our description
   - Green checkmark on repository name

---

## 📤 STEP 4: PUSH CODE TO GITHUB

Once repository is created, run these commands in PowerShell:

```powershell
cd "C:\Users\GM\Desktop\Marcela"

# Add the remote repository (the one we just created)
git remote add origin https://github.com/savage13317/marcelas-sop-website.git

# Set main as default branch
git branch -M main

# Push all code to GitHub
git push -u origin main
```

### Expected Output:
```
Enumerating objects: 100, from cache
Counting objects: 100% (71), done
Delta compression using up to 8 threads
Compressing objects: 100% (65), done
Writing objects: 100% (123), 12.34 KiB | 1.23 MiB/s, done
Total 123 (delta 65), reused 0 (delta 0), pack-reused 0
remote: Resolving delta
remote: Total 123 (delta 65), reused 0 (delta 0), pack-reused 0
To https://github.com/savage13317/marcelas-sop-website.git
 * [new branch]      main -> main
```

---

## 🌐 STEP 5: ENABLE GITHUB PAGES

### Step 5.1: Navigate to Pages Settings

**Visit this URL:**
```
https://github.com/savage13317/marcelas-sop-website/settings/pages
```

### Step 5.2: Configure Source

In the "Source" section:
- **Source:** Select ✅ **"Deploy from a branch"**
- **Branch:** Select `main` 
- **Folder:** Select `/` (root folder)

Click **"Save"** button

### Step 5.3: Wait for Deployment

GitHub will build your site. You'll see status messages:
- "Building..." (takes 1-2 minutes)
- "Deployed!" when complete

---

## 🎉 STEP 6: TEST LIVE WEBSITE

### Your Live Site URL:
```
https://savage13317.github.io/marcelas-sop-website/
```

**OR** (GitHub Pages format):
```
https://savage13317.github.io/marcelas-sop-website/
```

### Test Checklist:
- [ ] Site loads without errors
- [ ] Landing page displays module cards
- [ ] Module 06 Safety navigation grid visible
- [ ] Search bar present
- [ ] Navigation works on mobile device
- [ ] PWA install prompt appears (optional)

---

## 📱 STEP 7: TEST ON MOBILE DEVICE

### To verify PWA functionality:

1. **Open live site on phone:**
   ```
   https://savage13317.github.io/marcelas-sop-website/
   ```

2. **Android (Chrome):**
   - Tap menu (⋮) → "Install app" or "Add to Home screen"
   - Should install as standalone app

3. **iPhone (Safari):**
   - Tap share button (□ with arrow)
   - Select "Add to Home Screen"
   - Open from home screen for app-like experience

4. **Test Offline Mode:**
   - Toggle airplane mode ON
   - Site should still load cached content
   - Module 06 Safety should be accessible

---

## 🆘 TROUBLESHOOTING

### Error: "Repository not found" when pushing
**Cause:** Repository doesn't exist on GitHub yet  
**Solution:** Go back to Step 1 and create repository first

### Error: "Permission denied"
**Cause:** Repository is private but you're not authenticated  
**Solution:** Make repository Public OR use Personal Access Token

### Pages not deploying?
**Wait time:** GitHub Pages can take 2-5 minutes to build  
**Check:** Look at "Actions" tab for build logs

### Site shows 404 Not Found
**Cause:** GitHub Pages hasn't finished building yet  
**Solution:** Wait 5 minutes and refresh browser

---

## 📊 WHAT YOU'VE ACHIEVED

After successful deployment:
- ✅ Repository created on GitHub
- ✅ All code pushed to remote
- ✅ GitHub Pages enabled
- ✅ Live website accessible at URL
- ✅ PWA functionality tested
- ✅ Ready for stakeholder feedback

---

## 🎯 NEXT STEPS (After First Launch)

Once site is live and you've tested it:

### Week 1-2: Gather Feedback
Ask users:
1. "What's the first thing you'd search for?"
2. "Is Module 06 Safety easy to find?"
3. "Does the design work on your phone/tablet?"
4. "What SOPs are most critical to have populated?"

### Week 3-4: Populate Critical Content
Based on feedback, add full content to:
- Top 5 most-searched SOPs
- Module 06 Safety procedures
- Any missing critical procedures

### Month 2+: Complete Full Site
Populate remaining modules incrementally.

---

## 🚀 READY TO START?

**Action Required:** Open browser and go to `https://github.com/new` to create repository first!

Then return here and run push commands.

---

**Last Updated:** October 10, 2026  
**Status:** Ready for GitHub repository creation