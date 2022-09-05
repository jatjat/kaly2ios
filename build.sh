#!/bin/bash
# on CI:
BREW=/usr/local/bin/brew
BAZELISK=/usr/local/bin/bazelisk
MINT=/usr/local/bin/mint

# # on local:
# BREW=/opt/homebrew/bin/brew
# BAZELISK=/opt/homebrew/bin/bazelisk
# MINT=/opt/homebrew/bin/mint




which brew && which mint && export PATH="" && $BREW install mint && $MINT bootstrap && $BAZELISK build xcodeproj && $BAZELISK build ios-app
