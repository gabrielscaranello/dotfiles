# Misc

## About

Miscellaneous configurations and static reference files for daily use:

- [`gitconfig`](./gitconfig) — Global Git configuration (`~/.gitconfig`)
- [`windows-terminal.json`](./windows-terminal.json) — Windows Terminal configuration ported from [Kitty](../kitty) with the **Tokyo Night** theme

---

## Windows Terminal (`windows-terminal.json`)

Configuração do **Windows Terminal** adaptada a partir de [`config/kitty/kitty.conf`](../kitty/kitty.conf) e [`config/kitty/current-theme.conf`](../kitty/current-theme.conf), utilizando a paleta oficial [Tokyo Night](https://github.com/folke/tokyonight.nvim/blob/main/extras/windows_terminal/tokyonight_night.json).

### 1. Pré-requisitos

Instale a fonte **[JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip)** diretamente no **host Windows** (não apenas dentro do WSL):

```powershell
# Via Winget no PowerShell (Windows)
winget install -e --id DEVCOM.JetBrainsMonoNerdFont
```

### 2. Como aplicar pelo Windows Terminal (Interface)

1. Abra o **Windows Terminal**.
2. Pressione `Ctrl + Shift + ,` (ou clique na seta `⌄` na barra de abas → **Configurações** → **Abrir arquivo JSON** no canto inferior esquerdo).
3. Mescle ou substitua as seções globais (`copyOnSelect`, `alwaysShowTabs`, `showTabsInTitlebar`, `theme`), `profiles.defaults`, `schemes`, `themes` e `actions` com o conteúdo de [`windows-terminal.json`](./windows-terminal.json).
   > **Nota:** Mantenha a lista `"list": [...]` dentro de `"profiles"` do seu `settings.json` original para preservar os perfis das suas distribuições WSL/PowerShell já registrados pelo Windows Terminal.

### 3. Como aplicar via Linha de Comando (WSL / PowerShell)

O arquivo de configuração padrão do Windows Terminal fica em:

```text
%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
```

- **Via WSL** (mesclando automaticamente e preservando seus `profiles.list` e `defaultProfile` existentes com `jq`):

  ```bash
  WT_SETTINGS="$(wslpath "$(cmd.exe /c 'echo %LOCALAPPDATA%' 2>/dev/null | tr -d '\r')")/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"
  cp "$WT_SETTINGS" "${WT_SETTINGS}.bak"
  jq -s '.[0] * .[1] * {profiles: {list: .[0].profiles.list}}' "$WT_SETTINGS" config/misc/windows-terminal.json > "${WT_SETTINGS}.tmp" && mv "${WT_SETTINGS}.tmp" "$WT_SETTINGS"
  ```

- **Via WSL** (cópia direta sobrescrevendo o `settings.json`):
  ```bash
  WT_SETTINGS="$(wslpath "$(cmd.exe /c 'echo %LOCALAPPDATA%' 2>/dev/null | tr -d '\r')")/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"
  cp "$WT_SETTINGS" "${WT_SETTINGS}.bak"
  cp config/misc/windows-terminal.json "$WT_SETTINGS"
  ```

### 4. Atalhos Configurados (Herdados do Kitty)

| Atalho             | Ação no Windows Terminal | Equivalente no Kitty | Descrição                                                                   |
| :----------------- | :----------------------- | :------------------- | :-------------------------------------------------------------------------- |
| `Ctrl + Shift + T` | `duplicateTab`           | `new_tab_with_cwd`   | Abre uma nova aba mantendo o diretório atual                                |
| `Ctrl + .`         | `nextTab`                | `next_tab`           | Avança para a próxima aba                                                   |
| `Ctrl + ,`         | `prevTab`                | `previous_tab`       | Volta para a aba anterior _(para abrir as Settings use `Ctrl + Shift + ,`)_ |
