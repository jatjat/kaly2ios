
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

grpc_stubs = [
        "Infrastructure/Impl/Protos/MapService.grpc.swift",
        "Infrastructure/Impl/Protos/RobotService.grpc.swift",
        "Infrastructure/Impl/Protos/SessionService.grpc.swift"
      ]
proto_models = [
        "Infrastructure/Impl/Protos/MapService.pb.swift",
        "Infrastructure/Impl/Protos/RobotService.pb.swift",
        "Infrastructure/Impl/Protos/SessionService.pb.swift"
]
tools = ["@protobuf//:protoc", "@swift_pkgs//grpc-swift:protoc-gen-grpc-swift"]
protos = glob([
        "**/*.proto",
    ])

swift_library(
    name = "logic",
    srcs = glob(["API/**/*.swift"]) + glob(["Impl/**/*.swift"]) + grpc_stubs + proto_models,
    visibility = ["//visibility:public"],
    module_name = "logic",
    deps = ["@swift_pkgs//grpc-swift:GRPC"],
)

genrule(
    name = "grpc_stubs",
    outs = grpc_stubs,
    cmd = """
    $(location @protobuf//:protoc) \
    --plugin=$(location @swift_pkgs//grpc-swift:protoc-gen-grpc-swift) \
    --grpc-swift_out=Client=true,ExperimentalAsyncClient=true:$(GENDIR) \
    --proto_path=. $(SRCS)
    """,
    srcs = protos,
    tools = tools,
)

genrule(
    name = "proto_models",
    outs = proto_models,
    cmd = """
    $(location @protobuf//:protoc) \
    --plugin=$(location @swift_pkgs//grpc-swift:protoc-gen-grpc-swift) \
    --swift_out=$(GENDIR) \
    --proto_path=. $(SRCS)
    """,
    srcs = protos,
    tools = tools,
)
