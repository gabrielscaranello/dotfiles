---
name: manage-dotfile
description: >-
  Guide and enforce the standard workflow for creating or updating tool configurations,
  action scripts, and Makefile targets in this dotfiles repository. Use this skill whenever
  adding a new tool config, modifying scripts in actions/, updating Neovim plugins, or
  adjusting shell profile settings.
---

# 🚀 Dotfiles Management & Implementation Workflow

This skill defines the canonical step-by-step procedure for introducing new tool configurations, updating existing dotfiles, writing action scripts, and adding Neovim plugins in this repository.

---

## 📋 End-to-End Implementation Lifecycle

```
[1. Plan & Scope] ──▶ [2. Config Directory] ──▶ [3. Action Script] ──▶ [4. Orchestration] ──▶ [5. Documentation] ──▶ [6. Safe Validation]
```

---

### Step 1: Planning & Scope

1. **Identify the target tool and configuration destination**:
   - Determine standard destination (e.g. `$HOME/.config/<tool>`, `$HOME/.<file>`).
   - Identify whether the tool requires simple symlinking, directory copying, or post-install steps (e.g., cache rebuild like `bat cache --build`).
2. **Review Autonomous Scope**:
   - AI agents may freely create/modify files under `config/`, `actions/`, `utils/`, `Makefile`, and `README.md`.
   - **Protected Core Governance Files** (`AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `.github/copilot-instructions.md`, `.agents/skills/**`) strictly require prior user approval.

---

### Step 2: Configuration Directory (`config/<tool>/`)

1. Create directory `config/<tool>/`.
2. Add the tool's configuration file(s).
3. Add a concise `config/<tool>/README.md` explaining the purpose, key bindings, or upstream reference.
4. **Zero Secrets**: Ensure no sensitive tokens, private keys, or machine-specific passwords are hardcoded in the tracked configuration.

---

### Step 3: Canonical Action Script (`actions/<tool>.sh`)

Create or update the setup script adhering to the project's standard pattern:

```bash
#!/bin/bash

PWD=$(pwd)
CONFIG_DIR="$HOME/.config/<tool>"

. "$PWD/utils/clean.sh"

echo "Setting up <tool>..."

# 1. Safely remove existing link or dir
clean_config_dir "$CONFIG_DIR"

# 2. Idempotently symlink from repo
ln -sf "$PWD/config/<tool>" "$CONFIG_DIR"

# 3. Optional post-install command (if tool is installed)
if command -v <tool> >/dev/null 2>&1; then
  # run post-link hook if needed
  :
fi

echo "<tool> setup complete!"
```

- Ensure the file has execution permissions: `chmod +x actions/<tool>.sh`.
- Always source `utils/clean.sh` and call `clean_config_dir "$CONFIG_DIR"`.

---

### Step 4: Neovim Plugin Integration (If applicable)

When configuring Neovim (`config/nvim/`):

1. **Target Directory**: All Neovim configurations reside in `config/nvim/`.
2. **Plugin Declarations**: Add new plugins as separate files under `config/nvim/lua/plugins/<plugin-name>.lua`.
3. **Template**:

```lua
---@type LazyPluginSpec
return {
  "owner/repo",
  event = "VeryLazy",
  opts = {
    -- configuration
  },
  keys = {
    -- keymaps
  },
}
```

4. **Formatting**: Follow `config/nvim/.stylua.toml` standards (2-space indent, column width 100).

---

### Step 5: Orchestration (`Makefile` & `actions/all.sh`)

1. **Makefile**:
   - Add `<tool>:` target to `Makefile`:
     ```makefile
     <tool>:
     	@bash ./actions/<tool>.sh
     ```
   - Add `<tool>` to the `.PHONY` list.
   - Add a descriptive line to `make help`.
2. **Master Runner (`actions/all.sh`)**:
   - If the tool is part of the standard personal desktop environment, add `bash "$PWD/actions/<tool>.sh"` to `actions/all.sh`.
   - If it is an optional or standalone tool, leave it out of `all.sh` and expose it via `Makefile`.

---

### Step 6: Documentation (`README.md`)

Update `README.md` with:
1. Entry in the **Configs** table:
   ```markdown
   | [<Tool>](./config/<tool>) | <Tool> config |
   ```
2. Entry in the **Commands** table:
   ```markdown
   | `make <tool>` | Link <tool> config to `~/.config/<tool>` |
   ```

---

### Step 7: Safe Validation Execution (MANDATORY GATE)

Before reporting completion to the developer, the AI agent **MUST ALWAYS run safe validation**:

> [!CAUTION]
> **Host Safety Contract**: Do NOT execute `make all` or `bash actions/<tool>.sh` on the host machine without explicit developer authorization, as it mutates the developer's live home directory.

1. **Validate All Shell Scripts**:
   ```bash
   make lint-sh
   ```
2. **Validate the Modified Script Directly**:
   ```bash
   bash -n actions/<tool>.sh
   ```
3. **Verify Makefile Target**:
   ```bash
   make help
   ```

An implementation is strictly considered **COMPLETE** once all touchpoints are synchronized and syntax checks pass green.
