# Profile

## About

This is my personal profile config.

## Requirements

You need to install:

- [JetBrains Mono Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/Ligatures)
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

> [!NOTE]
> The configs include my personal aliases, plugins and themes.  
> Also include the link to [NVM](https://github.com/nvm-sh/nvm).

## Installing

Make a backup of your current profile

```bash
mv ~/.zshrc ~/.zshrc.bak
mv ~/.profile ~/.profile.bak
mv ~/.p10k.zsh ~/.p10k.zsh.bak
```

Clone my config

```bash
git clone --depth 1 https://github.com/gabrielscaranello/dotfiles /tmp/dotfiles
```

Copy the cloned config to Home

```bash
cp /tmp/dotfiles/config/profile/alias ~/.alias
cp /tmp/dotfiles/config/profile/profile ~/.profile
cp /tmp/dotfiles/config/profile/p10k ~/.p10k
cp /tmp/dotfiles/config/profile/zshrc ~/.zshrc
```

> [!TIP]  
> You can run my personal script to install oh-my-zsh and powerlevel10k.  
> Run `make oh-my-zsh`.

