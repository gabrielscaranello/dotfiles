---
name: code-context
description: >-
  Quick-reference context skill for any task in this repository. Provides a
  scannable summary of critical rules, anti-patterns with correct alternatives,
  canonical code examples, and the execution safety contract (never run deployment
  scripts blindly on the host). Activate this skill at the start of any task —
  debugging, refactoring, reviewing, or implementing — to prevent the most common
  AI agent mistakes.
---

# 🗺️ Repository Code Context & Critical Rules

This skill is the **first thing to activate** before any task in this repository. It distills the most important rules from [AGENTS.md](../../AGENTS.md) into a scannable reference.

> [!IMPORTANT]
> Full governance rules live in [AGENTS.md](../../AGENTS.md). This skill provides a fast-access summary; always resolve conflicts by deferring to `AGENTS.md`.

---

## 🗂️ Repository Layout at a Glance

```
config/
├── nvim/              ← Modern Neovim Lua configuration (lazy.nvim, snacks, LSP)
├── profile/           ← Shell startup files: zshrc, profile, alias, env.example.sh
├── kitty/             ← Kitty terminal config & themes
├── bat/               ← Bat configuration & themes
├── btop/              ← Btop process monitor configuration & themes
├── flameshot/         ← Flameshot screenshot configuration
├── ghostwriter/       ← Ghostwriter editor config & theme
├── lazydocker/        ← Lazydocker config
├── lazygit/           ← Lazygit config
└── misc/              ← gitconfig

actions/
├── all.sh             ← Master runner deploying all configurations
└── *.sh               ← Individual tool setup & symlink scripts

utils/
└── clean.sh           ← clean_config_dir helper (ALWAYS call before creating symlinks)

Makefile               ← Convenience entrypoints (make help, make lint-sh, make <tool>)
```

---

## 🛡️ RULE #1 — Safety Contract: Never Run Action Scripts Blindly on Host

> **Never execute `make all`, `bash actions/*.sh`, or deployment scripts without explicit user permission.**
> Action scripts mutate the developer's live environment under `$HOME` (`~/.config`, `~/.local`, `~/.cache`, `~/.zshrc`).
> `actions/nvim.sh` completely removes `~/.local/share/nvim`, `~/.local/state/nvim`, and `~/.cache/nvim`!

```bash
# ✅ CORRECT — validate script syntax safely without mutating $HOME
make lint-sh
bash -n actions/nvim.sh

# ❌ NEVER — blindly running deployment scripts on developer workstation
make all
bash actions/nvim.sh
make profile
```

---

## 🔗 RULE #2 — Edit Tracked Repo Files, Never `$HOME` Directly

Configurations must be edited within `config/<tool>/`, never in `$HOME/.config/<tool>/`.

```bash
# ✅ CORRECT — changes are tracked in git
edit config/kitty/kitty.conf
edit config/profile/alias

# ❌ WRONG — decouples changes from repository
edit ~/.config/kitty/kitty.conf
edit ~/.alias
```

---

## 🔐 RULE #3 — Zero Secrets Policy

Never commit API keys, personal tokens, or passwords to `profile`, `zshrc`, or `alias`.
Put private credentials in `~/.env`, instantiated from `config/profile/env.example.sh`.

```bash
# ✅ CORRECT — add sample key to template
echo 'export MY_TOKEN=""' >> config/profile/env.example.sh

# ❌ WRONG — committing secret tokens to version control
export MY_TOKEN="secret-xyz" >> config/profile/profile
```

---

## 🧩 RULE #4 — Neovim Modular Plugin Architecture

- `init.lua` is strictly a 2-line entrypoint.
- Individual plugins belong in `config/nvim/lua/plugins/<plugin>.lua`.
- Sourced automatically via `lazy.nvim` (`{ import = "plugins" }` and `{ import = "plugins.lsp" }`).

```lua
-- ✅ CORRECT — create config/nvim/lua/plugins/example.lua
---@type LazyPluginSpec
return {
  "author/example.nvim",
  event = "VeryLazy",
  opts = {},
}

-- ❌ WRONG — monolithic setup in init.lua
require("lazy").setup({ "author/example.nvim" })
```

---

## 🔄 RULE #5 — Mandatory 4-Touchpoint Synchronization

When adding or updating a configuration:
1. `config/<tool>/` — Config files and README.md
2. `actions/<tool>.sh` — Idempotent symlink script
3. `Makefile` — Add target and register in `.PHONY` & `help`
4. `README.md` — Update Configs and Commands tables

---

## 🧹 RULE #6 — Clean Before Linking (`utils/clean.sh`)

Every action script must clean prior paths before symlinking:

```bash
#!/bin/bash
PWD=$(pwd)
CONFIG_DIR="$HOME/.config/example"

. "$PWD/utils/clean.sh"

clean_config_dir "$CONFIG_DIR"
ln -sf "$PWD/config/example" "$CONFIG_DIR"
```

---

## ✅ Validation Gates

```bash
# 1. Check all shell scripts for syntax errors
make lint-sh

# 2. Check individual script syntax
bash -n actions/<script>.sh

# 3. View available make targets
make help
```

---

## 🔒 Protected Governance Files

Modifying these files strictly requires **explicit prior approval** from the developer:
- `AGENTS.md`
- `CLAUDE.md`
- `GEMINI.md`
- `.github/copilot-instructions.md`
- `.agents/skills/**`

---

## 📚 Further Reading

- [AGENTS.md](../../AGENTS.md) — Authoritative architecture and governance rules
- [README.md](../../README.md) — Quick start & command reference
