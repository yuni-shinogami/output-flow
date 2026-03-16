#!/usr/bin/env bash
# Chrome wrapper that adds --no-sandbox flag for headless environments
# Finds Chrome installed by puppeteer and runs it with --no-sandbox

CHROME_BIN=$(find "$HOME/.cache/puppeteer" -name chrome -type f 2>/dev/null | head -1)

if [ -z "$CHROME_BIN" ]; then
  echo "Error: Chrome not found in ~/.cache/puppeteer/" >&2
  echo "Run: npx puppeteer browsers install chrome" >&2
  exit 1
fi

exec "$CHROME_BIN" --no-sandbox "$@"
