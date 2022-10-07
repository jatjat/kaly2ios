load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

git_repository(
    name = "com_github_buildbuddy_io_rules_xcodeproj",
    commit = "1e95b0d0afd16b2aec2723fa19e616f916e460a1",
    remote = "https://github.com/buildbuddy-io/rules_xcodeproj.git",
    # commit = "7ee46ec29bb4365f2c81525200a078b80bf5ca4a",
    # commit = "130476fe70e9c56f82f2bf9db9dbc382fc9dd723",
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

load("@rules_proto_grpc//:repositories.bzl", "rules_proto_grpc_repos", "rules_proto_grpc_toolchains")

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
    strip_prefix = "protobuf-3.19.4",
    #    https://github.com/protocolbuffers/protobuf/releases/download/v3.20.0/protobuf-cpp-3.20.0.tar.gz
    url = "https://github.com/google/protobuf/releases/download/v3.19.4/protobuf-cpp-3.19.4.zip",
)

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

new_git_repository(
    name = "cleanse-repo",
    build_file_content = """
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "Cleanse",
    module_name = "Cleanse",
    srcs = glob(["Cleanse/**/*.swift"]),
    visibility = ["//visibility:public"],
                    alwayslink = True,
 )""",
    # tag = "4.2.6",
    commit = "c854787f83d99527587b5387f04ccd0030e6133a",
    remote = "https://github.com/square/cleanse.git",
    shallow_since = "1598987494 -0700",
)

new_git_repository(
    name = "grpc-swift-repo",
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
    commit = "8fcf4f3765a09fdebd6bb4a504ab48cccf617619",
    remote = "https://github.com/grpc/grpc-swift.git",
    shallow_since = "1640008839 +0000",
)

new_git_repository(
    name = "swift-nio-repo",
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
)

objc_library(
    name = "CNIOAtomics",
    # module_name = "CNIOAtomics",
    hdrs = glob(["Sources/CNIOAtomics/include/**"]),
    includes = ["Sources/CNIOAtomics/include"],
    srcs = glob(["Sources/CNIOAtomics/src/**"]),
    visibility = ["//visibility:public"],
    # data = [":cnio_modulemaps"],
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

 """,
    # tag = "2.33.0",
    commit = "6aa9347d9bc5bbfe6a84983aec955c17ffea96ef",
    remote = "https://github.com/apple/swift-nio.git",
    shallow_since = "1632408653 +0200",
)

new_git_repository(
    name = "swift-nio-http2-repo",
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
    remote = "https://github.com/apple/swift-nio-http2.git",
    # tag = "1.19.2",
    tag = "1.18.2",
)

#unowned
new_git_repository(
    name = "swift-nio-transport-services-repo",
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
    remote = "https://github.com/apple/swift-nio-transport-services.git",
    tag = "1.11.1",
)

new_git_repository(
    name = "swift-nio-extras-repo",
    build_file_content = """
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
   name = "NIOExtras",
   module_name = "NIOExtras",
   srcs = glob(["Sources/NIOExtras/**/*.swift"]),
   visibility = ["//visibility:public"],
   deps = ["@swift-nio-repo//:NIO", # code imports this line only
        "@swift-nio-repo//:NIOCore",
        "@swift-nio-repo//:NIOEmbedded",
        "@swift-nio-repo//:_NIODataStructures",
        "@swift-nio-repo//:NIOPosix"],
)
""",
    # tag = "1.4.0",
    commit = "b4dbfacff47fb8d0f9e0a422d8d37935a9f10570",
    remote = "https://github.com/apple/swift-nio-extras.git",
    shallow_since = "1579607023 +0000",
)

new_git_repository(
    name = "swift-protobuf-repo",
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
    # tag = "1.9.0",
    commit = "7f36441e3372665b1b414f8ac93b5905cc42a405",
    remote = "https://github.com/apple/swift-protobuf.git",
    shallow_since = "1589825556 -0400",
)

new_git_repository(
    name = "swift-log-repo",
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
    remote = "https://github.com/apple/swift-log.git",
    tag = "1.4.0",
)

new_git_repository(
    name = "swift-syntax-repo",
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
    remote = "https://github.com/apple/swift-syntax.git",
    tag = "0.50600.1",
)

new_git_repository(
    name = "swift-argument-parser",
    build_file_content = """

""",
    commit = "1.0.3",
    remote = "https://github.com/apple/swift-argument-parser",
)

new_git_repository(
    name = "swift-tools-support-core",
    build_file_content = """
""",
    commit = "1.0.3",
    remote = "https://github.com/apple/swift-tools-support-core.git",
)

new_git_repository(
    name = "mockolo",
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

""",
    commit = "b006932f6821c161ccf684597fe8c836f42a7d7e",
    remote = "https://github.com/uber/mockolo.git",
)

# Buildifier:

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# buildifier is written in Go and hence needs rules_go to be built.
# See https://github.com/bazelbuild/rules_go for the up to date setup instructions.
http_archive(
    name = "io_bazel_rules_go",
    sha256 = "d6b2513456fe2229811da7eb67a444be7785f5323c6708b38d851d2b51e54d83",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.30.0/rules_go-v0.30.0.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.30.0/rules_go-v0.30.0.zip",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_rules_dependencies")

go_rules_dependencies()

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains")

go_register_toolchains(version = "1.17.2")

http_archive(
    name = "bazel_gazelle",
    sha256 = "de69a09dc70417580aabf20a28619bb3ef60d038470c7cf8442fafcf627c21cb",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.24.0/bazel-gazelle-v0.24.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.24.0/bazel-gazelle-v0.24.0.tar.gz",
    ],
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

# If you use WORKSPACE.bazel, use the following line instead of the bare gazelle_dependencies():
# gazelle_dependencies(go_repository_default_config = "@//:WORKSPACE.bazel")
gazelle_dependencies()

http_archive(
    name = "com_google_protobuf",
    sha256 = "3bd7828aa5af4b13b99c191e8b1e884ebfa9ad371b0ce264605d347f135d2568",
    strip_prefix = "protobuf-3.19.4",
    urls = [
        "https://github.com/protocolbuffers/protobuf/archive/v3.19.4.tar.gz",
    ],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = "ae34c344514e08c23e90da0e2d6cb700fcd28e80c02e23e4d5715dddcb42f7b3",
    strip_prefix = "buildtools-4.2.2",
    urls = [
        "https://github.com/bazelbuild/buildtools/archive/refs/tags/4.2.2.tar.gz",
    ],
)
