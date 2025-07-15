#! /bin/bash

PWD=$(pwd)
CONFIG_DIR="$HOME/.config/btop"

. "$PWD/utils/clean.sh"

echo "Setting up btop..."

clean_config_dir "$CONFIG_DIR"
cp -r "$PWD/config/btop" "$CONFIG_DIR"

echo "Btop setup complete!"
