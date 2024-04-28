#! /bin/bash

NVIM_CONFIG_DIR="$HOME/.config/nvim"
NVIM_OLD_CONFIG_DIR="$HOME/.config/nvim.old"
PWD=$(pwd)

echo "Setting up nvim..."

if [ -d "$NVIM_CONFIG_DIR" ] && [ ! -L "$NVIM_CONFIG_DIR" ]; then
	echo "Found ~/.config/nvim directory."
	echo "Moving $NVIM_CONFIG_DIR to $NVIM_OLD_CONFIG_DIR."

	mv "$NVIM_CONFIG_DIR" "$NVIM_OLD_CONFIG_DIR"

	echo "Directory moved successfully!"
fi

if [ -L "$NVIM_CONFIG_DIR" ]; then
	echo "Found symbolic link ~/.config/nvim."
	unlink "$NVIM_CONFIG_DIR"
	echo "Old symbolic link removed successfully!"
fi

echo "Removing old nvim packages and cache..."
rm -rf "$HOME/.local/share/nvim" "$HOME/.local/state/nvim" "$HOME/.cache/nvim"

echo "Creating new symbolic link from $PWD/config/nvim to $NVIM_CONFIG_DIR"
ln -s "$PWD/config/nvim" "$NVIM_CONFIG_DIR"

echo "Nvim setup complete!"
