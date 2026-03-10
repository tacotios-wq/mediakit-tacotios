#!/bin/bash
# Quick fix: UTF-8 encoding + nav link
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TEMP_DIR=$(mktemp -d)

echo "🔧 Fixing encoding + nav link..."
git clone https://github.com/tacotios-wq/mediakit-tacotios.git "$TEMP_DIR/repo"
cp "$SCRIPT_DIR/info.html" "$TEMP_DIR/repo/info.html"
cd "$TEMP_DIR/repo"
git add info.html
git commit -m "fix: UTF-8 encoding and Analytics nav link

- Fixed double-encoded UTF-8 characters (Ã± → ñ, Ã© → é, etc.)
- Fixed malformed Analytics nav link (was showing raw HTML)"
git push origin main
echo "✅ Fix pushed! Vercel deploying..."
cd / && rm -rf "$TEMP_DIR"
