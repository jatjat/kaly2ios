# kaly2ios
An iOS frontend for the kaly2 SLAM &amp; Navigation project

## Developing with Xcode
1) Install Xcode 13.2.1, and xcode-select it
2) Ensure Bazelisk is installed: `brew install bazelisk`
3) Generate Xcodeproject: `bazel build XcodeBazel`
4) Open `XcodeBazel.xcodeproj`

## Helpful scripts
Run `format.sh` to format code, `build.sh` to build the app, and `test.sh` to test it.