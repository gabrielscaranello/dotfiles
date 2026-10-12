# 🤖 AI Agent Guidelines & Context — Dotfiles

This file is the single authoritative source of truth for AI assistants, coding agents, and maintainers regarding repository architecture, conventions, script patterns, operational rules, AI constraints, safety policies, and mandatory synchronization workflows in this repository.

---

## 📌 Project Overview

This repository (**`gabrielscaranello/dotfiles`**) contains personal, automated, and modular configuration files, terminal setups, and shell scripts for daily development on Linux:

- **Neovim** (`config/nvim`): Modern, highly optimized Lua Neovim configuration built with `lazy.nvim`, `snacks.nvim`, modular LSP servers (`nvim-lspconfig`, `mason.nvim`), `blink.cmp`, AI integrations (`sidekick.nvim`, Copilot, Antigravity CLI, Windsurf/Codeium), and Tokyonight styling.
- **Terminal & Shell** (`config/kitty`, `config/profile`): Kitty terminal emulator, Zsh (`zshrc`, Oh My Zsh, Powerlevel10k theme `p10k.zsh`), POSIX environment (`profile`), shell aliases (`alias`), and user environment configuration (`~/.env`).
- **CLI & TUI Productivity Tools**: `bat` (syntax-highlighted cat), `btop` (resource monitor), `flameshot` (screenshots), `ghostwriter` (distraction-free markdown editor), `lazydocker` (Docker TUI), `lazygit` (Git TUI), and Git configuration (`config/misc/gitconfig`).
- **Orchestration**: `actions/*.sh` modular setup scripts, `utils/clean.sh` cleanup helper, and `Makefile` convenience commands.

---

## 🧭 Repository Architecture & Layout

```
.
├── Makefile                       # Convenience targets (make help, make nvim, make lint-sh, etc.)
├── AGENTS.md                      # Authoritative AI agent guidelines & architecture (this file)
├── CLAUDE.md                      # Pointer to AGENTS.md for Claude Code
├── GEMINI.md                      # Pointer to AGENTS.md for Gemini
├── README.md                      # User-facing documentation and commands table
├── .agents/skills/                # Agent skill specifications (code-context, manage-dotfile)
├── .github/                       # GitHub configurations (copilot-instructions.md)
├── actions/                       # Deployment and setup shell scripts
│   ├── all.sh                     # Master runner executing all config setups
│   ├── bat.sh                     # Bat configuration symlink and cache rebuild
│   ├── btop.sh                    # Btop configuration deployment
│   ├── flameshot.sh               # Flameshot configuration symlink
│   ├── ghostwriter.sh             # Ghostwriter theme & configuration deployment
│   ├── kitty.sh                   # Kitty terminal configuration symlink
│   ├── lazydocker.sh              # Lazydocker configuration symlink
│   ├── lazygit.sh                 # Lazygit configuration symlink
│   ├── nvim.sh                    # Active Neovim configuration symlink and cache cleaner
│   ├── oh-my-zsh.sh               # Oh My Zsh, themes (p10k), and plugins installer
│   └── profile.sh                 # Shell profiles (~/.zshrc, ~/.profile, ~/.alias, ~/.env)
├── config/                        # Tracked application configurations
│   ├── bat/                       # bat config and themes
│   ├── btop/                      # btop.conf and themes
│   ├── flameshot/                 # flameshot.ini
│   ├── ghostwriter/               # ghostwriter.conf and Tokyonight.json
│   ├── kitty/                     # kitty.conf and current-theme.conf
│   ├── lazydocker/                # config.yml
│   ├── lazygit/                   # config.yml
│   ├── misc/                      # gitconfig
│   ├── nvim/                      # Neovim Lua setup (lazy.nvim, snacks, LSP)
│   └── profile/                   # p10k.zsh, zshrc, alias, profile, env.example.sh
├── utils/                         # Reusable shell helpers
│   └── clean.sh                   # clean_config_dir helper function
└── assets/                        # Preview images and screenshots
```

---

## 📜 Canonical Action Script Pattern & Invariants

All action scripts located in `actions/*.sh` follow a standard structure:

```bash
#!/bin/bash

PWD=$(pwd)
CONFIG_DIR="$HOME/.config/example"

. "$PWD/utils/clean.sh"

echo "Setting up example..."

clean_config_dir "$CONFIG_DIR"
ln -sf "$PWD/config/example" "$CONFIG_DIR"

echo "Example setup complete!"
```

### Script Rules & Invariants

1. **Clean unlinking before linking**: Always source `utils/clean.sh` and call `clean_config_dir "$TARGET_DIR"` to remove existing symbolic links or stale directories before creating a new symlink.
2. **Idempotency**: Running an action script multiple times must produce the same clean state without error, duplicate links, or nested target directories.
3. **Valid Bash Syntax**: All scripts must pass syntax validation via `make lint-sh` (`bash -n`).
4. **Execution Permissions**: Action scripts must be executable (`chmod +x actions/<tool>.sh`).

---

## 🧩 Neovim Configuration Architecture (`config/nvim/`)

The active Neovim configuration is strictly inside `config/nvim/`.

### Directory Structure

```
config/nvim/
├── init.lua                       # Minimal 2-line entrypoint: requires "core" and "config.lazy"
├── .stylua.toml                   # StyLua formatter configuration (2-space, width 100)
├── .luarc.json                    # Lua LSP language server diagnostics settings
├── lua/
│   ├── core/                      # Core editor settings
│   │   ├── init.lua               # Loads options, keymaps, autocmd, filetypes
│   │   ├── options.lua            # Vim options (numbers, tabs, clipboard, etc.)
│   │   ├── keymaps.lua            # Global editor keymaps
│   │   ├── autocmd/               # Autocommands (highlight on yank, LSP hooks)
│   │   └── filetypes.lua          # Custom filetype associations
│   ├── config/                    # Plugin orchestration & specific configs
│   │   ├── lazy.lua               # lazy.nvim bootstrapper and plugin loader
│   │   ├── lualine.lua            # Statusline configuration
│   │   ├── snacks.lua             # snacks.nvim setup
│   │   ├── cmp.lua                # Completion setup (blink.cmp)
│   │   ├── toggleterm.lua         # Terminal integration setup
│   │   └── lsp/                   # LSP client configurations and mkconfig
│   ├── plugins/                   # LazyPluginSpec declarations
│   │   ├── ai/                    # AI plugins (copilot.lua, sidekick.lua, windsurf.lua)
│   │   ├── lsp/                   # LSP plugins (lspconfig, mason, etc.)
│   │   ├── snacks/                # Snacks plugin modules (picker, dashboard, etc.)
│   │   └── *.lua                  # Individual plugin modules (gitsigns, treesitter, etc.)
│   └── utils/                     # Lua helper modules
│       ├── ai.lua                 # AI provider detector (copilot, antigravity, claude)
│       ├── formatters/            # Prettier and conform formatters
│       ├── lsp/                   # LSP utility helpers
│       ├── icons.lua              # Nerd font icon sets
│       └── project_config.lua     # Per-project overrides
```

### Neovim Development Guidelines

- **Modular specs**: Add new plugins as separate files in `lua/plugins/<name>.lua` or subdirectories. `lazy.nvim` automatically imports `{ import = "plugins" }` and `{ import = "plugins.lsp" }`.
- **Do not clutter `init.lua`**: `init.lua` must remain a 2-line entrypoint (`require "core"` and `require "config.lazy"`). Never add raw plugin configurations directly to `init.lua`.
- **AI Integrations (`lua/utils/ai.lua`)**: AI providers (`copilot`, `codeium`/windsurf, `antigravity`, `claude`) are dynamically configured via environment variables read by `lua/utils/ai.lua` and toggled via `sidekick.nvim`.
- **Code Style**: Code must follow StyLua styling defined in `config/nvim/.stylua.toml` (2-space indent, column width 100, double quotes preferred).

---

## 🐚 Shell Environment Hierarchy & Zero Secrets Policy (`config/profile/`)

The shell profile is modular and sourced systematically:

1. `config/profile/zshrc` → Sourced when launching Zsh. Configures instant prompt, Powerlevel10k theme, Oh My Zsh plugins, and sources `~/.profile`.
2. `config/profile/profile` → Sourced across interactive shells. Sets up `$PATH`, language environments (`nvm`, `go`, `bun`, `cargo`), and sources `~/.alias` and `~/.env`.
3. `config/profile/alias` → General terminal aliases (`v`, `vim`, `lg`, `ld`, `eza`, `bat`).
4. `config/profile/env.example.sh` → Template for user environment variables and AI provider settings.

> [!CAUTION]
> **Zero Secrets Policy**: Never commit API keys, personal access tokens, or sensitive variables into tracked files. Sensitive variables must always be placed into `~/.env` (which is sourced by `profile` and never committed).

---

## ❌ NEVER DO — Common AI Agent Mistakes (Read First)

The following violations cause broken environments, lost user data, or corrupted configurations. Treat each one as a strict rule with zero exceptions.

### 1. Never Run Action or Setup Scripts Blindly on the Host Machine

All action scripts (`bash actions/*.sh`, `make all`, `make nvim`, etc.) actively modify the developer's live environment under `$HOME` (`~/.config`, `~/.local`, `~/.cache`, `~/.zshrc`, `~/.profile`). Specifically, `actions/nvim.sh` removes `~/.local/share/nvim`, `~/.local/state/nvim`, and `~/.cache/nvim`, and replaces `~/.config/nvim`.

```bash
# ✅ CORRECT — validate script syntax safely without executing or mutating $HOME
make lint-sh
bash -n actions/nvim.sh
bash -n actions/all.sh

# ❌ NEVER — blindly executes on developer workstation, may overwrite active configs or wipe data
make all
bash actions/nvim.sh
make profile
```

> [!CAUTION]
> AI agents must **never** execute deployment scripts or `make all` without explicit authorization from the developer.

### 2. Never Edit Files Directly in `$HOME`

All configurations must be edited inside the repository's tracked folders (`config/<tool>/`), never directly in `$HOME/.config/<tool>/` or `$HOME/.zshrc`.

```bash
# ✅ CORRECT — editing tracked repository file
edit config/kitty/kitty.conf
edit config/profile/alias

# ❌ NEVER — editing live target directly, breaks git synchronization
edit ~/.config/kitty/kitty.conf
edit ~/.alias
```

### 3. Never Commit Personal Secrets or Hardcoded Machine Paths

Credentials, tokens, and machine-specific variables belong in `~/.env`, instantiated from `config/profile/env.example.sh`.

```bash
# ✅ CORRECT — add sample or placeholder in env.example.sh
echo 'export OPENAI_API_KEY=""' >> config/profile/env.example.sh

# ❌ NEVER — committing live credentials into tracked profile
export OPENAI_API_KEY="sk-..." >> config/profile/profile
```

### 4. Never Put Monolithic Plugin Configurations in `config/nvim/init.lua`

Neovim uses `lazy.nvim` with automatic spec loading. Every plugin configuration belongs in its own dedicated module under `config/nvim/lua/plugins/`.

```lua
-- ✅ CORRECT — create config/nvim/lua/plugins/my-plugin.lua
---@type LazyPluginSpec
return {
  "author/my-plugin.nvim",
  event = "VeryLazy",
  opts = {},
}

-- ❌ NEVER — adding plugin definitions directly to init.lua
require("lazy").setup({ "author/my-plugin.nvim" })
```

### 5. Never Add a Tool Without Synchronizing All 4 Touchpoints

When introducing or changing a tool, all 4 touchpoints must remain synchronized:
1. `config/<tool>/` (configuration files)
2. `actions/<tool>.sh` (safe idempotent symlink script)
3. `Makefile` (entrypoint target)
4. `README.md` (documentation tables)

---

## 🚫 AI Operational Rules & Commit Policy

- **Autonomous File Edits & Protected Core Governance Files**: AI agents have full permission to create and modify configurations under `config/`, scripts under `actions/`, helper scripts under `utils/`, documentation, and `Makefile` autonomously **without requesting confirmation**, with the strict exception of **Protected Core Governance Files**:
  - `AGENTS.md`
  - `CLAUDE.md`
  - `GEMINI.md`
  - `.github/copilot-instructions.md`
  - `.agents/skills/**`  
  Modifying any of these protected governance files strictly requires explicit prior approval from the human developer.
- **Commit Policy & Standards (Conventional Commits v1.0.0)**: AI assistants and agents may execute `git commit` **only when explicitly requested or authorized by the human developer**. All commit messages must strictly adhere to the [Conventional Commits v1.0.0 specification](https://www.conventionalcommits.org/en/v1.0.0/) (`<type>[optional scope]: <description>`, followed by optional body and footers). Autonomous or unsolicited commits and `git push` operations remain strictly prohibited without explicit developer approval.
- **Developer Oversight**: Commits performed by AI agents must strictly reflect the requested changes, follow clean semantic messages conforming to Conventional Commits, and leave push/remote operations under developer discretion unless explicitly instructed.
- **Mandatory Syntax & Lint Validation**: After creating or modifying any executable script (`actions/*.sh`, `utils/*.sh`) or Makefile, AI agents must **ALWAYS** run and fix:
  1. Script syntax check: `make lint-sh` (runs `bash -n` across all scripts).
  2. If Lua files were edited, ensure syntax is valid and adheres to `.stylua.toml`.
- **Doc-Only Optimization**: If changes are strictly limited to documentation or markdown files (`*.md`), AI agents must **NOT** execute redundant shell validations.

---

## 📋 Mandatory Synchronization Rules for Configurations & Actions

Whenever a new tool or configuration is added to this repository:

1. **Config Directory (`config/<tool>/`)**: Store configuration files and an informative `README.md`.
2. **Action Script (`actions/<tool>.sh`)**:
   - Clean prior targets via `clean_config_dir` from `utils/clean.sh`.
   - Create symbolic link `ln -sf "$PWD/config/<tool>" "$TARGET_DIR"`.
   - Make script executable (`chmod +x actions/<tool>.sh`).
3. **Master Orchestration (`actions/all.sh`)**: Register invocation in `actions/all.sh` if it is part of the standard personal desktop configuration.
4. **Makefile Target (`Makefile`)**: Add `<tool>:` target and list in `.PHONY` and `help`.
5. **Documentation (`README.md`)**: Add entries to the **Configs** and **Commands** markdown tables.

---

## 🛠️ Validation & Commands

- **Display help**: `make help`
- **Validate shell syntax**: `make lint-sh` (safe on host, no mutations)
- **Deploy individual config** *(developer-only)*: `make <tool>` (e.g. `make nvim`, `make kitty`)
- **Deploy all configs** *(developer-only)*: `make all`

---

## 📖 Deep-Dive References & Upstream Sources

- **[README.md](README.md)**: User-facing documentation and commands table.
- **[gabrielscaranello/setup](https://github.com/gabrielscaranello/setup)**: Author's companion repository for Linux desktop provisioning across Debian, Fedora, Arch Linux, and LMDE.
