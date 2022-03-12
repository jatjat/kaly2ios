load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")





load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")
PINTEREST_TULSI_COMMIT = "c9b533f4612444e0a5e0fa639d4cb508399d9e08"

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

# This is a hack for XCHammer development, but is how XCHammer is imported
# into a workspace as a binary build
new_git_repository(
    name = "xchammer_tulsi_aspects",
    remote = "https://github.com/pinterest/tulsi.git",
    commit = PINTEREST_TULSI_COMMIT,
    strip_prefix = "src/TulsiGenerator/Bazel",
    build_file_content = "exports_files(['tulsi'])",
)


# new_git_repository(
#     name = "xchammer_tulsi_aspects",
#     remote = "/Users/joel/Development/tulsi",
#     commit = "625067382b8eb3fd69540dfa1d3de860492958b8", # joel fix
#     strip_prefix = "src/TulsiGenerator/Bazel",
#     build_file_content = "exports_files(['tulsi'])",
# )


load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "xchammer",
    remote  = "https://github.com/pinterest/xchammer",
    commit = "c588329904e05072c8d674191318e64d8dabc685"
)
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


git_repository(
    name = "build_bazel_rules_apple",
    remote = "https://github.com/bazelbuild/rules_apple.git",
    tag = "0.33.0",
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

spm_repositories(
    name = "swift_pkgs",
    dependencies = [
        spm_pkg(
            "https://github.com/grpc/grpc-swift.git",
            products = ["GRPC", "protoc-gen-grpc-swift"],
            revision = "8fcf4f3765a09fdebd6bb4a504ab48cccf617619" #"1.6.0-async-await",
        ),
    ],
)

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




http_archive(
    name = "protobuf",
    url = "https://github.com/google/protobuf/releases/download/v3.19.4/protobuf-cpp-3.19.4.zip",
    strip_prefix = "protobuf-3.19.4",
)

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