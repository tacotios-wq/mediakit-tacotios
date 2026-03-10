#!/bin/bash
# Push PAOCME agency version to GitHub
# Full rebuild with PAOCME olive/gold branding, video embed, bio, metrics, accordion
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TEMP_DIR=$(mktemp -d)

echo "📄 Pushing PAOCME version (full rebuild with PAOCME branding)..."
git clone https://github.com/tacotios-wq/mediakit-tacotios.git "$TEMP_DIR/repo"
cp "$SCRIPT_DIR/info-paocme.html" "$TEMP_DIR/repo/info-paocme.html"
cd "$TEMP_DIR/repo"
git add info-paocme.html
git commit -m "feat: rebuild PAOCME agency media kit from scratch

- PAOCME olive/gold branding (matching Paola's PDF design)
- Cover section replicating PDF page 1 layout
- Embedded video section (Google Drive)
- Bio from PDF page 2 with demographics
- 2M+ followers with hover tooltip breakdown
- ER 7.05% with formula tooltip
- All metrics (Share Rate, Save Rate, Non-follower Reach)
- Analytics accordion with 21 real screenshots
- Contact: paocme@gmail.com + PAOCME footer (PDF page 12)
- Accessible at /info-paocme"
git push origin main
echo "✅ PAOCME version pushed!"
echo "🌐 https://mediakit-tacotios.vercel.app/info-paocme"
cd / && rm -rf "$TEMP_DIR"
