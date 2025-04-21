# Neovim

## About

After months of using the AstroNvim distro, I decided to create my own configuration based on the knowledge I acquired and the AstroNvim and LazyVim configurations.

I'm just starting out in the Neovim world and any help is welcome. ☺️

## Keymap

The leader key is `<Space>`, use `<Space>fk` to view all keymaps.

## Requirements

- [Neovim v0.10.1+](https://github.com/neovim/neovim/releases/tag/stable)
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
- [Node](https://nodejs.org/en/) - Node is needed for a lot of the LSPs, and for the node repl toggle terminal
- [btop](https://github.com/aristocratos/btop) - process viewer toggle terminal (`<leader>tb`)
- [go DiskUsage()](https://github.com/dundee/gdu) - disk usage toggle terminal (`Leader>tu`)
- [lazydocker](https://github.com/jesseduffield/lazydocker) - docker ui toggle terminal (`<leader>td`) (optional)
- [lazygit](https://github.com/jesseduffield/lazygit) - git ui toggle terminal (`<leader>tl` or `<leader>gg`) (optional)
- [Python](https://www.python.org/) - python repl toggle terminal (`<leader>tp`)
- [ripgrep](https://github.com/BurntSushi/ripgrep) - live grep telescope search (`<leader>fw`)

## Features

### Auto completation with AI

This config uses Windsurf to autocomplete your code. You will need a Windsurf
account and api key to do this.

For more information about that see the
[Exafunction/windsurf.nvim](https://github.com/Exafunction/windsurf.nvim) plugin documentation.

To disable the feature add `disabled` prop on this config or delete this file
`lua/plugins/windsurf.lua` file:

```lua
return {
    -- Other props...
    disabled = true,
}
```

### Wakatime

To use Wakatime needs to define Wakatime
[API key](https://wakatime.com/settings#apikey)
and to be installed [wakatime-cli](https://github.com/wakatime/wakatime-cli).
More information on [wakatime/vim-wakatime](https://github.com/wakatime/vim-wakatime).

To disable the feature comment out or remove this line in the
`lua/plugins/misc.lua` file:

```lua
-- Comment out our remove this line
-- { "wakatime/vim-wakatime", event = { "BufReadPre" } },
,
```

### Background Transparence

By default, all NeoVim windows have a transparent background.  
You can disable this feature editing the `lua/plugins/catppuccin.lua` file.

```lua
return {
    -- Other props...
    opts = {
        transparent_background = false,
        -- Other opts...
    }
}
```

## Installing

Make a backup of your current nvim folder

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

Clean neovim folders

```bash
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

Clone my config into `~/.config/nvim`

```bash
git clone --depth 1 https://github.com/gabrielscaranello/dotfiles /tmp/dotfiles
```

Copy the cloned config to `~/.config/nvim`

```bash
cp -r /tmp/dotfiles/config/nvim ~/.config
```

Start Neovim

```bash
nvim
```

## Plugins

> These are some of the main plugins configured.

- alpha-nvim
- better-escape.nvim
- bufferline.nvim
- catppuccin
- codesnap.nvim
- Comment.nvim
- conform.nvim
- dial.nvim
- dropbar.nvim
- flash.nvim
- gitsigns.nvim
- indent-blankline.nvim
- lualine.nvim
- LuaSnip
- markdown-preview.nvim
- mason.nvim
- multiple-cursors.nvim
- neo-tree.nvim
- nvim-cmp
- nvim-coverage
- nvim-lspconfig
- nvim-spectre
- nvim-surround
- nvim-treesitter
- nvim-vtsls
- SchemaStore.nvim
- telescope.nvim
- toggleterm.nvim
- vim-wakatime
- which-key.nvim
- windsurf.nvim

## Preview

![Preview](/assets/nvim-preview.webp)

> Using [kitty terminal](https://sw.kovidgoyal.net/kitty/) and [JetBrains Mono NF](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/Ligatures).

## Credits

- [AstroNvim](https://github.com/AstroNvim/AstroNvim)
- [LazyVim](https://github.com/LazyVim/LazyVim)
- [My Old AstroNvim Config](/config/nvim-astronvim)
