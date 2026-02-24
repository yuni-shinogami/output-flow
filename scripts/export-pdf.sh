#!/usr/bin/env bash
# スライドをPDF形式で出力する
#
# Usage: ./scripts/export-pdf.sh <slides.md> [output-dir]
# Example: ./scripts/export-pdf.sh work/my-project/slides.md output/

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

if [ $# -lt 1 ]; then
  echo "Usage: $0 <slides.md> [output-dir]"
  echo "Example: $0 work/my-project/slides.md output/"
  exit 1
fi

INPUT="$1"
OUTPUT_DIR="${2:-output}"

# Chrome wrapper for headless environments (adds --no-sandbox)
if [ -z "${CHROME_PATH:-}" ] && [ -x "$PROJECT_ROOT/scripts/chrome-wrapper.sh" ]; then
  export CHROME_PATH="$PROJECT_ROOT/scripts/chrome-wrapper.sh"
fi

mkdir -p "$OUTPUT_DIR"

BASENAME="$(basename "$INPUT" .md)"

npx @marp-team/marp-cli@latest \
  --config "$PROJECT_ROOT/marp.config.mjs" \
  --html \
  --pdf \
  -o "$OUTPUT_DIR/${BASENAME}.pdf" \
  "$INPUT"

echo "Exported: $OUTPUT_DIR/${BASENAME}.pdf"
