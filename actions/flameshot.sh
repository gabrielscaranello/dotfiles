#! /bin/bash

PWD=$(pwd)
CONFIG_DIR="$HOME/.config/flameshot"

. "$PWD/utils/clean.sh"

echo "Setting up flameshot..."

clean_config_dir "$CONFIG_DIR"
ln -sf "$PWD/config/flameshot" "$CONFIG_DIR"

echo "Flameshot setup complete!"
