#! /bin/bash

PWD=$(pwd)
CONFIG_DIR="$HOME/.config/flameshot"

echo "Setting up flameshot..."

ln -sf "$PWD/config/flameshot" "$CONFIG_DIR"

echo "Flameshot setup complete!"
