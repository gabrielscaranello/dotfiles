#! /bin/bash

PWD=$(pwd)

echo "Setting up profile..."

ln -sf "$PWD/config/profile/profile" "$HOME/.profile"
ln -sf "$PWD/config/profile/zshrc" "$HOME/.zshrc"
ln -sf "$PWD/config/profile/alias" "$HOME/.alias"
ln -sf "$PWD/config/profile/p10k.zsh" "$HOME/.p10k.zsh"

echo "Profile setup complete!"
