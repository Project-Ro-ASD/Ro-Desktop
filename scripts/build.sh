#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

./scripts/validate.sh

VERSION="$(tr -d '[:space:]' < VERSION)"
DIST_DIR="dist"
ARCHIVE="$DIST_DIR/ro-theme-$VERSION.tar.gz"

echo "Building Ro theme $VERSION..."
rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"

tar \
  --exclude='./.git' \
  --exclude='./dist' \
  --exclude='./*.zip' \
  -czf "$ARCHIVE" \
  --transform "s#^.#ro-theme-$VERSION#" \
  .

echo "Build complete: $ARCHIVE"
