#!/usr/bin/env bash
set -euo pipefail

REPO="${REPO:-DujDDx/Sam}"
VERSION="${VERSION:-latest}"
INSTALL_DIR="${INSTALL_DIR:-$HOME/Applications}"
BRANCH="${BRANCH:-latest}"

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This installer currently supports macOS only." >&2
  exit 1
fi

if ! command -v curl >/dev/null 2>&1; then
  echo "curl is required but not found." >&2
  exit 1
fi

if ! command -v tar >/dev/null 2>&1; then
  echo "tar is required but not found." >&2
  exit 1
fi

if [[ "$VERSION" == "latest" ]]; then
  ARCHIVE_NAME="sam-macos-latest.tar.gz"
else
  ARCHIVE_NAME="sam-macos-v${VERSION}.tar.gz"
fi

TEMP_DIR="$(mktemp -d)"
ARCHIVE_PATH="$TEMP_DIR/$ARCHIVE_NAME"

cleanup() {
  rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

DOWNLOAD_CANDIDATES=(
  "https://raw.githubusercontent.com/${REPO}/${BRANCH}/releases/${ARCHIVE_NAME}"
  "https://raw.githubusercontent.com/${REPO}/${BRANCH}/Sam_Distribute/releases/${ARCHIVE_NAME}"
  "https://raw.githubusercontent.com/${REPO}/main/releases/${ARCHIVE_NAME}"
  "https://raw.githubusercontent.com/${REPO}/main/Sam_Distribute/releases/${ARCHIVE_NAME}"
)

DOWNLOADED=false
for DOWNLOAD_URL in "${DOWNLOAD_CANDIDATES[@]}"; do
  echo "Trying ${DOWNLOAD_URL}"
  if curl -fsL "$DOWNLOAD_URL" -o "$ARCHIVE_PATH"; then
    DOWNLOADED=true
    break
  fi
done

if [[ "$DOWNLOADED" != "true" ]]; then
  echo "Failed to download release package. Please check REPO/BRANCH/version." >&2
  exit 1
fi

echo "Extracting package..."
tar -xzf "$ARCHIVE_PATH" -C "$TEMP_DIR"

APP_PATH="$TEMP_DIR/Sam.app"
if [[ ! -d "$APP_PATH" ]]; then
  echo "Archive does not contain Sam.app." >&2
  exit 1
fi

mkdir -p "$INSTALL_DIR"
rm -rf "$INSTALL_DIR/Sam.app"
mv "$APP_PATH" "$INSTALL_DIR/Sam.app"
xattr -dr com.apple.quarantine "$INSTALL_DIR/Sam.app" 2>/dev/null || true

echo "Sam installed to: $INSTALL_DIR/Sam.app"
echo "Run it with: open \"$INSTALL_DIR/Sam.app\""
