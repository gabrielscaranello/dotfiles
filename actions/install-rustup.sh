#! /bin/bash

URL="https://sh.rustup.rs"

PACKAGES=(
  tree-sitter-cli
)

echo "Installing rustup..."
curl --proto '=https' --tlsv1.2 -sSf "$URL" | sh -s -- -y --default-toolchain stable --no-modify-path
source "$HOME/.cargo/env"
rustup default stable

echo "Installing cargo packages..."

for package in "${PACKAGES[@]}"; do
  cargo install "${package}"
done

echo "Cargo packages installed."
echo "Rustup installed."
