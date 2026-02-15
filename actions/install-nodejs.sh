NODE_VERSION=24
NVM_VERSION=0.40.3

NPM_PACKAGES=(
  @styled/typescript-styled-plugin
  yarn
)

echo "Installing NVM and Node..."

echo "Installing NVM..."
wget -qO- "https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh" | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "Installing Node ${NODE_VERSION}..."
nvm install "${NODE_VERSION}"

echo "Installing packages..."

for package in "${NPM_PACKAGES[@]}"; do
  npm install -g "${package}"
done

echo "NVM and Node installed."
