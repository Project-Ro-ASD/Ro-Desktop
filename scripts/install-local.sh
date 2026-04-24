#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "Installing Ro Theme locally..."

install_dir() {
  local src="$1"
  local dst="$2"
  if [[ -d "$src" ]]; then
    mkdir -p "$(dirname "$dst")"
    rm -rf "$dst"
    cp -a "$src" "$dst"
    echo "installed: $dst"
  else
    echo "skip missing directory: $src"
  fi
}

install_files() {
  local src_glob="$1"
  local dst_dir="$2"
  mkdir -p "$dst_dir"
  shopt -s nullglob
  for file in $src_glob; do
    cp -a "$file" "$dst_dir/"
    echo "installed: $dst_dir/$(basename "$file")"
  done
  shopt -u nullglob
}

install_files "platform/plasma/color-schemes/*.colors" "$HOME/.local/share/color-schemes"
install_dir "platform/plasma/desktoptheme/Ro" "$HOME/.local/share/plasma/desktoptheme/Ro"
install_dir "platform/plasma/look-and-feel/org.ro.global" "$HOME/.local/share/plasma/look-and-feel/org.ro.global"
install_dir "platform/plasma/layout-templates/org.ro.desktop" "$HOME/.local/share/plasma/layout-templates/org.ro.desktop"
install_dir "platform/plasma/wallpapers/Ro" "$HOME/.local/share/wallpapers/Ro"
install_dir "platform/kwin/effects/ro-effect" "$HOME/.local/share/kwin/effects/ro-effect"
install_dir "platform/gtk/Ro-GTK" "$HOME/.themes/Ro-GTK"
install_dir "platform/icons/ro-icons" "$HOME/.local/share/icons/ro-icons"
install_dir "platform/cursor/ro-cursor" "$HOME/.local/share/icons/ro-cursor"
install_dir "platform/splash/Ro" "$HOME/.local/share/plasma/look-and-feel/org.ro.global/contents/splash/Ro"

cat <<'MSG'
Local install complete.

Apply manually when needed:
  plasma-apply-colorscheme RoDark
  lookandfeeltool -a org.ro.global

System-wide SDDM/Plymouth still require sudo install or RPM packaging.
MSG
