load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "common-api",
    module_name = "CommonAPI",
    srcs = glob(["Sources/CommonAPI/**/*.swift"]),
    visibility = ["//visibility:public"],
)

swift_library(
    name = "common",
    module_name = "Common",
    srcs = glob(["Sources/Common/**/*.swift"]),
    visibility = ["//visibility:public"],
    deps = ["//Kaly2iOS/Common:common-api"],
)
