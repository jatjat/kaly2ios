#!/bin/bash
brew install mint && mint bootstrap && bazelisk build xcodeproj && bazelisk build ios-app
