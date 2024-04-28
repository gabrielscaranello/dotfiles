#! /bin/bash

PWD=$(pwd)
CONFIG_DIR="$HOME/.config/bat"

echo "Setting up bat..."

ln -sf "$PWD/config/bat" "$CONFIG_DIR"

echo "Bat setup complete!"
