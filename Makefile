.PHONY: all help lint-sh bat btop flameshot ghostwriter kitty lazydocker lazygit nvim oh-my-zsh profile

all:
	@bash ./actions/all.sh

help:
	@echo "Available commands:"
	@echo "  make all             Setup all configs"
	@echo "  make help            Display this help message"
	@echo "  make lint-sh         Validate shell script syntax (safe on host)"
	@echo "  make bat             Link bat config to ~/.config/bat"
	@echo "  make btop            Link btop config to ~/.config/btop"
	@echo "  make flameshot       Link flameshot config to ~/.config/flameshot"
	@echo "  make ghostwriter     Setup Ghostwriter theme and config"
	@echo "  make kitty           Link kitty config to ~/.config/kitty"
	@echo "  make lazydocker      Link lazydocker config to ~/.config/lazydocker"
	@echo "  make lazygit         Link lazygit config to ~/.config/lazygit"
	@echo "  make nvim            Link neovim config to ~/.config/nvim"
	@echo "  make oh-my-zsh       Install Oh My ZSH and plugins"
	@echo "  make profile         Link profile config"

lint-sh:
	@for f in actions/*.sh utils/*.sh; do bash -n "$$f" || exit 1; done
	@echo "✓ All bash scripts passed syntax check."

bat:
	@bash ./actions/bat.sh

btop:
	@bash ./actions/btop.sh

flameshot:
	@bash ./actions/flameshot.sh

ghostwriter:
	@bash ./actions/ghostwriter.sh

kitty:
	@bash ./actions/kitty.sh

lazydocker:
	@bash ./actions/lazydocker.sh

lazygit:
	@bash ./actions/lazygit.sh

nvim:
	@bash ./actions/nvim.sh

oh-my-zsh:
	@bash ./actions/oh-my-zsh.sh

profile:
	@bash ./actions/profile.sh
