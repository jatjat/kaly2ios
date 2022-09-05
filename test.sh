#!/bin/bash
bazelisk build ios-app && bazelisk build xcodeproj && bazelisk test //Kaly2iOS/... --build_tests_only
