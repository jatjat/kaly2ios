load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")




# WORKSPACE
# Recommended approach - the CI auto releases when you push a tag matching `v*`
# The release prefix is the _tested_ bazel version, and XCHammer is often
# forwards and backwards compatible
http_archive(
    name = "xchammer",
    sha256 = "dbb998f08a2efaade0a6e76363249cc581107d5c4fec63a1b7ef16a40b64c32e",
    urls = [ "https://github.com/pinterest/xchammer/releases/download/v3.4.1.6/xchammer.zip" ],
)

#nope
# git_repository(
#     name = "build_bazel_rules_apple",
#     remote = "https://github.com/bazelbuild/rules_apple.git",
#     tag = "0.19.0",
# )
# http_archive(
#     name = "build_bazel_rules_apple",
#     sha256 = "55f4dc1c9bf21bb87442665f4618cff1f1343537a2bd89252078b987dcd9c382",
#     url = "https://github.com/bazelbuild/rules_apple/releases/download/0.20.0/rules_apple.0.20.0.tar.gz",
# )

# load(
#     "@build_bazel_rules_apple//apple:repositories.bzl",
#     "apple_rules_dependencies",
# )

# apple_rules_dependencies()

# http_archive(
#     name = "build_bazel_rules_swift",
#     sha256 = "cea22c0616d797e494d7844a9b604520c87f53c81de49613a7e679ec5b821620",
#     url = "https://github.com/bazelbuild/rules_swift/releases/download/0.14.0/rules_swift.0.14.0.tar.gz",
# )

# load(
#     "@build_bazel_rules_swift//swift:repositories.bzl",
#     "swift_rules_dependencies",
# )

# a little newer


git_repository(
    name = "build_bazel_rules_apple",
    remote = "https://github.com/bazelbuild/rules_apple.git",
    tag = "0.32.0",
)

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "build_bazel_rules_swift",
    sha256 = "4f167e5dbb49b082c5b7f49ee688630d69fb96f15c84c448faa2e97a5780dbbc",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/0.24.0/rules_swift.0.24.0.tar.gz",
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



# end a little newer






# new gen

git_repository(
    name = "rules_proto_grpc",
    remote = "https://github.com/rules-proto-grpc/rules_proto_grpc.git",
    tag = "4.1.0",
)

# insert standard rules proto grpc

load("@rules_proto_grpc//:repositories.bzl", "rules_proto_grpc_toolchains", "rules_proto_grpc_repos")
rules_proto_grpc_toolchains()
rules_proto_grpc_repos()

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")
rules_proto_dependencies()
rules_proto_toolchains()

# end insert standard rules proto grpc

load("@rules_proto_grpc//swift:repositories.bzl", rules_proto_grpc_swift_repos = "swift_repos")

rules_proto_grpc_swift_repos()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()




# end new gen

# new spm

http_archive(
    name = "cgrindel_rules_spm",
    sha256 = "fab28a41793744f3944ad2606cdd9c0f8e2f4861dd29fb1d61aa4263c7a1400a",
    strip_prefix = "rules_spm-0.6.0",
    urls = ["https://github.com/cgrindel/rules_spm/archive/v0.6.0.tar.gz"],
)

load(
    "@cgrindel_rules_spm//spm:deps.bzl",
    "spm_rules_dependencies",
)

spm_rules_dependencies()

# end new spm






# my adds to match https://github.com/bazelbuild/rules_swift/blob/master/WORKSPACE

# swift_rules_dependencies()

# load(
#     "@build_bazel_rules_swift//swift:extras.bzl",
#     "swift_rules_extra_dependencies",
# )

# swift_rules_extra_dependencies()



# end my adds to match




# swift grpc

# load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# http_archive(
#     name = "rules_proto_grpc",
#     sha256 = "8383116d4c505e93fd58369841814acc3f25bdb906887a2023980d8f49a0b95b",
#     strip_prefix = "rules_proto_grpc-4.1.0",
#     urls = ["https://github.com/rules-proto-grpc/rules_proto_grpc/archive/4.1.0.tar.gz"],
# )

# load("@rules_proto_grpc//:repositories.bzl", "rules_proto_grpc_toolchains", "rules_proto_grpc_repos")
# rules_proto_grpc_toolchains()
# rules_proto_grpc_repos()

# load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")
# rules_proto_dependencies()
# rules_proto_toolchains()

# # the grpc section:

# load("@rules_proto_grpc//swift:repositories.bzl", rules_proto_grpc_swift_repos = "swift_repos")

# rules_proto_grpc_swift_repos()

# load(
#     "@build_bazel_rules_swift//swift:repositories.bzl",
#     "swift_rules_dependencies",
# )

# swift_rules_dependencies()

# # end swift grpc

# # swift_rules_dependencies()

# load(
#     "@build_bazel_apple_support//lib:repositories.bzl",
#     "apple_support_dependencies",
# )

# apple_support_dependencies()

# load(
#     "@com_google_protobuf//:protobuf_deps.bzl",
#     "protobuf_deps",
# )

# protobuf_deps()



# rules spm

http_archive(
    name = "cgrindel_rules_spm",
    sha256 = "fab28a41793744f3944ad2606cdd9c0f8e2f4861dd29fb1d61aa4263c7a1400a",
    strip_prefix = "rules_spm-0.6.0",
    urls = ["https://github.com/cgrindel/rules_spm/archive/v0.6.0.tar.gz"],
)

load(
    "@cgrindel_rules_spm//spm:deps.bzl",
    "spm_rules_dependencies",
)

spm_rules_dependencies()



load("@cgrindel_rules_spm//spm:spm.bzl", "spm_pkg", "spm_repositories")

spm_repositories(
    name = "swift_pkgs",
    dependencies = [
        spm_pkg(
            "https://github.com/apple/swift-log.git",
            from_version = "1.0.0",
            products = ["Logging"],
        ),
    ],
)

# end rules spm