#!/bin/bash

#!/bin/bash
# on CI:
BREW=/usr/local/bin/brew
BAZELISK=/usr/local/bin/bazelisk
MINT=/usr/local/bin/mint

# # on local:
# BREW=/opt/homebrew/bin/brew
# BAZELISK=/opt/homebrew/bin/bazelisk
# MINT=/opt/homebrew/bin/mint


export PATH="" && $BAZELISK build ios-app && $BAZELISK build xcodeproj && $BAZELISK test //Kaly2iOS/... --build_tests_only
