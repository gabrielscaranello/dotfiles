#! /bin/bash

echo "Cleaning up"
clean_config_dir() {
	local CONFIG_DIR="$1"

	if [ -d "$CONFIG_DIR" ] && [ -L "$CONFIG_DIR" ]; then
		unlink "$CONFIG_DIR"
	elif [ ! -L "$CONFIG_DIR" ]; then
		rm -rf "$CONFIG_DIR"
	fi

}
