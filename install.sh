#!/usr/bin/env bash
# Install agents into ~/.claude/agents and skills into ~/.claude/skills.
# Usage: ./install.sh            (user-level, all projects)
#        ./install.sh --project  (current project's .claude/ directory)
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ "${1:-}" == "--project" ]]; then
  DEST="$PWD/.claude"
else
  DEST="$HOME/.claude"
fi

mkdir -p "$DEST/agents" "$DEST/skills"

count=0
for dir in bonus design ecommerce engineering marketing product project-management studio-operations testing; do
  [[ -d "$SRC/$dir" ]] || continue
  for f in "$SRC/$dir"/*.md; do
    cp "$f" "$DEST/agents/"
    count=$((count + 1))
  done
done

skills=0
for s in "$SRC"/skills/*/; do
  name="$(basename "$s")"
  mkdir -p "$DEST/skills/$name"
  cp -r "$s". "$DEST/skills/$name/"
  skills=$((skills + 1))
done

echo "Installed $count agents into $DEST/agents and $skills skills into $DEST/skills."
echo "Restart Claude Code to load them."
