#!/bin/bash
bazelisk test //Kaly2iOS/... --build_tests_only && bazelisk build ios-app && bazelisk build XcodeBazel
