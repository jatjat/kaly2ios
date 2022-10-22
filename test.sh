#!/bin/bash
bazelisk build $@ ios-app && bazelisk build $@ xcodeproj && bazelisk test $@ //:ci_tests --build_tests_only
