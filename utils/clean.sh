#! /bin/bash

echo "Cleaning up"
clean_config_dir() {
	local CONFIG_DIR="$1"

	[ -d "$CONFIG_DIR" ] && [ ! -L "$CONFIG_DIR" ] && unlink "$CONFIG_DIR" || rm -rf "$CONFIG_DIR"
}
