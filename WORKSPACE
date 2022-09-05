load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

git_repository(
    name = "com_github_buildbuddy_io_rules_xcodeproj",
    remote = "https://github.com/buildbuddy-io/rules_xcodeproj.git",
    commit = "130476fe70e9c56f82f2bf9db9dbc382fc9dd723",
    shallow_since = "1661805004 -0500",
)


load(
    "@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:repositories.bzl",
    "xcodeproj_rules_dependencies",
)

xcodeproj_rules_dependencies()

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()









git_repository(
    name = "rules_proto_grpc",
    remote = "https://github.com/rules-proto-grpc/rules_proto_grpc.git",
    tag = "4.1.0",
)

load("@rules_proto_grpc//:repositories.bzl", "rules_proto_grpc_toolchains", "rules_proto_grpc_repos")
rules_proto_grpc_toolchains()
rules_proto_grpc_repos()

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")
rules_proto_dependencies()
rules_proto_toolchains()

load("@rules_proto_grpc//swift:repositories.bzl", rules_proto_grpc_swift_repos = "swift_repos")

rules_proto_grpc_swift_repos()

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")


# Recompiles every time the $PATH changes (all the time)
http_archive(
    name = "protobuf",
        #    https://github.com/protocolbuffers/protobuf/releases/download/v3.20.0/protobuf-cpp-3.20.0.tar.gz
    url = "https://github.com/google/protobuf/releases/download/v3.19.4/protobuf-cpp-3.19.4.zip",
    strip_prefix = "protobuf-3.19.4",
)

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")
new_git_repository(
    name = "cleanse-repo",
    remote = "https://github.com/square/cleanse.git",
    # tag = "4.2.6",
    commit = "c854787f83d99527587b5387f04ccd0030e6133a",
    shallow_since = "1598987494 -0700",
    build_file_content = """
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "Cleanse",
    module_name = "Cleanse",
    srcs = glob(["Cleanse/**/*.swift"]),
    visibility = ["//visibility:public"],
 )""",
)










new_git_repository(
    name = "grpc-swift-repo",
    remote = "https://github.com/grpc/grpc-swift.git",
    commit = "8fcf4f3765a09fdebd6bb4a504ab48cccf617619",
    build_file_content = """
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library", "swift_binary", "swift_c_module")
load("@build_bazel_rules_apple//apple:apple.bzl","apple_static_framework_import")
load(
    "@build_bazel_rules_apple//apple:macos.bzl",
    "macos_command_line_application",
)

macos_command_line_application(
        name = "protoc-gen-grpc-swift",
        deps = ["protoc-gen-grpc-swift-l"],
        minimum_os_version = "10.11",
        visibility = ["//visibility:public"],
)

swift_library(
    name = "protoc-gen-grpc-swift-l",
    deps = ["@swift-protobuf-repo//:SwiftProtobuf", "@swift-protobuf-repo//:SwiftProtobufPluginLibrary"],
    srcs = glob(["Sources/protoc-gen-grpc-swift/*.swift"]),
    # outs = ["protoc-gen-grpc-swift.a"],
    visibility = ["//visibility:public"],
    alwayslink = True,
)



objc_library(
    name = "CGRPCZlib",
    module_name = "CGRPCZlib",
    hdrs = glob(["Sources/CGRPCZlib/include/**"]),
    srcs = glob(["Sources/CGRPCZlib/**/*.c"]),
    visibility = ["//visibility:public"],
    includes = [".", "Sources/CGRPCZlib/include"],
    sdk_dylibs = ["z"],# "libswift_Concurrency"],
        # sdk_dylibs = [".dylib"],
 )





# apple_static_framework_import(
#    name = "z",
#    sdk_dylibs = glob(["z"]),
# )

swift_library(
    name = "GRPC",
    module_name = "GRPC",
    srcs = glob(["Sources/GRPC/**/*.swift"]),
    visibility = ["//visibility:public"],
    deps = [
        "@swift-nio-repo//:NIO",
        "@swift-nio-repo//:NIOPosix",
        "@swift-nio-repo//:NIOEmbedded",
        "@swift-nio-repo//:NIOFoundationCompat",
        "@swift-nio-repo//:NIOTLS",
        "@swift-nio-repo//:NIOHTTP1",




        "@swift-nio-repo//:NIOCore",
        "@swift-nio-http2-repo//:NIOHPACK",
        "@swift-log-repo//:Logging",
        "@swift-protobuf-repo//:SwiftProtobuf",
        "@swift-nio-http2-repo//:NIOHTTP2",
        "@swift-nio-transport-services-repo//:NIOTransportServices",
        ":CGRPCZlib",
        "@swift-nio-extras-repo//:NIOExtras",
    ],
)""",
)




# XCHammer doesn't seem to work for git repos:
new_git_repository(
    name = "swift-nio-repo",
    remote = "https://github.com/apple/swift-nio.git",
    tag = "2.33.0",
    build_file_content = """
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library", "swift_module_alias", "swift_c_module")


swift_library(
    name = "NIO",
    module_name = "NIO",
    srcs = glob(["Sources/NIO/**/*.swift"]),
    visibility = ["//visibility:public"],
    generates_header = False,
    deps = ["NIOCore", "NIOEmbedded", "_NIODataStructures", "NIOPosix"],
)

# swift_module_alias(
#     name = "NIO",
#     module_name = "NIO",
#     deps = ["NIOCore", "NIOEmbedded", "_NIODataStructures", "NIOPosix"],
#     visibility = ["//visibility:public"],
# )

swift_library(
    name = "_NIODataStructures",
    module_name = "_NIODataStructures",
    srcs = glob(["Sources/_NIODataStructures/*.swift"]),
    visibility = ["//visibility:public"],
)

swift_library(
    name = "NIOCore",
    module_name = "NIOCore",
    srcs = glob(["Sources/NIOCore/**/*.swift"]),
    visibility = ["//visibility:public"],
    # generates_header = True,
    deps = ["NIOConcurrencyHelpers"],
    copts = ["-swift-version", "5"],
 )

swift_library(
    name = "NIOConcurrencyHelpers",
    module_name = "NIOConcurrencyHelpers",
    srcs = glob(["Sources/NIOConcurrencyHelpers/**/*.swift"]),
    visibility = ["//visibility:public"],
    # deps = ["CNIOAtomics-i"],
    deps = ["CNIOAtomics"],
    # tags = ["xchammer"],
)








# def _impl(repo_ctx):
#   repo_ctx.download_and_extract(...)
#   repo_ctx.file('BUILD', content = ...)
#   repo_ctx.file('config.h', content = ...)

# my_source_lib = repository_rule(
#   implementation = _impl,
#   local = False,
# )











# genrule(
#     # output_to_bindir = True,
#     name = "cnio_modulemaps",
#     outs = ["Sources/CNIOAtomics/CNIOAtomics.modulemap"],
#     cmd = \"\"\" tee $@ <<EOF
# module "CNIOAtomics" {
#     export *
#     header "external/swift-nio-repo/Sources/CNIOAtomics/include/CNIOAtomics.h"
# }
# EOF\"\"\"
# )

# genrule(
#     name = "cnio_modulemaps",
#     outs = ["$(GENDIR)/CNIOAtomics.modulemap"],
#     cmd = 
#     \"""$(GENDIR)/CNIOAtomicsa.modulemap <<< \\"module \\"CNIOAtomics\\" { 
#     export *
#     header \\"external/swift-nio-repo/Sources/CNIOAtomics/include/CNIOAtomics.h\\"
#     }\\"\""",
#     # srcs = protos,
#     # exec_tools = tools,
#     # tags = ["xchammer"],
# )



# swift_c_module(
#     name = "CNIOAtomics",
#     deps = ["CNIOAtomics-a"],
#     module_map = "Sources/CNIOAtomics/CNIOAtomics.modulemap",
#     module_name = "CNIOAtomics",
#     # files = [],
# )
# cc_library(
#     # data = ["CNIOAtomics.modulemap"],
objc_library(
    name = "CNIOAtomics",
    # module_name = "CNIOAtomics",
    hdrs = glob(["Sources/CNIOAtomics/include/**"]),
    includes = ["Sources/CNIOAtomics/include"],
    srcs = glob(["Sources/CNIOAtomics/src/**"]),
    visibility = ["//visibility:public"],
    # data = [":cnio_modulemaps"],
    # tags = ["xchammer"],
    # enable_modules = True,
    # tags = ["swift_module=CNIOAtomics"],
)

swift_library(
   name = "NIOPosix",
   module_name = "NIOPosix",
   srcs = glob(["Sources/NIOPosix/**/*.swift"]),
   visibility = ["//visibility:public"],
   deps = ["NIOCore", "CNIODarwin", "_NIODataStructures"],
)

swift_library(
   name = "NIOEmbedded",
   module_name = "NIOEmbedded",
   srcs = glob(["Sources/NIOEmbedded/**/*.swift"]),
   visibility = ["//visibility:public"],
   deps = ["NIOCore", "_NIODataStructures", "CNIOAtomics"],
)

swift_library(
   name = "NIOFoundationCompat",
   module_name = "NIOFoundationCompat",
   srcs = glob(["Sources/NIOFoundationCompat/**/*.swift"]),
   visibility = ["//visibility:public"],
   deps = ["NIOCore"],
)

swift_library(
   name = "NIOTLS",
   module_name = "NIOTLS",
   srcs = glob(["Sources/NIOTLS/**/*.swift"]),
   visibility = ["//visibility:public"],
   deps = ["NIOCore"],
)

swift_library(
   name = "NIOHTTP1",
   module_name = "NIOHTTP1",
   srcs = glob(["Sources/NIOHTTP1/**/*.swift"]),
   visibility = ["//visibility:public"],
   deps = ["NIOCore", "CNIOHTTPParser"],
)

objc_library(
    name = "CNIOHTTPParser",
    module_name = "CNIOHTTPParser",
    hdrs = glob(["Sources/CNIOHTTPParser/include/**"]),
    # # includes = ["Sources/CNIOHTTPParser/include"],
    includes = [".", "Sources/CNIOHTTPParser/include"],
    srcs = glob(["Sources/CNIOHTTPParser/*.c"]),
    visibility = ["//visibility:public"],
)

objc_library(
    name = "CNIODarwin",
    module_name = "CNIODarwin",
    hdrs = ["Sources/CNIODarwin/include/CNIODarwin.h"],
    # includes = ["Sources/CNIODarwin/include"],
    includes = [".", "Sources/CNIODarwin/include"],
    srcs = glob(["Sources/CNIODarwin/**/*.c"]),
    visibility = ["//visibility:public"],
    defines = ["__APPLE_USE_RFC_3542"],
    # sdk_dylibs = ["system"]
)


#  swift_library(
#     name = "NIOExtras",
#     module_name = "NIOExtras",
#     srcs = glob(["Sources/NIOExtras/**/*.swift"]),
#     visibility = ["//visibility:public"],
#     # deps = ["NIOCore"],
#  )

#  swift_library(
#     name = "Logging",
#     module_name = "Logging",
#     srcs = glob(["Sources/Logging/**/*.swift"]),
#     visibility = ["//visibility:public"],
#     # deps = ["NIOCore"],
#  )

#   swift_library(
#     name = "Protobuf",
#     module_name = "Protobuf",
#     srcs = glob(["Sources/Protobuf/**/*.swift"]),
#     visibility = ["//visibility:public"],
#     # deps = ["NIOCore"],
#  )

 """,
)

new_git_repository(
    name = "swift-nio-http2-repo",
    remote = "https://github.com/apple/swift-nio-http2.git",
    # tag = "1.19.2",
    tag = "1.18.2",
    build_file_content = """
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
   name = "NIOHPACK",
   module_name = "NIOHPACK",
   srcs = glob(["Sources/NIOHPACK/**"]),
   visibility = ["//visibility:public"],
   deps = ["@swift-nio-repo//:NIOCore", "@swift-nio-repo//:NIOHTTP1", "@swift-nio-repo//:CNIODarwin", "@swift-nio-repo//:NIO"],
)


swift_library(
   name = "NIOHTTP2",
   module_name = "NIOHTTP2",
   srcs = glob(["Sources/NIOHTTP2/**/*.swift"]),
   visibility = ["//visibility:public"],
   deps = ["@swift-nio-repo//:NIOCore", "NIOHPACK", "@swift-nio-repo//:NIOTLS"],
)
""",
)




#unowned
new_git_repository(
    name = "swift-nio-transport-services-repo",
    remote = "https://github.com/apple/swift-nio-transport-services.git",
    tag = "1.11.1",
    build_file_content = """
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
  name = "NIOTransportServices",
  module_name = "NIOTransportServices",
  srcs = glob(["Sources/NIOTransportServices/**/*.swift"]),
  visibility = ["//visibility:public"],
  deps = ["@swift-nio-repo//:NIO", "@swift-nio-repo//:NIOTLS", "@swift-nio-repo//:NIOFoundationCompat"]
)
""",
)


new_git_repository(
    name = "swift-nio-extras-repo",
    remote = "https://github.com/apple/swift-nio-extras.git",
    tag = "1.4.0",
    build_file_content = """
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
   name = "NIOExtras",
   module_name = "NIOExtras",
   srcs = glob(["Sources/NIOExtras/**/*.swift"]),
   visibility = ["//visibility:public"],
   deps = ["@swift-nio-repo//:NIO", # code imports this
        # XCHammer requires these:
        "@swift-nio-repo//:NIOCore",
        "@swift-nio-repo//:NIOEmbedded",
        "@swift-nio-repo//:_NIODataStructures",
        "@swift-nio-repo//:NIOPosix"],
)
""",
)


new_git_repository(
    name = "swift-protobuf-repo",
    remote = "https://github.com/apple/swift-protobuf.git",
    # tag = "1.9.0",
    commit = "7f36441e3372665b1b414f8ac93b5905cc42a405",
    build_file_content = """
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load(
    "@build_bazel_rules_apple//apple:macos.bzl",
    "macos_command_line_application",
)

macos_command_line_application(
        name = "protoc-gen-swift",
        deps = ["protoc-gen-swift-l"],
        minimum_os_version = "10.11",
        visibility = ["//visibility:public"],
)

swift_library(
    name = "protoc-gen-swift-l",
    deps = ["@swift-protobuf-repo//:SwiftProtobuf", "@swift-protobuf-repo//:SwiftProtobufPluginLibrary"],
    srcs = glob(["Sources/protoc-gen-swift/*.swift"]),
    visibility = ["//visibility:public"],
    alwayslink = True,
)

swift_library(
   name = "SwiftProtobuf",
   module_name = "SwiftProtobuf",
   srcs = glob(["Sources/SwiftProtobuf/**/*.swift"]),
   visibility = ["//visibility:public"],
   # deps = ["NIOCore"],
)

swift_library(
   name = "SwiftProtobufPluginLibrary",
   module_name = "SwiftProtobufPluginLibrary",
   srcs = glob(["Sources/SwiftProtobufPluginLibrary/**/*.swift"]),
   visibility = ["//visibility:public"],
   deps = ["SwiftProtobuf"],
)
""",
)

new_git_repository(
    name = "swift-log-repo",
    remote = "https://github.com/apple/swift-log.git",
    tag = "1.4.0",
    build_file_content = """
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
   name = "Logging",
   module_name = "Logging",
   srcs = glob(["Sources/Logging/**/*.swift"]),
   visibility = ["//visibility:public"],
   # deps = ["NIOCore"],
)
""",
)

# new_git_repository(
#     name = "swift-argument-parser-repo",
#     remote = "https://github.com/apple/swift-argument-parser.git",
#     tag = "1.0.0",
#     build_file_content = """
# load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

# swift_library(
#    name = "SwiftProtobuf",
#    module_name = "SwiftProtobuf",
#    srcs = glob(["Sources/SwiftProtobuf/**/*.swift"]),
#    visibility = ["//visibility:public"],
#    # deps = ["NIOCore"],
# )
# """,
# )







new_git_repository(
    name = "swift-syntax-repo",
    remote = "https://github.com/apple/swift-syntax.git",
    tag = "0.50600.1",
    build_file_content = """
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
   name = "SwiftSyntaxParser",
   module_name = "SwiftSyntaxParser",
   srcs = glob(["Sources/SwiftSyntaxParser/**/*.swift"]),
   visibility = ["//visibility:public"],
   deps = ["_CSwiftSyntax"],
)



swift_library(
   name = "_CSwiftSyntax",
   module_name = "_CSwiftSyntax",
   srcs = glob(["Sources/_CSwiftSyntax/**/*.swift"]),
   visibility = ["//visibility:public"],
   # deps = ["NIOCore"],
)
""",
)

# http_archive(
#     name = "mockolo",
#     url = "https://github.com/uber/mockolo/releases/download/1.7.0/mockolo.tar.gz",
#     strip_prefix = "mockolo",
#     visibility = ["//visibility:public"],
# )




new_git_repository(
    name = "swift-argument-parser",
    remote = "https://github.com/apple/swift-argument-parser",
    commit = "1.0.3",
    build_file_content = """

"""
)


new_git_repository(
    name = "swift-tools-support-core",
    remote = "https://github.com/apple/swift-tools-support-core.git",
    commit = "1.0.3",
    build_file_content = """
"""
)



new_git_repository(
    name = "mockolo",
    remote = "https://github.com/uber/mockolo.git",
    commit = "b006932f6821c161ccf684597fe8c836f42a7d7e",
    build_file_content = """

load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library", "swift_binary", "swift_c_module")
load("@build_bazel_rules_apple//apple:apple.bzl","apple_static_framework_import")
load(
    "@build_bazel_rules_apple//apple:macos.bzl",
    "macos_command_line_application",
)

macos_command_line_application(
        name = "mockolo",
        deps = ["MockoloFramework", "SwiftToolsSupport-auto", ArgumentParser],
        minimum_os_version = "10.11",
        visibility = ["//visibility:public"],
)

swift_library(
    name = "MockoloFramework",
    module_name = "MockoloFramework",
    srcs = glob(["Sources/MockoloFramework/**/*.swift"]),
    visibility = ["//visibility:public"],
    deps = ["SwiftSyntaxParser"],
)

"""
)