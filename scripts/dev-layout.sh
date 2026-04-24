#!/bin/bash

echo "=== RO THEME DEV TOOL ==="

# 1. script çalıştır
echo "[1] Applying layout..."
qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "$(cat ~/Desktop/test-layout.js)"

# 2. config kaydet
echo "[2] Saving layout..."
cp ~/.config/plasma-org.kde.plasma.desktop-appletsrc \
~/Desktop/ro-theme/core/default-layout

echo "Done."
