#!/bin/sh
set -eu

# Usage:
#   sh install.sh <tree-file> [DEST]
#
# Examples:
#   sh install.sh personal/tree.txt "$HOME/FILES"
#   sh install.sh work/tree.txt "$HOME/WORK"
#
# If DEST is not provided, defaults to $HOME/FILES

TREE_FILE="${1:-}"
DEST="${2:-}"

if [ -z "$TREE_FILE" ]; then
  echo "Usage: sh install.sh <tree-file> [DEST]"
  exit 1
fi

if [ ! -f "$TREE_FILE" ]; then
  echo "Error: tree file not found: $TREE_FILE"
  exit 1
fi

if [ -z "$DEST" ]; then
  DEST="$HOME/FILES"
fi

# Create root destination
mkdir -p "$DEST"

# Read tree file line by line
# - ignores empty lines
# - ignores lines starting with #
# - uses / as separator
while IFS= read -r line || [ -n "$line" ]; do
  # Trim leading/trailing whitespace
  line=$(printf "%s" "$line" | sed 's/^[[:space:]]*//; s/[[:space:]]*$//')

  # Skip empty lines and comments
  [ -z "$line" ] && continue
  case "$line" in
    \#*) continue ;;
  esac

  mkdir -p "$DEST/$line"
done < "$TREE_FILE"

echo "Installed filesystem layout into: $DEST"

