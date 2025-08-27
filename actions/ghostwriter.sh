#! /bin/bash

PWD=$(pwd)
CONFIG_FILE_SOURCE="$PWD/config/ghostwriter/ghostwriter.conf"
THEME_FILE_SOURCE="$PWD/config/ghostwriter/Tokyonight.json"

# Defining target dirs
CONFIG_TARGET_DIR="$HOME/.config/kde.org/"
THEME_TARGET_DIR="$HOME/.local/share/ghostwriter/themes/"

echo "Setting up ghostwriter..."

# Verify if ghostwriter is installed
if flatpak list | grep -q ghostwriter; then
  THEME_TARGET_DIR="$HOME/.var/app/io.github.wereturtle.ghostwriter/data/ghostwriter/themes/"
  CONFIG_TARGET_DIR="$HOME/.var/app/io.github.wereturtle.ghostwriter/data/kde.org/"
elif ! command -v ghostwriter >/dev/null 2>&1; then
  echo "Ghostwriter is not installed."
  exit 0
fi

# Defining target files
THEME_TARGET_FILE="$THEME_TARGET_DIR/Tokyonight.json"
CONFIG_TARGET_FILE="$CONFIG_TARGET_DIR/ghostwriter.conf"

echo "Installing ghostwriter configs..."
mkdir -p "$THEME_TARGET_DIR"
mkdir -p "$CONFIG_TARGET_DIR"

cp "$THEME_FILE_SOURCE" "$THEME_TARGET_FILE"
sed "s,:home:,$HOME,g" "$CONFIG_FILE_SOURCE" > "$CONFIG_TARGET_FILE"

echo "Ghostwriter setup complete!"
