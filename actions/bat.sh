#! /bin/bash

PWD=$(pwd)
CONFIG_DIR="$HOME/.config/bat"
BAT_EXECUTABLE=$(command -v bat || command -v batcat)

. "$PWD/utils/clean.sh"

echo "Setting up bat..."

clean_config_dir "$CONFIG_DIR"
ln -sf "$PWD/config/bat" "$CONFIG_DIR"
if [ -n "$BAT_EXECUTABLE" ]; then
  $BAT_EXECUTABLE cache --build
fi

echo "Bat setup complete!"
