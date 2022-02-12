
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library",    "swift_grpc_library",
    "swift_proto_library",     "swift_binary",
)
load("@rules_proto//proto:defs.bzl", "proto_library")

swift_library(
    name = "logic",
    srcs = glob(["**/*.swift"]),
    visibility = ["//visibility:public"],
    module_name = "Logic",
    deps = ["@swift_pkgs//grpc-swift:GRPC"]
)

swift_library(
        name = "simple3",
    srcs = ["main.swift"],
    visibility = ["//visibility:public"],
    # visibility = ["//swift:__subpackages__"],
    deps = [
        "@swift_pkgs//grpc-swift:GRPC",
    ],
)
