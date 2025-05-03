#!/bin/sh

cd "$(dirname "$0")" || exit 1
SCRIPT_DIR="$(pwd)"
echo "Linking dotfiles from $SCRIPT_DIR to $HOME"

for file in "$SCRIPT_DIR"/.*; do
  if [ "$(basename "$file")" = "." ] || [ "$(basename "$file")" = ".." ]; then
    continue
  fi

  if [ ! -f "$file" ]; then
    continue
  fi

  filename=$(basename "$file")

  if [ "$filename" = "$(basename "$0")" ]; then
    # skip this script
    continue
  fi

  if [ -e "$HOME/$filename" ]; then
    echo "Warning: $HOME/$filename already exists, skipping..."
  else
    ln -s "$file" "$HOME/$filename"
    echo "Created symlink: $HOME/$filename -> $file"
  fi
done
