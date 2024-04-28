#! /bin/bash

TARGET_DIR="$HOME/.oh-my-zsh"
THEMES_DIR="$THEMES_DIR/custom/themes"
PLUGINS_DIR="$THEMES_DIR/custom/plugins"
INSTALL_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
P10K_URL="https://github.com/romkatv/powerlevel10k.git"
AUTOSUGGEST_URL="https://github.com/zsh-users/zsh-autosuggestions.git"

echo "Setting up oh-my-zsh..."
echo "Removing old oh-my-zsh..."
rm -rf "$TARGET_DIR"

echo "Installing oh-my-zsh..."
sh -c "$(wget -O- "$INSTALL_URL" | sed 's/exec zsh -l//g')"

echo "Installing custom themes and plugins..."
git clone --depth=1 "$P10K_URL" "$THEMES_DIR/powerlevel10k"
git clone --depth=1 "$AUTOSUGGEST_URL" "$PLUGINS_DIR/zsh-autosuggestions"

echo "Removing dump files..."
rm -rf ~/.zcompdump* ~/.zshrc.* ~/.shell.pre-oh-my-zsh

echo "oh-my-zsh setup complete!"
