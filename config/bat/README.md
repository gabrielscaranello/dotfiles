# Bat

## About

This is a config of [Bat](https://github.com/sharkdp/bat) using [Tokyonight Night theme for sublime](https://github.com/folke/tokyonight.nvim/tree/main/extras/sublime).

## Installing

Make a backup of your current bat

```bash
mv ~/.config/bat ~/.config/bat.bak
```

Clone my config

```bash
git clone --depth 1 https://github.com/gabrielscaranello/dotfiles /tmp/dotfiles
```

Copy the cloned config to `~/.config/bat`

```bash
cp -r /tmp/dotfiles/config/bat ~/.config
```

Build bat cache

```bash
bat cache --build
```
