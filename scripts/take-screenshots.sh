#!/usr/bin/env bash
# スライドの各ページをPNG画像として出力する（ビジュアル検証用）
#
# Usage: ./scripts/take-screenshots.sh <slides.md> [output-dir]
# Example: ./scripts/take-screenshots.sh work/my-project/slides.md output/screenshots/

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

if [ $# -lt 1 ]; then
  echo "Usage: $0 <slides.md> [output-dir]"
  echo "Example: $0 work/my-project/slides.md output/screenshots/"
  exit 1
fi

INPUT="$1"
OUTPUT_DIR="${2:-output/screenshots}"

# Chrome wrapper for headless environments (adds --no-sandbox)
if [ -z "${CHROME_PATH:-}" ] && [ -x "$PROJECT_ROOT/scripts/chrome-wrapper.sh" ]; then
  export CHROME_PATH="$PROJECT_ROOT/scripts/chrome-wrapper.sh"
fi

mkdir -p "$OUTPUT_DIR"

BASENAME="$(basename "$INPUT" .md)"

npx @marp-team/marp-cli@latest \
  --config "$PROJECT_ROOT/marp.config.mjs" \
  --html \
  --images png \
  -o "$OUTPUT_DIR/${BASENAME}.png" \
  "$INPUT"

echo "Screenshots saved to: $OUTPUT_DIR/"
echo "Files:"
ls -1 "$OUTPUT_DIR/${BASENAME}"*.png 2>/dev/null || echo "  (no files found)"
