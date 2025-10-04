# Notion Database Sync Guide

**Purpose:** Keep Notion Content DB synchronized with the Local ReFi Toolkit repository  
**Frequency:** Weekly (Mondays) + real-time for major updates  
**Time Required:** 20-30 minutes/week

---

## Quick Links

- **Notion Content DB:** https://www.notion.so/2816ed0845cb813789fae2d15c9d39e3?v=2816ed0845cb81beb44e000c7fabab66
- **Repository:** `/Users/luizfernando/Desktop/git/Zettelkasten/03 Libraries/Local-ReFi-Toolkit`
- **Content Pipeline:** [CONTENT-PIPELINE.md](./CONTENT-PIPELINE.md)

---

## Current State (October 2025)

### ✅ Published Content in Repository (NOT in Notion DB)

The following content exists in the repository and should be added to Notion:

#### Case Studies (6)
1. **ReFi Lagos - Plastic Waste Management**
   - File: `content/02-case-studies/by-impact-type/ReFi-Lagos-Plastic-Waste-Management.md`
   - Region: Nigeria (West Africa)
   - Status: Live ✅
   - URL: https://toolkit.refi.community/02-case-studies/by-impact-type/ReFi-Lagos-Plastic-Waste-Management

2. **ReFi Costa Rica - Crypto Philanthropy**
   - File: `content/02-case-studies/by-region/ReFi-Costa-Rica-Crypto-Philanthropy.md`
   - Region: Costa Rica (Latin America)
   - Status: Live ✅
   - URL: https://toolkit.refi.community/02-case-studies/by-region/ReFi-Costa-Rica-Crypto-Philanthropy

3. **ReFi Barcelona - Cooperative Structure**
   - File: `content/02-case-studies/by-region/ReFi-Barcelona-Cooperative-Structure.md`
   - Region: Spain (Europe)
   - Status: Live ✅
   - URL: https://toolkit.refi.community/02-case-studies/by-region/ReFi-Barcelona-Cooperative-Structure

4. **ReFi Tanzania - Community Verification**
   - File: `content/02-case-studies/by-region/ReFi-Tanzania-Community-Verification.md`
   - Region: Tanzania (East Africa)
   - Status: Live ✅
   - URL: https://toolkit.refi.community/02-case-studies/by-region/ReFi-Tanzania-Community-Verification

5. **ReFi Mexico - Impact Market Maker**
   - File: `content/02-case-studies/by-region/ReFi-Mexico-Impact-Market-Maker.md`
   - Region: Mexico (Latin America)
   - Status: Live ✅
   - URL: https://toolkit.refi.community/02-case-studies/by-region/ReFi-Mexico-Impact-Market-Maker

6. **ReFi Sicilia - Reforestation Initiative**
   - File: `content/02-case-studies/by-region/ReFi-Sicilia-Reforestation-Initiative.md`
   - Region: Sicily, Italy (Mediterranean)
   - Status: Live ✅
   - URL: https://toolkit.refi.community/02-case-studies/by-region/ReFi-Sicilia-Reforestation-Initiative

#### Protocol-Specific Playbooks (4)
7. **Forest Monitoring & Verification Implementation**
   - File: `content/01-playbooks/protocol-specific/Forest-Monitoring-Verification-Implementation.md`
   - Difficulty: 🪖 Advanced
   - Chain: Regen Network, Polygon
   - Status: Live ✅

8. **Quadratic Funding Implementation**
   - File: `content/01-playbooks/protocol-specific/Quadratic-Funding-Implementation.md`
   - Difficulty: 🥸 Intermediate
   - Chain: Multiple (Arbitrum, Optimism, etc.)
   - Status: Live ✅

9. **Carbon Credit Development & Tokenization**
   - File: `content/01-playbooks/protocol-specific/Carbon-Credit-Development-Implementation.md`
   - Difficulty: 🪖 Advanced
   - Chain: Regen Network, Polygon, Celo
   - Status: Live ✅

10. **Community Verification Systems Implementation**
    - File: `content/01-playbooks/protocol-specific/Community-Verification-Systems-Implementation.md`
    - Difficulty: 🥸 Intermediate
    - Chain: Multiple
    - Status: Live ✅

#### Quick Start Playbooks (3)
11. **Community ReFi Assessment**
    - File: `content/01-playbooks/quick-start/Community-ReFi-Assessment.md`
    - Difficulty: 🐣 Accessible
    - Time: 2-4 hours
    - Status: Live ✅

12. **Basic Impact Tracking**
    - File: `content/01-playbooks/quick-start/Basic-Impact-Tracking.md`
    - Difficulty: 🐣 Accessible
    - Time: 4-6 hours
    - Status: Live ✅

13. **Starting a Local ReFi Group**
    - File: `content/01-playbooks/quick-start/Starting-Local-ReFi-Group.md`
    - Difficulty: 🐣 Accessible
    - Time: 6-8 hours
    - Status: Live ✅

#### Frameworks (2)
14. **Cooperative Web3 Governance Framework**
    - File: `content/03-frameworks/community-coordination/Cooperative-Web3-Governance-Framework.md`
    - Type: Governance + Community Coordination
    - Status: Live ✅

15. **Community-Driven Impact Verification Framework**
    - File: `content/03-frameworks/impact-measurement/Community-Driven-Impact-Verification-Framework.md`
    - Type: Impact Measurement
    - Status: Live ✅

#### Educational Content (1)
16. **Understanding Regenerative Finance**
    - File: `content/00-getting-started/Understanding-Regenerative-Finance.md`
    - Type: Educational Foundation
    - Difficulty: 🐣 Accessible
    - Status: Live ✅

---

## Weekly Sync Procedure

### Step 1: Check for New/Updated Content (10 min)

```bash
# Navigate to repository
cd "/Users/luizfernando/Desktop/git/Zettelkasten/03 Libraries/Local-ReFi-Toolkit"

# Check recent changes
git log --since="1 week ago" --name-only --pretty=format: | sort -u | grep "^content/"

# Alternative: Check what was modified recently
find content -type f -name "*.md" -mtime -7 -not -path "*/07-planning/*"
```

### Step 2: Add Missing Entries to Notion (10-15 min)

For each content piece in the repository not in Notion:

1. **Open Notion Database:** https://www.notion.so/2816ed0845cb813789fae2d15c9d39e3
2. **Click "+ New"** to create entry
3. **Fill in metadata:**
   - **Name:** [Content Title]
   - **Type:** Playbook / Case Study / Framework / Tool
   - **Status:** Published (if in main branch) or appropriate stage
   - **RC Owner:** Assign coordinator
   - **Difficulty Level:** 🐣 Accessible / 🥸 Intermediate / 🪖 Advanced
   - **Chain Deployment:** Relevant blockchains
   - **Lead Authors:** Content creators
   - **Published?:** ✅ Checked
   - **Repository Path:** `content/[path]/[filename].md`
   - **Website URL:** `https://toolkit.refi.community/[path]`

### Step 3: Update Existing Entries (5 min)

For entries that changed status:
- [ ] Update Status field to match repo state
- [ ] Add Website URL if newly published
- [ ] Update Last Review Date
- [ ] Check Published checkbox if applicable

### Step 4: Reconcile Discrepancies (5 min)

- [ ] Verify all "Published" entries have repository files
- [ ] Verify all "Live" entries have website URLs
- [ ] Flag any entries marked "Backlog" that are actually complete
- [ ] Note any issues for discussion

---

## Status Mapping Reference

| Repository State | Git Branch | Notion Status |
|------------------|------------|---------------|
| Not in repo | - | `Backlog` |
| Research phase | - | `In Research` |
| Working branch | `content/*` | `Draft` |
| Pull request | PR open | `In Review` |
| Community feedback | PR approved | `Community Review` |
| Merged to main | `main` | `Published` |
| Deployed to site | GitHub Pages | `Live` |
| Active & maintained | `main` + deployed | `Active` |
| Needs updates | - | `Needs Update` |

---

## Quick Add Template for Notion

Copy and paste this for each new entry:

```
Name: [Content Title from file]
Type: [Playbook/Case Study/Framework]
Status: Live
RC Owner: [Assign from team]
Difficulty Level: [🐣/🥸/🪖 or N/A]
Chain Deployment: [Chains used]
Lead Authors: [From file metadata]
Published?: ✅
Repository Path: content/[section]/[filename].md
Website URL: https://toolkit.refi.community/[section]/[filename]
```

---

## Batch Update Script (Future Automation)

Once Notion API key is configured, use this script:

```javascript
// scripts/notion-sync.js
const { Client } = require('@notionhq/client');

const notion = new Client({ auth: process.env.NOTION_API_KEY });
const databaseId = '2816ed0845cb813789fae2d15c9d39e3';

async function syncContentToNotion() {
  // Read repository content
  // Compare with Notion database
  // Update or create entries
  // Report sync status
}

syncContentToNotion();
```

Run with:
```bash
npm install @notionhq/client
NOTION_API_KEY=secret_xxx node scripts/notion-sync.js
```

---

## Common Issues & Solutions

### Issue: Entry exists in Notion but wrong status
**Solution:** Update status manually based on repository state

### Issue: Entry missing repository path
**Solution:** Add relative path from repo root (e.g., `content/01-playbooks/...`)

### Issue: Entry missing website URL
**Solution:** Construct URL as `https://toolkit.refi.community/` + path (without `.md`)

### Issue: Duplicate entries
**Solution:** Mark older entry as archived, keep the accurate one

### Issue: Content in repo but not deployed
**Solution:** Check GitHub Actions deployment status, may need rebuild

---

## Metrics to Track

### Content Pipeline Health
- [ ] Number of items in Backlog vs. Published
- [ ] Average time from Draft to Published
- [ ] Number of items needing updates
- [ ] Percentage of content with all metadata

### Sync Quality
- [ ] Discrepancies found per week
- [ ] Time to resolve discrepancies
- [ ] Accuracy of status tracking
- [ ] Completeness of metadata

---

## Next Steps for Improvement

1. **Immediate (This Week)**
   - [ ] Add all 16 missing entries to Notion
   - [ ] Update status of existing entries
   - [ ] Verify all metadata is complete

2. **Short Term (Next Month)**
   - [ ] Set up weekly sync calendar reminder
   - [ ] Create Notion API integration
   - [ ] Build simple sync script

3. **Long Term (Quarter 1 2026)**
   - [ ] Fully automated sync via GitHub Actions
   - [ ] Real-time status updates
   - [ ] Sync metrics dashboard

---

## Contact & Support

**Questions about sync process:**
- Open GitHub Discussion
- Tag @luizfernando in Notion

**Technical issues:**
- Check [CONTENT-PIPELINE.md](./CONTENT-PIPELINE.md)
- Review GitHub Actions logs

**Process improvements:**
- Suggest in weekly review
- Update this document

---

**Last Sync:** [Add date after each weekly sync]  
**Next Sync Due:** [Every Monday]  
**Document Version:** 1.0  
**Last Updated:** October 4, 2025

