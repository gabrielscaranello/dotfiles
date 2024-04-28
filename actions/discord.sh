#! /bin/bash

PWD=$(pwd)
CONFIG_DIR="$HOME/.config/discord"

echo "Setting up discord..."

echo "Creating config directory..."
mkdir -p "$CONFIG_DIR"

echo "Starting discord..."
/usr/bin/discord --start-minimized >/dev/null 2>&1 &
sleep 2

echo "Installing catppuccin-mocha-blue theme..."
cp "$PWD/config/discord/catppuccin-mocha-blue.theme.css" "$CONFIG_DIR/catppuccin-mocha-blue.theme.css"

echo "Installing beautifuldiscord..."
PIP_BREAK_SYSTEM_PACKAGES=1 python3 -m pip install -U https://github.com/leovoel/BeautifulDiscord/archive/master.zip

echo "Setting up beautifuldiscord..."
python3 -m beautifuldiscord --css "$CONFIG_DIR/catppuccin-mocha-blue.theme.css"

kill $(pidof -s Discord)

echo "Discord setup complete!"
