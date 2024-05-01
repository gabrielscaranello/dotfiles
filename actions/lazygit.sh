#! /bin/bash

PWD=$(pwd)
CONFIG_DIR="$HOME/.config/lazygit"

. "$PWD/utils/clean.sh"

echo "Setting up Lazygit..."

clean_config_dir "$CONFIG_DIR"
ln -sf "$PWD/config/lazygit" "$CONFIG_DIR"

echo "Lazygit setup complete!"
