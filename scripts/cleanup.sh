#!/bin/bash

# Repository Cleanup Script
# Removes redundant files and fixes naming conventions

set -e  # Exit on error

echo "🧹 Starting repository cleanup..."
echo ""

# Phase 1: Remove root duplicates
echo "📦 Phase 1: Removing root-level duplicates..."
if [ -f "./PROGRESS-SUMMARY.md" ]; then
    rm ./PROGRESS-SUMMARY.md
    echo "  ✅ Removed ./PROGRESS-SUMMARY.md"
fi

if [ -f "./toolkit-structure-diagrams.md" ]; then
    rm ./toolkit-structure-diagrams.md
    echo "  ✅ Removed ./toolkit-structure-diagrams.md"
fi

# Update content README to match root version
echo "  📝 Updating content/README.md..."
cp ./README.md ./content/README.md
echo "  ✅ Updated content/README.md"

echo ""

# Phase 2: Remove redundant templates
echo "📋 Phase 2: Removing old template versions..."
if [ -f "content/04-resources/templates/original-playbook-template.md" ]; then
    rm content/04-resources/templates/original-playbook-template.md
    echo "  ✅ Removed original-playbook-template.md"
fi

if [ -f "content/04-resources/templates/original-case-study-template.md" ]; then
    rm content/04-resources/templates/original-case-study-template.md
    echo "  ✅ Removed original-case-study-template.md"
fi

echo ""

# Phase 3: Clean planning folder
echo "🗂️  Phase 3: Cleaning planning folder..."
cd content/07-planning

if [ -f "Case Study TEMPLATE 1ba2e7251f2f80a9825ad23cda96257f.md" ]; then
    rm "Case Study TEMPLATE 1ba2e7251f2f80a9825ad23cda96257f.md"
    echo "  ✅ Removed Case Study TEMPLATE (with hash)"
fi

if [ -f "PLAYBOOK TEMPLATE 1ba2e7251f2f8075ab17eb812e84dd7f.md" ]; then
    rm "PLAYBOOK TEMPLATE 1ba2e7251f2f8075ab17eb812e84dd7f.md"
    echo "  ✅ Removed PLAYBOOK TEMPLATE (with hash)"
fi

if [ -f "250701 Local ReFi Toolkit.md" ]; then
    mv "250701 Local ReFi Toolkit.md" "Local-ReFi-Toolkit-Overview.md"
    echo "  ✅ Renamed 250701 Local ReFi Toolkit.md → Local-ReFi-Toolkit-Overview.md"
fi

cd ../..

echo ""
echo "✅ Cleanup complete!"
echo ""
echo "📊 Summary:"
echo "  - Removed 6 redundant files"
echo "  - Renamed 1 file"
echo "  - Updated 1 file"
echo ""
echo "🔍 Next steps:"
echo "  1. Review changes: git status"
echo "  2. Test build: npm run build"
echo "  3. Commit: git add . && git commit -m 'chore: clean up redundant files and fix naming'"
echo ""

