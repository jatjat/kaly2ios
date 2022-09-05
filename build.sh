#!/bin/bash
# on CI:
BREW_CMD=/usr/local/bin/brew
BAZELISK_CMD=/usr/local/bin/bazelisk
MINT_CMD=/usr/local/bin/mint

# # on local:
# BREW=/opt/homebrew/bin/brew
# BAZELISK=./opt/homebrew/bin/bazelisk
# MINT=./opt/homebrew/bin/mint




which brew && which mint && export PATH="" && /usr/local/bin/brew install mint && /usr/local/bin/mint bootstrap && /usr/local/bin/bazelisk build xcodeproj && /usr/local/bin/bazelisk build ios-app
