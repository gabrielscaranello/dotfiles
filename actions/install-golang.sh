#! /bin/bash

VERSION=1.26.0
FILENAME=go${VERSION}.linux-amd64.tar.gz
DOWNLOAD_URL=https://go.dev/dl/${FILENAME}
DOWNLOAD_FILE=/tmp/${FILENAME}
TARGET_DIR=/usr/local
INSTALL_DIR=${TARGET_DIR}/go

PACKAGES=(
  github.com/reteps/dockerfmt@latest
)

echo "Installing Golang V.${VERSION}..."

echo "Removing any previous installation..."
sudo rm -rf $DOWNLOAD_FILE $INSTALL_DIR

echo "Downloading..."
wget -c $DOWNLOAD_URL -O $DOWNLOAD_FILE

echo "Extracting..."
sudo tar -C $TARGET_DIR -xzf $DOWNLOAD_FILE

echo "Go installation done"

echo "Installing packages..."
for package in "${PACKAGES[@]}"; do
  echo "Installing ${package}..."
  $INSTALL_DIR/bin/go install "${package}"
done

echo "Golang packages installation done"
