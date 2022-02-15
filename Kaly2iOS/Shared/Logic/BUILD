
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library",    "swift_grpc_library",
    "swift_proto_library",     "swift_binary")
load("@rules_proto//proto:defs.bzl", "proto_library")

outs = [
        "Infrastructure/Protos/MapService.grpc.swift",
        "Infrastructure/Protos/RobotService.grpc.swift",
        "Infrastructure/Protos/SessionService.grpc.swift"
      ]

swift_library(
    name = "logic",
    srcs = glob(["**/*.swift"]) + outs,
    visibility = ["//visibility:public"],
    module_name = "logic",
    deps = ["@swift_pkgs//grpc-swift:GRPC"],
)

genrule(
    name = "prot",
    outs = outs,
    cmd = """
    $(location @protobuf//:protoc) \
    --plugin=$(location @swift_pkgs//grpc-swift:protoc-gen-grpc-swift) \
    --grpc-swift_out=Client=true,ExperimentalAsyncClient=true:$(GENDIR) \
    --proto_path=. $(SRCS)
    """,
    srcs = glob([
        "**/*.proto",
    ]),
    tools = ["@protobuf//:protoc", "@swift_pkgs//grpc-swift:protoc-gen-grpc-swift"],
)
