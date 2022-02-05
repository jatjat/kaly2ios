# load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library",     "swift_binary",
# )


load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library",    "swift_grpc_library",
    "swift_proto_library",     "swift_binary",
)
load("@rules_proto//proto:defs.bzl", "proto_library")

swift_library(
    name = "logic",
    srcs = glob(["**/*.swift"]),
    visibility = ["//visibility:public"],
    module_name = "Logic",
    # deps = ["wat_swift_grpc"]
)

# new gen

# load("@rules_proto_grpc//swift:defs.bzl", "swift_proto_compile")

# swift_proto_compile(
#     name = "map_swift_proto",
#     protos = ["@rules_proto_grpc//Shared/Logic/Protos/proto:MapService_proto"],
# )

# swift_proto_compile(
#     name = "robot_swift_proto",
#     protos = ["@rules_proto_grpc//Shared/Logic/Protos/proto:RobotService_proto"],
# )

# swift_proto_compile(
#     name = "session_swift_proto",
#     protos = ["@rules_proto_grpc//Shared/Logic/Protos/proto:SessionService_proto"],
# )

# end new gen


# new gen grpc

# load("@rules_proto_grpc//swift:defs.bzl", "swift_grpc_compile")

# swift_grpc_compile(
#     name = "thing_swift_grpc",
#     protos = ["@rules_proto_grpc//Shared/Logic/Protos/proto:MapService_proto"],
# )

# swift_grpc_compile(
#     name = "greeter_swift_grpc",
#     protos = ["@rules_proto_grpc//Shared/Logic/Protos/proto:MapService_proto"],
# )








# load("@rules_proto//proto:defs.bzl", "proto_library")

# proto_library(
#     name = "mapservice_proto",
#     srcs = ["//Shared/Logic/Infrastructure/Protos/MapService.proto"],
#     visibility = ["//visibility:public"],
#     # deps = [":thing_proto"],
# )

# load("@rules_proto_grpc//swift:defs.bzl", "swift_grpc_library")

# swift_proto_library(
#     name = "mapservice_proto_swift",
#     deps = [":mapservice_proto"],
# )

# swift_grpc_library(
#     module_name = "wat_swift_grpc2",
#     name = "wat_swift_grpc",
#     # srcs = [":mapservice_proto"],
#     # deps = [":mapservice_proto_swift"],
#                 flavor = "client",
#                     deps = ["CgRPC"],
#     protos = [
#         ":mapservice_proto"
#         # "@rules_proto_grpc//Shared/Logic/Protos/proto:mapservice_proto",
#         # "@rules_proto_grpc//example/proto:thing_proto",
#     ],
# )

# end new gen grpc


















# # proto_library(
# #     name = "thing_proto",
# #     srcs = [
# #         "Infrastructure/Protos/MapService.proto",
# #         "Infrastructure/Protos/RobotService.proto",
# #         "Infrastructure/Protos/SessionService.proto",
# #         ],
# #     deps = ["@com_google_protobuf//:any_proto"],
# # )




# # load("@rules_proto_grpc//swift:defs.bzl", "swift_proto_compile")

# # swift_proto_compile(
# #     name = "person_swift_proto",
# #     protos = ["@rules_proto_grpc//example/proto:person_proto"],
# # )

# # swift_proto_compile(
# #     name = "place_swift_proto",
# #     protos = ["@rules_proto_grpc//example/proto:place_proto"],
# # )

# # swift_proto_compile(
# #     name = "thing_swift_proto",
# #     protos = ["@rules_proto_grpc//example/proto:thing_proto"],
# # )




# # load("@rules_proto_grpc//swift:defs.bzl", "swift_grpc_library", "swift_proto_library")

# proto_library(
#     name = "my_protos",
#     srcs = [
#         "MapService.proto",
#         "RobotService.proto",
#         "SessionService.proto"
#         ],
# )

# # Generate Swift types from the protos.
# swift_proto_library(
#     name = "my_protos_swift",
#     # protos = [
#     #         "MapService.proto",
#     #     "RobotService.proto",
#     #     "SessionService.proto"
#     # ]
#     deps = [":my_protos"],
# )


# swift_grpc_library(
#     name = "my_protos_client_services_swift",
#     srcs = [":my_protos"],
#         flavor = "client",
#     deps = [":my_protos_swift"],


#     # protos = [
#     #     "MapService_proto",
#     #     "RobotService_proto",
#     #     "SessionService_proto",
#     # ],
# )

# # load("@rules_proto_grpc//cpp:defs.bzl", "cpp_proto_compile")

# # cpp_proto_compile(
# #     name = "cpp_thing_proto",
# #     protos = [":thing_proto"],
# # )






# spm in

load("@build_bazel_rules_swift//swift:swift.bzl", "swift_binary")

swift_binary(
    name = "simple",
    srcs = ["main.swift"],
    visibility = ["//swift:__subpackages__"],
    deps = [
        "@swift_pkgs//swift-log:Logging",
    ],
)


# end spm in