#! /bin/bash

PWD=$(pwd)
CONFIG_DIR="$HOME/.config/lazydocker"

. "$PWD/utils/clean.sh"

echo "Setting up Lazydocker..."

clean_config_dir "$CONFIG_DIR"
ln -sf "$PWD/config/lazydocker" "$CONFIG_DIR"

echo "Lazydocker setup complete!"
