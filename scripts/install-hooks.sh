#!/bin/sh
set -e

HOOKS_DIR=".git/hooks"
SOURCE_DIR="scripts/git-hooks"

if [ ! -d "$HOOKS_DIR" ]; then
  echo "Error: No .git directory found. Run this from your repository root."
  exit 1
fi

cp "$SOURCE_DIR/pre-commit" "$HOOKS_DIR/pre-commit"
cp "$SOURCE_DIR/pre-push" "$HOOKS_DIR/pre-push"
chmod +x "$HOOKS_DIR/pre-commit" "$HOOKS_DIR/pre-push"

echo "✅ Spec-Driven Agent Harness Git Hooks installed successfully into $HOOKS_DIR"
