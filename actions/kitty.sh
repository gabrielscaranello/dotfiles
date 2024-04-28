#! /bin/bash

PWD=$(pwd)
CONFIG_DIR="$HOME/.config/kitty"

echo "Setting up kitty..."

ln -sf "$PWD/config/kitty" "$CONFIG_DIR"

echo "Kitty setup complete!"
