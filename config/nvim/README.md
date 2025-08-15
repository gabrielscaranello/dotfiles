# Neovim

## About

This setup was written from scratch.
My main inspirations were [LazyVim](https://www.lazyvim.org/) and [AstroNvim](https://astronvim.com/) (a distro I used for a while).

I'm just starting out in the Neovim world and any help is welcome. ☺️

## Keymap

The leader key is `<Space>`, use `<Space>fk` to view all keymaps.

## Requirements

- [Neovim v0.11.2+](https://github.com/neovim/neovim/releases/tag/stable)
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
- [Node](https://nodejs.org/en/) - Node is needed for a lot of the LSPs, and for the node repl toggle terminal
- A C compiler for `nvim-treesitter`. See [requirements](https://github.com/nvim-treesitter/nvim-treesitter#requirements)
- [ripgrep](https://github.com/BurntSushi/ripgrep) - live grep telescope search (`<leader>fw`)
- [fd](https://github.com/sharkdp/fd) - live file search (`<leader>ff`)
- [btop](https://github.com/aristocratos/btop) - process viewer toggle terminal (`<leader>tb`) (optional)
- [go DiskUsage()](https://github.com/dundee/gdu) - disk usage toggle terminal (`Leader>tu`) (optional)
- [lazydocker](https://github.com/jesseduffield/lazydocker) - docker ui toggle terminal (`<leader>td`) (optional)
- [lazygit](https://github.com/jesseduffield/lazygit) - git ui toggle terminal (`<leader>tl` or `<leader>gg`) (optional)
- [Python](https://www.python.org/) - python repl toggle terminal (`<leader>tp`) (optional)

### Supported terminals

- [kitty](https://github.com/kovidgoyal/kitty) (Linux & Macos) - tested
- [wezterm](https://github.com/wez/wezterm) (Linux, Macos & Windows)
- [alacritty](https://github.com/alacritty/alacritty) (Linux, Macos & Windows)
- [iterm2](https://iterm2.com/) (Macos)

## Features

### Auto completation with AI

This configuration is designed to handle Copilot and Windsurf (Codeium).
To use both, you need to add the environment variable `AI_PROVIDER`.

```bash
# 'codeium' for Windsurf or 'copilot' for Copilot
export AI_PROVIDER=codeium
```

> If you don't want to use AI autocomplete, just don't define the variable.

#### Windsurf (Codeium)

To use it, you must add the API key with `:Codeium Auth` (open any file for the plugin to load).

> See [Exafunction/windsurf.nvim](https://github.com/Exafunction/windsurf.nvim) for more information.

#### Copilot

This configuration provides autocomplete with Copilot and also integration with Copillot chat.  
Use `:Copilot auth` to authenticate client.

##### Copilot shortcuts

| Shortcut     | Descrioption              |
| ------------ | ------------------------- |
| `<leader>aa` | Toggle Copilot Chat       |
| `<leader>ax` | Clear Copilot Chat        |
| `<leader>aq` | Open Copilot Chat (Quick) |
| `<leader>ap` | Open Prompt Chat Options  |

> For more information, see [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua)
> and [CopilotC-Nvim/CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim).

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
```

### Background Transparence

By default, all NeoVim windows have a transparent background.  
You can disable this feature editing the `lua/plugins/tokyonight.lua` file.

```lua
return {
  -- Other props...
  opts = {
    transparent = true,
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

- auto-session
- better-escape.nvim
- blink-copilot (when configured)
- blink-emoji.nvim
- blink.cmp
- bufferline.nvim
- codesnap.nvim
- Comment.nvim
- conform.nvim
- copilot.lua (when configured)
- CopilotChat.nvim (when configured)
- dial.nvim
- flash.nvim
- gitsigns.nvim
- grug-far.nvim
- lualine.nvim
- mason.nvim
- mini.ai
- mini.move
- mini.pairs
- multiple-cursors.nvim
- nvim-coverage
- nvim-highlight-colors
- nvim-lspconfig
- nvim-surround
- nvim-treesitter
- nvim-ts-autotag
- nvim-vtsls
- render-markdown.nvim
- rest.nvim
- SchemaStore.nvim
- snacks.nvim
- todo-comments.nvim
- toggleterm.nvim
- tokyonight.nvim
- treesj
- trouble.nvim
- tsc.nvim
- vim-wakatime
- which-key.nvim
- windsurf.nvim (when configured)
- yanky.nvim

## Preview

![Preview](/assets/nvim-preview.webp)

> Using [kitty terminal](https://sw.kovidgoyal.net/kitty/) and [JetBrains Mono NF](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/Ligatures).

## Credits

- [AstroNvim](https://github.com/AstroNvim/AstroNvim)
- [LazyVim](https://github.com/LazyVim/LazyVim)
- [My Old AstroNvim Config](/config/nvim-astronvim)
