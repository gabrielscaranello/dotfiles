#! /bin/bash

PWD=$(pwd)
CONFIG_DIR="$HOME/.config/kitty"

. "$PWD/utils/clean.sh"

echo "Setting up kitty..."

clean_config_dir "$CONFIG_DIR"
ln -sf "$PWD/config/kitty" "$CONFIG_DIR"

echo "Kitty setup complete!"
