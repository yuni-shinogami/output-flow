#!/usr/bin/env bash
# Marp devサーバーを起動してスライドをプレビューする
#
# Usage: ./.claude/skills/slide/scripts/preview.sh <slides.md>
# Example: ./.claude/skills/slide/scripts/preview.sh output/my-project/slide/slides.md

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"

if [ $# -lt 1 ]; then
  echo "Usage: $0 <slides.md>"
  echo "Example: $0 output/my-project/slide/slides.md"
  exit 1
fi

INPUT="$1"

npx @marp-team/marp-cli \
  --config "$PROJECT_ROOT/marp.config.mjs" \
  --html \
  --server \
  "$INPUT"
