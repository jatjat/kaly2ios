load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")





load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")
# PINTEREST_TULSI_COMMIT = "c9b533f4612444e0a5e0fa639d4cb508399d9e08"

# namespaced_git_repository(
#     name = "Tulsi",
#     remote = "https://github.com/pinterest/tulsi.git",
#     commit = PINTEREST_TULSI_COMMIT,
#     patch_cmds = [
#         """
#         sed -i '' 's/\\:__subpackages__/visibility\\:public/g' src/TulsiGenerator/BUILD
#         """,
#     ],
# )

http_archive(
    name = "build_bazel_tulsi",
    # Grabbing master for this example, so it always points to the latest. You may want to do otherwise.
    urls = ["https://github.com/bazelbuild/tulsi/archive/master.zip"],
    strip_prefix = "tulsi-master"
)



# # This is a hack for XCHammer development, but is how XCHammer is imported
# # into a workspace as a binary build
# new_git_repository(
#     name = "xchammer_tulsi_aspects",
#     remote = "https://github.com/pinterest/tulsi.git",
#     commit = PINTEREST_TULSI_COMMIT,
#     strip_prefix = "src/TulsiGenerator/Bazel",
#     build_file_content = "exports_files(['tulsi'])",
# )


# new_git_repository(
#     name = "xchammer_tulsi_aspects",
#     remote = "/Users/joel/Development/tulsi",
#     commit = "625067382b8eb3fd69540dfa1d3de860492958b8", # joel fix
#     strip_prefix = "src/TulsiGenerator/Bazel",
#     build_file_content = "exports_files(['tulsi'])",
# )


# load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

local_repository(
    name = "xchammer",
    path = "/Users/joel/Development/XCHammer",
)

# git_repository(
#     name = "xchammer",
#     remote  = "https://github.com/pinterest/xchammer",
#     commit = "c588329904e05072c8d674191318e64d8dabc685"
# )
load("@xchammer//third_party:repositories.bzl", "xchammer_dependencies")

xchammer_dependencies()


http_archive(
    name = "com_github_bazelbuild_buildtools",
    strip_prefix = "buildtools-5.0.0",
    url = "https://github.com/bazelbuild/buildtools/archive/5.0.0.zip",
)

# load("@com_github_bazelbuild_buildtools//buildifier:deps.bzl", "buildifier_dependencies")

# buildifier_dependencies()




## Build system
# This needs to be manually imported
# https://github.com/bazelbuild/bazel/issues/1550
git_repository(
    name = "xcbuildkit",
    commit = "b619d25f65cf7195c57e2dbc26d488e5606e763a",
    remote = "https://github.com/jerrymarino/xcbuildkit.git",
)

load("@xcbuildkit//third_party:repositories.bzl", xcbuildkit_dependencies = "dependencies")

xcbuildkit_dependencies()



# http_archive(
#     name = "xchammer",
#     sha256 = "dbb998f08a2efaade0a6e76363249cc581107d5c4fec63a1b7ef16a40b64c32e",
#     urls = [ "https://github.com/pinterest/xchammer/releases/download/v3.4.1.6/xchammer.zip" ],
# )
# git_repository(
#     name = "xchammer",
#     remote = "https://github.com/pinterest/xchammer.git",
#     commit = "c588329904e05072c8d674191318e64d8dabc685",
# )

# http_archive(
#     name = "xchammer",
#     # urls = [ "https://github.com/pinterest/xchammer/releases/download/v3.4.1.0/xchammer.zip" ],
#     # xchammer_dist

#     # urls = ["file:////Users/joel/Development/xchammer/bazel-bin/xchammer_dist_repo.zip"]
#     urls = ["file:////Users/joel/Development/xchammer/xchammer.zip"]
# )


git_repository(
    name = "build_bazel_rules_apple",
    remote = "https://github.com/bazelbuild/rules_apple.git",
    tag = "0.33.0",
    # commit = "0d1e9559332ad97dc3d2e7e5165a10f958279bf4" # see if 
)

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "build_bazel_rules_swift",
    # sha256 = "3e52a508cdc47a7adbad36a3d2b712e282cc39cc211b0d63efcaf608961eb36b",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/0.26.0/rules_swift.0.26.0.tar.gz",
)
# git_repository(
#     name = "build_bazel_rules_swift",
#     remote = "https://github.com/bazelbuild/rules_swift.git",
#     commit = "c1d7d1df6969c2675c7826ecf1202d78016b1753", 
#     # commit = "4e66b096d5f7d4b75932573f8d8745c2d5f54d2b", # old working
#     # commit = "9d4c3b1dd99cab67fa922af2b0bd0a96f791afa7", # feb 14
#     # commit = "c72cbc61f172851848826569766185c458f95e0a", # feb 4
# )


http_archive(
    name = "rules_cc",
    sha256 = "3cde212ccda3ba152897e7fd354c42eba275878b6d98fe4f2125c684a73f3842",
    strip_prefix = "rules_cc-d66a13e2a01630afcafc4ba411d83e291ecf02bd",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_cc/archive/d66a13e2a01630afcafc4ba411d83e291ecf02bd.tar.gz",
        "https://github.com/bazelbuild/rules_cc/archive/d66a13e2a01630afcafc4ba411d83e291ecf02bd.tar.gz",
    ],
)

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

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "cgrindel_rules_spm",
    sha256 = "b85d8d089c5f707b451f142718b32c647b22d0a72a5b7c1832af0f3e4d25be4f",
    strip_prefix = "rules_spm-0.9.0",
    urls = [
        "https://github.com/cgrindel/rules_spm/archive/v0.9.0.tar.gz",
    ],
)

load(
    "@cgrindel_rules_spm//spm:deps.bzl",
    "spm_rules_dependencies",
)

spm_rules_dependencies()

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
# end new spm
load("@cgrindel_rules_spm//spm:defs.bzl", "spm_pkg", "spm_repositories")

# spm_repositories(
#     name = "swift_pkgs",
#     dependencies = [
#         spm_pkg(
#             "https://github.com/grpc/grpc-swift.git",
#             # products = ["GRPC", "protoc-gen-grpc-swift"],
#             products = ["protoc-gen-grpc-swift"],
#             revision = "8fcf4f3765a09fdebd6bb4a504ab48cccf617619" #"1.6.0-async-await",
#         ),
#     ],
# )

# spm_repositories(
#     name = "swift_di_pkgs",
#     dependencies = [
#         spm_pkg(
#             "https://github.com/square/cleanse.git",
#             name = "Cleanse",
#             products = ["Cleanse"],
#             exact_version = "4.2.6"
#             #revision = "4.2.6",
#         ),
#     ],
# )



# Recompiles every time the $PATH changes (all the time)
http_archive(
    name = "protobuf",
        #    https://github.com/protocolbuffers/protobuf/releases/download/v3.20.0/protobuf-cpp-3.20.0.tar.gz
    url = "https://github.com/google/protobuf/releases/download/v3.19.4/protobuf-cpp-3.19.4.zip",
    strip_prefix = "protobuf-3.19.4",
)
# http_archive(
#     name = "protobuf",
#     url = "https://github.com/protocolbuffers/protobuf/releases/download/v3.20.0/protoc-3.20.0-osx-aarch_64.zip",
#     strip_prefix = "bin",
# )

# run_binary(
#     name = "protoc",
#     tool = "@protobuf//protoc"
# )

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")
new_git_repository(
    name = "cleanse-repo",
    remote = "https://github.com/square/cleanse.git",
    tag = "4.2.6",
    build_file_content = """
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "Cleanse",
    module_name = "Cleanse",
    srcs = glob(["Cleanse/**/*.swift"]),
    visibility = ["//visibility:public"],
 )""",
)































#   http_archive(
#       name = "my_ssl",
#       urls = ["http://example.com/openssl.zip"],
#       sha256 = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
    #   build_file = "@//:openssl.BUILD",
#   )


# http_archive(
#     name = "grpc-swift-repo",
#     url = "https://github.com/grpc/grpc-swift/archive/refs/tags/1.6.0-async-await.1.tar.gz",
#     strip_prefix = "grpc-swift-1.6.0-async-await.1",
#     build_file_content = """
# XCHammer seems to ignore Git branches:
new_git_repository(
    name = "grpc-swift-repo",
    remote = "https://github.com/grpc/grpc-swift.git",
    commit = "8fcf4f3765a09fdebd6bb4a504ab48cccf617619", #"1.6.0-async-await",
    shallow_since = "1640008839 +0000",
    # commit = "4ca9bcf161fc5555747f3095343b41b00616a559", # 1.7.1 async/await
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
    sdk_dylibs = ["z", "libswift_Concurrency"],
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




# load("swiftniorepo.bzl", "new_http_archive")
# http_archive(
#     name = "swift-nio-repo",
#     url = "https://github.com/apple/swift-nio/archive/refs/tags/2.33.0.tar.gz",
#     strip_prefix = "swift-nio-2.33.0",
#     build_file_content = """

# load("swiftniorepo.bzl", "my_source_lib")
# my_source_lib(
#     name = "swift-nio-repo",
#     build_file_content = """

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
    generates_header = True,
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
  deps = ["@swift-nio-repo//:NIO", "@swift-nio-repo//:NIOFoundationCompat"]
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
    tag = "1.9.0",
    build_file_content = """
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

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

new_git_repository(
    name = "swift-argument-parser-repo",
    remote = "https://github.com/apple/swift-argument-parser.git",
    tag = "1.0.0",
    build_file_content = """
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
   name = "SwiftProtobuf",
   module_name = "SwiftProtobuf",
   srcs = glob(["Sources/SwiftProtobuf/**/*.swift"]),
   visibility = ["//visibility:public"],
   # deps = ["NIOCore"],
)
""",
)


















# module "CNIOAtomics" {
#     export *

#     header "external/swift-nio-repo/Sources/CNIOAtomics/include/CNIOAtomics.h"
# }
