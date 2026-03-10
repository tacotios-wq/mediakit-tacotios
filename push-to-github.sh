#!/bin/bash
# =============================================================
# PUSH MEDIAKIT ANALYTICS TO GITHUB
# Sube info.html + 21 screenshots al repo mediakit-tacotios
# =============================================================

set -e

REPO_URL="https://github.com/tacotios-wq/mediakit-tacotios.git"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TEMP_DIR=$(mktemp -d)

echo ""
echo "🚀 Subiendo analytics al repo mediakit-tacotios..."
echo "   Directorio temporal: $TEMP_DIR"
echo ""

# 1. Clone the repo
echo "📥 Clonando repo..."
git clone "$REPO_URL" "$TEMP_DIR/repo"
cd "$TEMP_DIR/repo"

# 2. Copy modified info.html
echo "📄 Copiando info.html modificado..."
cp "$SCRIPT_DIR/info.html" ./info.html

# 3. Create screenshots directory and copy all images
echo "🖼️  Copiando 21 screenshots..."
mkdir -p screenshots
cp "$SCRIPT_DIR/screenshots/"* ./screenshots/

echo "   ✅ $(ls screenshots/ | wc -l | tr -d ' ') archivos copiados a screenshots/"

# 4. Stage all changes
git add info.html screenshots/

# 5. Show what will be committed
echo ""
echo "📋 Cambios a commitear:"
git status --short
echo ""

# 6. Commit
git commit -m "feat: add analytics accordion section with real screenshots

- Added collapsible accordion section to info.html with 4 platform panels
- Instagram: 7 analytics screenshots (683K followers, 18.8M views/month)
- TikTok: 6 analytics screenshots (598K followers, 9.1M views)
- Facebook: 4 analytics screenshots (650K followers, 9.8M views)
- YouTube: 4 analytics screenshots (85.4K subs, 266K views/month)
- Added Analytics nav link in header navigation
- All screenshots are real platform data from March 2026"

# 7. Push
echo "⬆️  Pushing to main..."
git push origin main

echo ""
echo "✅ ¡Listo! Cambios publicados en GitHub."
echo "🌐 Vercel desplegará automáticamente en:"
echo "   https://mediakit-tacotios.vercel.app/info"
echo ""

# 8. Cleanup
cd /
rm -rf "$TEMP_DIR"
echo "🧹 Directorio temporal limpiado."
