#!/bin/sh
set -e

TARGET_DIR="${1:-.}"
echo "🚀 Initializing Spec-Driven Agent Harness into $TARGET_DIR..."

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
HARNESS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cp "$HARNESS_ROOT/AGENTS.md" "$TARGET_DIR/AGENTS.md"

if [ ! -f "$TARGET_DIR/harness.config.json" ]; then
  cp "$HARNESS_ROOT/harness.config.example.json" "$TARGET_DIR/harness.config.json"
fi

mkdir -p "$TARGET_DIR/.agents"
cp -R "$HARNESS_ROOT/.agents/"* "$TARGET_DIR/.agents/"

mkdir -p "$TARGET_DIR/scripts"
cp -R "$HARNESS_ROOT/scripts/"* "$TARGET_DIR/scripts/"

if [ -d "$TARGET_DIR/.git" ]; then
  sh "$TARGET_DIR/scripts/install-hooks.sh"
fi

echo "✅ Harness successfully initialized! Review AGENTS.md and harness.config.json."
