#!/usr/bin/env bash
set -eu # stop on error or undefined variables


# Interface: Run this script to launch the Tulsi's configuration GUI.


###############################################################################
# Implementation:

cd "$( dirname "${BASH_SOURCE[0]}" )" # Change into script directory so it can be run from anywhere.

# Separating build and run so we can nicely display build status, but then still shush logging
bazel build @build_bazel_tulsi//:tulsi
bazel run @build_bazel_tulsi//:tulsi &> /dev/null & # Returning control of terminal after opening, while shushing Tulsi logging.
