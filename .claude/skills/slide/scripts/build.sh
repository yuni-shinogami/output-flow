#!/usr/bin/env bash
# スライドをHTML形式で出力する
#
# Usage: ./.claude/skills/slide/scripts/build.sh <slides.md> [output-dir]
# Example: ./.claude/skills/slide/scripts/build.sh output/my-project/slide/slides.md output/

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"

if [ $# -lt 1 ]; then
  echo "Usage: $0 <slides.md> [output-dir]"
  echo "Example: $0 output/my-project/slide/slides.md output/"
  exit 1
fi

INPUT="$1"
OUTPUT_DIR="${2:-output}"

# Chrome wrapper for headless environments (adds --no-sandbox)
if [ -z "${CHROME_PATH:-}" ] && [ -x "$SCRIPT_DIR/chrome-wrapper.sh" ]; then
  export CHROME_PATH="$SCRIPT_DIR/chrome-wrapper.sh"
fi

mkdir -p "$OUTPUT_DIR"

BASENAME="$(basename "$INPUT" .md)"

npx @marp-team/marp-cli \
  --config "$PROJECT_ROOT/marp.config.mjs" \
  --html \
  -o "$OUTPUT_DIR/${BASENAME}.html" \
  "$INPUT"

echo "Built: $OUTPUT_DIR/${BASENAME}.html"
