#!/usr/bin/env bash
# Marp devサーバーを起動してスライドをプレビューする
#
# Usage: ./scripts/preview.sh <slides.md>
# Example: ./scripts/preview.sh work/my-project/slides.md

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

if [ $# -lt 1 ]; then
  echo "Usage: $0 <slides.md>"
  echo "Example: $0 work/my-project/slides.md"
  exit 1
fi

INPUT="$1"

npx @marp-team/marp-cli@latest \
  --config "$PROJECT_ROOT/marp.config.mjs" \
  --html \
  --server \
  "$INPUT"
