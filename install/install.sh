#!/usr/bin/env bash
set -euo pipefail

# Sam installer (macOS)
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/DujDDx/Sam/latest/install/install.sh | bash
# Options:
#   VERSION=latest|1.0 ...
#   INSTALL_DIR="$HOME/Applications"

REPO="${REPO:-DujDDx/Sam}"
BRANCH="${BRANCH:-latest}"
VERSION="${VERSION:-latest}"
INSTALL_DIR="${INSTALL_DIR:-$HOME/Applications}"

[[ "$(uname -s)" == "Darwin" ]] || { echo "macOS only." >&2; exit 1; }
command -v curl >/dev/null 2>&1 || { echo "curl not found." >&2; exit 1; }
command -v tar  >/dev/null 2>&1 || { echo "tar not found." >&2; exit 1; }

ARCHIVE_NAME="sam-macos-latest.tar.gz"
[[ "$VERSION" == "latest" ]] || ARCHIVE_NAME="sam-macos-v${VERSION}.tar.gz"

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
ARCHIVE_PATH="$TMP/$ARCHIVE_NAME"

# Single canonical download location (keep releases in this path)
URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}/releases/${ARCHIVE_NAME}"

echo "Downloading: $URL"
curl -fsL "$URL" -o "$ARCHIVE_PATH" || {
  echo "Download failed. Check VERSION/BRANCH and that the file exists at: $URL" >&2
  exit 1
}

echo "Extracting..."
tar -xzf "$ARCHIVE_PATH" -C "$TMP"

APP_SRC="$TMP/Sam.app"
[[ -d "$APP_SRC" ]] || { echo "Package missing Sam.app" >&2; exit 1; }

mkdir -p "$INSTALL_DIR"
rm -rf "$INSTALL_DIR/Sam.app"
mv "$APP_SRC" "$INSTALL_DIR/Sam.app"
xattr -dr com.apple.quarantine "$INSTALL_DIR/Sam.app" 2>/dev/null || true

echo "Installed: $INSTALL_DIR/Sam.app"
echo "Run: open \"$INSTALL_DIR/Sam.app\""
