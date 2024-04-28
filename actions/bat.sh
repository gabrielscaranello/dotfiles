#! /bin/bash

PWD=$(pwd)
CONFIG_DIR="$HOME/.config/bat"

. "$PWD/utils/clean.sh"

echo "Setting up bat..."

clean_config_dir "$CONFIG_DIR"
ln -sf "$PWD/config/bat" "$CONFIG_DIR"

echo "Bat setup complete!"
