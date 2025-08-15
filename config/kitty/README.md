# Kitty

## About

This is a config of [Kitty](https://sw.kovidgoyal.net/kitty) using [Tokyonight Night](https://github.com/folke/tokyonight.nvim/tree/main/extras/kitty).

## Requirements

You need to install [JetBrains Mono Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/Ligatures).

## Installing

Make a backup of your current kitty

```bash
mv ~/.config/kitty ~/.config/kitty.bak
```

Clone my config

```bash
git clone --depth 1 https://github.com/gabrielscaranello/dotfiles /tmp/dotfiles
```

Copy the cloned config to `~/.config/kitty`

```bash
cp -r /tmp/dotfiles/config/kitty ~/.config
```
