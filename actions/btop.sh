#! /bin/bash

PWD=$(pwd)
CONFIG_DIR="$HOME/.config/btop"

echo "Setting up btop..."

ln -sf "$PWD/config/btop" "$CONFIG_DIR"

echo "Btop setup complete!"
