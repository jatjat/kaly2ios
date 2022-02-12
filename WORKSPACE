load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")


http_archive(
    name = "xchammer",
    sha256 = "dbb998f08a2efaade0a6e76363249cc581107d5c4fec63a1b7ef16a40b64c32e",
    urls = [ "https://github.com/pinterest/xchammer/releases/download/v3.4.1.6/xchammer.zip" ],
)


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
            # from_version = "1.0.0",
            products = ["GRPC", "protoc-gen-grpc-swift"],
            revision = "8fcf4f3765a09fdebd6bb4a504ab48cccf617619",
        ),
    ],
)