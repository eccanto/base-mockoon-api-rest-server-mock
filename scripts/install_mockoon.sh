#!/usr/bin/env bash

set -euo pipefail


if ! command -v jq &> /dev/null; then
    sudo apt install -y jq
fi

readonly DEB_NAME=mockoon-latest.deb
readonly DEPENDENCIES=.dependencies/
readonly LATEST_DEB=$(curl --silent "https://api.github.com/repos/mockoon/mockoon/releases/latest" | jq -r ".assets[].browser_download_url" | grep ".deb")

echo "downloading Mockoon GUI: ${LATEST_DEB}..."

mkdir -p "${DEPENDENCIES}"
wget "${LATEST_DEB}" -O "${DEPENDENCIES}/${DEB_NAME}"

echo "installing Mockoon GUI (latest)..."

sudo dpkg -i "${DEPENDENCIES}/${DEB_NAME}"

echo "installing Mockoon CLI (latest)..."

sudo npm install -g @mockoon/cli@latest
