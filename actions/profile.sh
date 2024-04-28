#! /bin/bash

PWD=$(pwd)

. "$PWD/utils/clean.sh"

echo "Setting up profile..."

clean_config_dir "$HOME/.alias"
clean_config_dir "$HOME/.p10k.zsh"
clean_config_dir "$HOME/.profile"
clean_config_dir "$HOME/.zshrc"

ln -sf "$PWD/config/profile/alias" "$HOME/.alias"
ln -sf "$PWD/config/profile/p10k.zsh" "$HOME/.p10k.zsh"
ln -sf "$PWD/config/profile/profile" "$HOME/.profile"
ln -sf "$PWD/config/profile/zshrc" "$HOME/.zshrc"

echo "Profile setup complete!"
