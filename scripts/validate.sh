#!/usr/bin/env bash
set -u

errors=0
warns=0

require_file() {
  local path="$1"
  if [[ ! -f "$path" ]]; then
    echo "ERROR missing file: $path"
    errors=$((errors + 1))
  fi
}

require_nonempty() {
  local path="$1"
  if [[ ! -s "$path" ]]; then
    echo "ERROR empty/missing file: $path"
    errors=$((errors + 1))
  fi
}

warn_empty() {
  local path="$1"
  if [[ -f "$path" && ! -s "$path" ]]; then
    echo "WARN empty placeholder: $path"
    warns=$((warns + 1))
  fi
}

echo "Checking Ro theme integrity..."

require_file VERSION
require_file README.md
require_file core/tokens/colors.json
require_file platform/plasma/color-schemes/RoDark.colors
require_file platform/plasma/color-schemes/RoLight.colors
require_file platform/plasma/look-and-feel/org.ro.global/metadata.json
require_file platform/plasma/look-and-feel/org.ro.global/contents/defaults/kdeglobals
require_file platform/plasma/layout-templates/org.ro.desktop/contents/layout.js
require_file platform/plasma/layout-templates/org.ro.desktop/metadata.json
require_file platform/plasma/desktoptheme/Ro/metadata.json
require_file platform/kwin/effects/ro-effect/metadata.json
require_file platform/gtk/Ro-GTK/gtk-3.0/gtk.css
require_file platform/gtk/Ro-GTK/gtk-4.0/gtk.css
require_file platform/icons/ro-icons/index.theme
require_file platform/cursor/ro-cursor/index.theme
require_file platform/sddm/themes/Ro/Main.qml
require_file platform/sddm/themes/Ro/metadata.desktop
require_file platform/plymouth/ro-theme/ro.plymouth
require_file platform/plymouth/ro-theme/ro.script
require_file platform/splash/Ro/contents/splash/Splash.qml
require_file scripts/install-local.sh
require_file scripts/build.sh
require_file packaging/ro-theme.spec

require_nonempty platform/plasma/desktoptheme/Ro/panel/panel-background.svg
require_nonempty platform/plasma/desktoptheme/Ro/dialogs/background.svg
require_nonempty platform/plasma/desktoptheme/Ro/widgets/background.svg
require_nonempty platform/plasma/desktoptheme/Ro/icons/close.svg

if grep -R "/home/berat\|desktop:/ro-theme\|desktop:/notes\|desktop:/test-layout.js" core/default-layout >/dev/null 2>&1; then
  echo "ERROR personal paths found in core/default-layout"
  errors=$((errors + 1))
fi

if grep -q "ColorScheme=Ro$" platform/plasma/look-and-feel/org.ro.global/contents/defaults/kdeglobals; then
  echo "ERROR kdeglobals points to missing ColorScheme=Ro; use RoDark or RoLight"
  errors=$((errors + 1))
fi

warn_empty platform/plasma/preview.png
warn_empty platform/gtk/preview.png
warn_empty platform/sddm/themes/Ro/preview.png
warn_empty platform/sddm/themes/Ro/background.png
warn_empty platform/sddm/themes/Ro/default-logo.svg
warn_empty platform/plymouth/ro-theme/logo.png

if [[ $errors -gt 0 ]]; then
  echo "Validation failed: $errors error(s), $warns warning(s)."
  exit 1
fi

echo "Validation passed with $warns warning(s)."
