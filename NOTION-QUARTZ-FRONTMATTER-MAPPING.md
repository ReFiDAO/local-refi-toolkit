# Notion → Quartz Frontmatter Mapping Guide 🔄

**Date:** October 4, 2025  
**Purpose:** Standardized YAML frontmatter structure for syncing Notion database properties to Quartz markdown files  
**Status:** ✅ Implemented & Tested

---

## 🎯 Overview

This guide documents how Notion database properties are mapped to Quartz-compatible YAML frontmatter in markdown files. This ensures that all metadata from the [Notion Content Pipeline Database](https://www.notion.so/2816ed0845cb813789fae2d15c9d39e3) is properly preserved and utilized in the Quartz-generated website.

---

## 📋 Quartz Native Frontmatter Fields

Quartz natively supports these frontmatter fields (from `quartz/plugins/transformers/frontmatter.ts`):

| Field | Type | Purpose | Required |
|-------|------|---------|----------|
| `title` | string | Page title | ✅ Yes |
| `description` | string | Page description/summary | Recommended |
| `tags` | array | Page tags for categorization | Recommended |
| `aliases` | array | Alternative names for the page | Optional |
| `draft` | boolean | Hide page from production | Optional |
| `publish` | boolean | Control publication | Optional |
| `lang` | string | Language code (e.g., "en-US") | Optional |
| `enableToc` | boolean | Enable table of contents | Optional |
| `cssclasses` | array | Custom CSS classes | Optional |

---

## 🗺️ Notion → Quartz Property Mapping

### Core Quartz Fields

| Notion Property | Quartz Field | Mapping Logic | Example |
|----------------|--------------|---------------|---------|
| **Name** | `title` | Direct mapping | `"ReFi DAO - Host 'Intro to ReFi' meetup!"` |
| **Type** | `tags[]` | First tag in array | `["playbook", "case-study"]` |
| **Published?** | `publish` | Boolean conversion | `true` or `false` |
| **Status** | `draft` | Map "Draft" → `true` | `false` (if published) |

### Extended Tags Array

The `tags` field combines multiple Notion properties for rich categorization:

```yaml
tags:
  - playbook                    # From "Type"
  - accessible                  # From "Difficulty Level"
  - community-building          # From topic
  - education                   # From "Impact Area"
  - refi-fundamentals           # From topic
  - quick-start                 # From folder location
  - global                      # From "Region"
```

**Tag Construction Logic:**
1. Type (lowercase, normalized)
2. Difficulty level (accessible/intermediate/advanced)
3. Impact areas (lowercase, hyphenated)
4. Regions (lowercase, normalized)
5. Chain deployments (lowercase)
6. Topic-specific keywords

---

## 🏗️ Structured Notion Metadata

All Notion database properties are preserved in a `notion` namespace for future use and reference:

```yaml
# Notion Database Properties
notion:
  content_stage: "🚀 Live"
  difficulty_level: "🐣 Accessible"
  type: 
    - "Playbook"
  region:
    - "🌍 Global"
  impact_area:
    - "📚 Education"
    - "🤝 Social"
  chain_deployment:
    - "N/A"
  lead_authors: "Monty"
  rc_owner: "luizfernando"
  repository_path: "content/01-playbooks/quick-start/Host-Intro-To-ReFi-Meetup-NOTION.md"
  website_url: "https://toolkit.refi.community/01-playbooks/quick-start/Host-Intro-To-ReFi-Meetup-NOTION"
  status: "Draft"
  published: true
  last_edited: "2025-10-04"
```

### Notion Namespace Mapping

| Notion Property | YAML Field | Type | Example |
|----------------|------------|------|---------|
| **Content Stage** | `notion.content_stage` | string | `"🚀 Live"` |
| **Difficulty Level** | `notion.difficulty_level` | string | `"🐣 Accessible"` |
| **Type** | `notion.type` | array | `["Playbook"]` |
| **Region** | `notion.region` | array | `["🌍 Global", "🌍 Europe"]` |
| **Impact Area** | `notion.impact_area` | array | `["📚 Education", "🤝 Social"]` |
| **Chain Deployment** | `notion.chain_deployment` | array | `["Celo", "Arbitrum"]` |
| **Lead Authors** | `notion.lead_authors` | string | `"Monty"` |
| **RC Owner** | `notion.rc_owner` | string | `"luizfernando"` |
| **Repository Path** | `notion.repository_path` | string | `"content/..."` |
| **Website URL** | `notion.website_url` | string | `"https://..."` |
| **Status** | `notion.status` | string | `"Draft"` |
| **Published?** | `notion.published` | boolean | `true` |
| **Last edited time** | `notion.last_edited` | string (date) | `"2025-10-04"` |

---

## 📊 Additional Metadata Fields

Content-specific metadata beyond Notion properties:

```yaml
# Additional Metadata
target_audience: "Community builders, ReFi node leaders, event organizers"
source: "Notion Content Database"
synced_date: "2025-10-04"
location: "Lisboa, Portugal"                    # For case studies
case_study_type: "Local Node Implementation"    # For case studies
related_playbooks: []                           # For case studies
related_case_studies: []                        # For playbooks
```

---

## 📝 Complete Frontmatter Template

### For Playbooks

```yaml
---
title: "[Playbook Title]"
description: "[Brief description of what this playbook teaches]"
tags:
  - playbook
  - [difficulty-level]
  - [topic-keywords]
  - [impact-areas]
  - quick-start
aliases:
  - "[Alternative Name 1]"
  - "[Alternative Name 2]"
draft: false
publish: true

# Notion Database Properties
notion:
  content_stage: "[Stage]"
  difficulty_level: "[Level]"
  type: 
    - "Playbook"
  region:
    - "[Region]"
  impact_area:
    - "[Impact]"
  chain_deployment:
    - "[Chain]"
  lead_authors: "[Author Name]"
  rc_owner: "[Owner Name]"
  repository_path: "content/01-playbooks/..."
  website_url: "https://toolkit.refi.community/..."
  status: "[Status]"
  published: true
  last_edited: "YYYY-MM-DD"

# Additional Metadata
target_audience: "[Who should use this]"
related_case_studies: []
source: "Notion Content Database"
synced_date: "YYYY-MM-DD"
---
```

### For Case Studies

```yaml
---
title: "[Case Study Title]"
description: "[Brief description of the case study]"
tags:
  - case-study
  - [location]
  - [topics]
  - [region]
aliases:
  - "[Alternative Name]"
draft: false
publish: true

# Notion Database Properties
notion:
  content_stage: "[Stage]"
  difficulty_level: null
  type:
    - "Case Study"
  region:
    - "[Region]"
  impact_area:
    - "[Impact]"
  chain_deployment: []
  lead_authors: "[Author]"
  rc_owner: "[Owner]"
  repository_path: "content/02-case-studies/..."
  website_url: "https://toolkit.refi.community/..."
  status: "[Status]"
  published: true
  last_edited: "YYYY-MM-DD"

# Additional Metadata
location: "[City, Country]"
case_study_type: "[Type]"
related_playbooks: []
source: "Notion Content Database"
synced_date: "YYYY-MM-DD"
---
```

---

## 🔄 Sync Workflow

### When Syncing from Notion → Repository

1. **Retrieve Page from Notion** using MCP API
2. **Extract Properties** from page metadata
3. **Map to Frontmatter** using table above
4. **Generate Tags Array** from multiple properties
5. **Create Aliases** from title variations
6. **Preserve Notion Data** in `notion` namespace
7. **Add Additional Metadata** as needed
8. **Write YAML Frontmatter** at top of markdown file
9. **Verify Build** with `npx quartz build`

### Automated Script (Future)

```bash
#!/bin/bash
# notion-sync-frontmatter.sh
# Syncs Notion properties to YAML frontmatter

notion_page_id="$1"
output_file="$2"

# 1. Fetch page properties from Notion
# 2. Transform to YAML
# 3. Update frontmatter in markdown file
# 4. Validate YAML syntax
# 5. Test build
```

---

## 🎨 Value Transformations

### Difficulty Level

| Notion | Tag | Display |
|--------|-----|---------|
| 🐣 Accessible | `accessible` | "Beginner-friendly" |
| 🥸 Intermediate | `intermediate` | "Some experience needed" |
| 🪖 Advanced | `advanced` | "Technical expertise required" |

### Content Stage

| Notion | Publish | Draft |
|--------|---------|-------|
| 💡 Ideation | `false` | `true` |
| 🔍 In Research | `false` | `true` |
| ✍️ Draft | `false` | `true` |
| 👀 In Review | `false` | `true` |
| 🌐 Community Review | `false` | `true` |
| ✅ Published | `true` | `false` |
| 🚀 Live | `true` | `false` |
| ⚡ Active | `true` | `false` |

### Region Normalization

| Notion | Tag | Display |
|--------|-----|---------|
| 🌍 Global | `global` | "Global" |
| 🌎 Latin America | `latin-america` | "Latin America" |
| 🌍 Europe | `europe` | "Europe" |
| 🌍 Africa | `africa` | "Africa" |
| 🌏 Asia-Pacific | `asia-pacific` | "Asia-Pacific" |
| 🌎 North America | `north-america` | "North America" |

### Impact Area Normalization

| Notion | Tag | Display |
|--------|-----|---------|
| 🌱 Environmental | `environmental` | "Environmental" |
| 🤝 Social | `social` | "Social" |
| 💰 Economic | `economic` | "Economic" |
| 🏛️ Governance | `governance` | "Governance" |
| 📚 Education | `education` | "Education" |

---

## 🔍 Querying Frontmatter in Quartz

Quartz makes frontmatter available to components via `fileData.frontmatter`:

```typescript
// Example: Access in Quartz component
const { frontmatter } = fileData

// Core fields
const title = frontmatter?.title
const tags = frontmatter?.tags
const description = frontmatter?.description

// Notion properties
const contentStage = frontmatter?.notion?.content_stage
const difficultyLevel = frontmatter?.notion?.difficulty_level
const leadAuthors = frontmatter?.notion?.lead_authors

// Additional metadata
const targetAudience = frontmatter?.target_audience
const location = frontmatter?.location
```

### Example: Custom Component

```tsx
// components/NotionMetadata.tsx
const NotionMetadata: QuartzComponent = ({ fileData }: QuartzComponentProps) => {
  const notion = fileData.frontmatter?.notion
  
  if (!notion) return null
  
  return (
    <div className="notion-metadata">
      <span className="content-stage">{notion.content_stage}</span>
      <span className="difficulty">{notion.difficulty_level}</span>
      {notion.region?.map(r => (
        <span className="region" key={r}>{r}</span>
      ))}
      {notion.impact_area?.map(i => (
        <span className="impact" key={i}>{i}</span>
      ))}
    </div>
  )
}
```

---

## ✅ Validation & Testing

### YAML Syntax Validation

```bash
# Test YAML parsing
npx js-yaml content/path/to/file.md

# Full build test
npx quartz build
```

### Frontmatter Checklist

- [ ] Valid YAML syntax (proper indentation)
- [ ] Required fields present (title, description)
- [ ] Tags array properly formatted
- [ ] Notion properties preserved
- [ ] Dates in ISO format (YYYY-MM-DD)
- [ ] URLs are absolute and valid
- [ ] Build succeeds without errors

---

## 🚀 Future Enhancements

### Phase 1: Automated Sync Script
- Shell script to fetch Notion page and update frontmatter
- Batch processing for multiple pages
- Validation and error handling

### Phase 2: Custom Quartz Components
- Display Notion metadata badges
- Filter/sort by Content Stage
- Display difficulty levels
- Show impact areas and regions

### Phase 3: Advanced Integration
- GraphQL API for frontmatter queries
- Dynamic filtering on website
- Metadata-driven navigation
- Analytics tracking

---

## 📚 Related Documentation

- **[Content Pipeline](CONTENT-PIPELINE.md)** - 8-stage workflow
- **[Notion Sync Guide](NOTION-SYNC-GUIDE.md)** - Weekly sync procedures
- **[Notion Database Polish](NOTION-DATABASE-POLISH-COMPLETE.md)** - Database enhancements
- **[Internal Index](content/INTERNAL-INDEX.md)** - All documentation

---

## 🔗 Resources

- **Notion Database:** [Content Pipeline](https://www.notion.so/2816ed0845cb813789fae2d15c9d39e3)
- **Quartz Documentation:** [quartz.jzhao.xyz](https://quartz.jzhao.xyz)
- **YAML Specification:** [yaml.org](https://yaml.org)
- **Frontmatter Transformer:** `quartz/plugins/transformers/frontmatter.ts`

---

**Last Updated:** October 4, 2025  
**Status:** ✅ Active & Production-Ready  
**Maintained By:** Local ReFi Toolkit Team

