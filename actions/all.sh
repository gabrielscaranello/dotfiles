#! /bin/bash

PWD=$(pwd)

echo "Setting up all configs..."

bash "$PWD/actions/bat.sh"
bash "$PWD/actions/btop.sh"
bash "$PWD/actions/discord.sh"
bash "$PWD/actions/flameshot.sh"
bash "$PWD/actions/kitty.sh"
bash "$PWD/actions/lazydocker.sh"
bash "$PWD/actions/lazygit.sh"
bash "$PWD/actions/nvim.sh"
bash "$PWD/actions/oh-my-zsh.sh"
bash "$PWD/actions/profile.sh"

echo "All configs setup complete!"
