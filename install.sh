#!/usr/bin/env bash
set -euo pipefail

BIN_DIR="/usr/local/bin"
TARGET="$BIN_DIR/wltools"

echo "Installing wltools to $TARGET"

if [[ $(id -u) -ne 0 ]]; then
  echo "This installer requires root (sudo)." >&2
  exit 1
fi

RAW_URL="https://raw.githubusercontent.com/phygres/wordlisttools/main/wltools"

if command -v curl >/dev/null 2>&1; then
  curl -fsSL "$RAW_URL" -o "$TARGET" || { echo "Failed to download wltools" >&2; exit 1; }
elif command -v wget >/dev/null 2>&1; then
  wget -qO "$TARGET" "$RAW_URL" || { echo "Failed to download wltools" >&2; exit 1; }
else
  echo "Error: curl or wget required" >&2
  exit 1
fi

chmod 0755 "$TARGET"

if command -v wltools >/dev/null 2>&1; then
  echo "Installation successful."
else
  echo "Installed but not in PATH. Ensure $BIN_DIR is in PATH." >&2
fi
