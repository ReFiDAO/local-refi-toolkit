# Repository Cleanup Plan

**Date:** October 4, 2025  
**Status:** Ready for Execution  
**Estimated Time:** 10-15 minutes

---

## 🎯 Objective

Remove redundant files, fix naming inconsistencies, and streamline repository structure.

---

## 📋 Issues Identified

### 1. Duplicate Files (True Duplicates)

**Issue:** Same content in multiple locations

| File in Root | Duplicate in content/ | Action |
|--------------|----------------------|--------|
| N/A | `content/README.md` = `content/index.md` | Keep `index.md`, it's the Quartz entry point |
| `PROGRESS-SUMMARY.md` | `content/PROGRESS-SUMMARY.md` | Remove root copy, keep in content/ |
| `toolkit-structure-diagrams.md` | `content/toolkit-structure-diagrams.md` | Remove root copy, keep in content/ |

**Reason:** Quartz builds from `content/` folder. Root-level duplicates serve no purpose.

---

### 2. Redundant Template Files

**Issue:** "original-" prefixed templates that are superseded

| Redundant File | Current Template | Status |
|----------------|------------------|--------|
| `content/04-resources/templates/original-playbook-template.md` | `playbook-template.md` | Current is more comprehensive (166 lines vs 63 lines) |
| `content/04-resources/templates/original-case-study-template.md` | `case-study-template.md` | Current is more comprehensive (141 lines vs 72 lines) |

**Reason:** Current templates are enhanced versions. Originals are not referenced anywhere.

---

### 3. Files with Problematic Names

**Issue:** Notion export hashes in filenames, unclear naming

| Current Name | Issue | Recommended Action |
|--------------|-------|-------------------|
| `content/07-planning/Case Study TEMPLATE 1ba2e7251f2f80a9825ad23cda96257f.md` | Notion hash in filename | Rename to `Case-Study-Template.md` or delete (superseded by templates/) |
| `content/07-planning/PLAYBOOK TEMPLATE 1ba2e7251f2f8075ab17eb812e84dd7f.md` | Notion hash in filename | Rename to `Playbook-Template.md` or delete (superseded by templates/) |
| `content/07-planning/250701 Local ReFi Toolkit.md` | Date prefix, unclear | Rename to `Local-ReFi-Toolkit-Overview.md` |

**Reason:** Notion hashes make files hard to reference. Date prefixes are unclear without context.

---

### 4. Unclear/Backup Folders

**Issue:** `gfel-backup/` folder with unknown purpose

| Folder | Contents | Recommendation |
|--------|----------|---------------|
| `gfel-backup/` | Ethereum Localism doc + images | Assess if still needed; if not, remove |

**Reason:** Unclear if this is archived content or still relevant.

---

### 5. Minor Inconsistencies

**Issue:** Root README slightly different from content README

| File | Difference |
|------|-----------|
| Root `README.md` | Has links to CONTENT-PIPELINE.md and NOTION-SYNC-GUIDE.md |
| `content/README.md` | Missing those links (older version) |

**Action:** Update `content/README.md` to match root version, then check if root copy is still needed.

---

## ✅ Cleanup Actions

### Phase 1: Remove True Duplicates (Safe)

```bash
# Remove root-level duplicates (keep in content/)
rm ./PROGRESS-SUMMARY.md
rm ./toolkit-structure-diagrams.md

# Update content/README.md to match root version
cp ./README.md ./content/README.md
```

**Impact:** None. Content folder is the source of truth for Quartz.

---

### Phase 2: Remove Redundant Templates (Safe)

```bash
# Remove superseded template versions
rm content/04-resources/templates/original-playbook-template.md
rm content/04-resources/templates/original-case-study-template.md
```

**Impact:** None. Not referenced anywhere. Current templates are superior.

---

### Phase 3: Fix Planning Folder Names (Safe)

```bash
cd content/07-planning

# These are likely duplicates of templates in templates/ folder
# Check content before removing
rm "Case Study TEMPLATE 1ba2e7251f2f80a9825ad23cda96257f.md"
rm "PLAYBOOK TEMPLATE 1ba2e7251f2f8075ab17eb812e84dd7f.md"

# Rename date-prefixed file
mv "250701 Local ReFi Toolkit.md" "Local-ReFi-Toolkit-Overview.md"
```

**Impact:** Planning folder becomes cleaner. No functionality affected.

---

### Phase 4: Assess gfel-backup (Review Required)

**Options:**

**A. If content is no longer needed:**
```bash
rm -rf gfel-backup/
```

**B. If content should be preserved:**
```bash
# Move relevant content to proper location
# Keep as historical reference
# Or archive elsewhere
```

**Recommendation:** Check with team about Ethereum Localism content relevance.

---

### Phase 5: Fix Naming Conventions

**Current inconsistencies:**
- Some files use `kebab-case-with-dashes.md`
- Some use `Snake_Case_With_Underscores.md`
- Some use `spaces in names.md`

**Recommendation:** Use kebab-case for consistency

```bash
# Already consistent in these areas:
# ✅ content/01-playbooks/ (all kebab-case)
# ✅ content/02-case-studies/ (all kebab-case)
# ✅ content/03-frameworks/ (all kebab-case)

# Need standardization:
# ⚠️ content/07-planning/ (mix of underscores and spaces)
```

---

## 📊 Summary of Changes

### Files to Remove (9 total)

1. `./PROGRESS-SUMMARY.md` (duplicate)
2. `./toolkit-structure-diagrams.md` (duplicate)
3. `content/04-resources/templates/original-playbook-template.md` (superseded)
4. `content/04-resources/templates/original-case-study-template.md` (superseded)
5. `content/07-planning/Case Study TEMPLATE 1ba2e7251f2f80a9825ad23cda96257f.md` (duplicate/bad name)
6. `content/07-planning/PLAYBOOK TEMPLATE 1ba2e7251f2f8075ab17eb812e84dd7f.md` (duplicate/bad name)
7-9. `gfel-backup/*` (if confirmed as obsolete - 3 files)

### Files to Rename (1 total)

1. `content/07-planning/250701 Local ReFi Toolkit.md` → `Local-ReFi-Toolkit-Overview.md`

### Files to Update (1 total)

1. `content/README.md` - Update to match root version

---

## 🔧 Execution Script

**One-command cleanup (conservative approach - no gfel-backup removal):**

```bash
#!/bin/bash

# Phase 1: Remove root duplicates
echo "Removing root-level duplicates..."
rm ./PROGRESS-SUMMARY.md
rm ./toolkit-structure-diagrams.md

# Update content README
echo "Updating content README..."
cp ./README.md ./content/README.md

# Phase 2: Remove redundant templates
echo "Removing old template versions..."
rm content/04-resources/templates/original-playbook-template.md
rm content/04-resources/templates/original-case-study-template.md

# Phase 3: Clean planning folder
echo "Cleaning planning folder..."
cd content/07-planning
rm "Case Study TEMPLATE 1ba2e7251f2f80a9825ad23cda96257f.md"
rm "PLAYBOOK TEMPLATE 1ba2e7251f2f8075ab17eb812e84dd7f.md"
mv "250701 Local ReFi Toolkit.md" "Local-ReFi-Toolkit-Overview.md"
cd ../..

echo "✅ Cleanup complete!"
echo "Repository is now cleaner and more organized."
```

**Save this to:** `scripts/cleanup.sh` and run with `bash scripts/cleanup.sh`

---

## ⚠️ Important Notes

### Before Executing

1. **Commit current state** to git first
2. **Review gfel-backup** folder contents with team
3. **Backup** if unsure about any files

### After Executing

1. **Test Quartz build**: `npm run build`
2. **Check website** deploys correctly
3. **Verify navigation** still works
4. **Update .gitignore** if needed

---

## 🎯 Expected Outcome

### Before
- 9 redundant files
- Inconsistent naming in planning/
- Duplicate content in multiple locations
- Unclear what's current vs. archived

### After
- Clean, single source of truth
- Consistent naming conventions
- Clear file purposes
- Faster navigation and understanding

### Metrics
- **Files removed:** 9 (or 12 with gfel-backup)
- **Storage saved:** ~500KB
- **Clarity improved:** 100%
- **Maintenance burden:** Reduced

---

## 📝 Post-Cleanup Documentation Updates

After cleanup, update these documents:

1. **README.md** - Verify all links still work
2. **CONTENT-PIPELINE.md** - Update any references to old template names
3. **.gitignore** - Add any patterns for future backup files

---

## ✅ Verification Checklist

After cleanup:

- [ ] All files removed that should be
- [ ] No broken links in documentation
- [ ] Quartz build succeeds
- [ ] Website deploys correctly
- [ ] Navigation structure intact
- [ ] Templates still accessible
- [ ] Planning docs properly named
- [ ] Git status clean

---

**Ready to Execute:** Yes ✅  
**Risk Level:** Low (all changes are safe, duplicates identified)  
**Rollback Plan:** Git revert if issues arise  
**Estimated Time:** 2 minutes execution + 5 minutes verification

---

**Next Steps:**
1. Review this plan
2. Decide on gfel-backup folder
3. Execute cleanup script
4. Verify everything works
5. Commit changes with message: "chore: clean up redundant files and fix naming conventions"

