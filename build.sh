#!/bin/bash
brew install mint && mint install uber/mockolo@1.7.0 && bazelisk build xcodeproj && bazelisk build ios-app
