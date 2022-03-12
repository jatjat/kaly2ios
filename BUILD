# BUILD.Bazel
#load("@xchammer//:xcodeproject.bzl", "xcode_project")

load(
    "@xchammer//:BazelExtensions/xchammerconfig.bzl",
    "execution_action",
    "project_config",
    "scheme_action_config",
    "target_config",
)
load("@xchammer//:BazelExtensions/xcodeproject.bzl", "xcode_project")

# load("@xchammer//:xcodeproject.bzl", "xcode_project")


load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

# xcode_project(
#     name = "kaly2",
#     targets = [ "//:ios-app" ],
#     project_config = project_config(
#     paths = [ "Kaly2iOS/**" ],
#     )
# )

xcode_project(
    name = "kaly2",
    # testonly = True,
    # bazel = "tools/bazelwrapper",
    # project_config = project_config(
    #     build_bazel_platform_options = {
    #         "ios_x86_64": ["--config=ios_x86_64"],
    #         "ios_i386": ["--config=ios_i386"],
    #         "ios_arm64": ["--config=ios_arm64"],
    #         "ios_armv7": ["--config=ios_armv7"],
    #     },
    #     generate_transitive_xcode_targets = True,
    #     generate_xcode_schemes = False,
    #     paths = ["Kaly2iOS/**"],
    # ),
    # target_config = {
    #     "//ios-app:ios-app": target_config(
    #         scheme_config = app_scheme_config,
    #     ),
    # },
    targets = [
        ":ios-app",
        # "//Kaly2iOS/Shared:ios-app",
        # "//ios-app:UrlGetClasses",
        # "//ios-app:UnitTests",
        # "//ios-app:UnitTestsWithHost",
    ],
)

genrule(
    name = "wat",
    outs = ["kaly2.xcodeproject"],
    cmd = """
    pwd && cd -P . && ls ./bazel-out/host/bin/external/xchammer && unzip -qq ./bazel-out/host/bin/external/xchammer/xchammer.zip && ./xchammer.app/Contents/MacOS/xchammer \
    --plugin= \
    --swift_out=$(GENDIR) \
    --proto_path=. $(SRCS)
    """,
    tools = ["@xchammer//:xchammer"]
)

ios_application(
    name = "ios-app",
    bundle_id = "ca.joelathiessen.kaly2",
    families = ["iphone"],
    infoplists = ["Info.plist"],
    minimum_os_version = "15.0",
    # visibility = ["//swift:__subpackages__"],
    deps = [
            "//Kaly2iOS/MainApp:main-app",        

            ],
)

swift_library(
    name = "ios-app-main",
    srcs = [
        "**",
    ],
    visibility = ["//visibility:public"],
)


# xcode_project(
#     name = "Kaly2Bazel",
#     bazel = "tools/bazelwrapper",
#     project_config = project_config(
#         # build_bazel_platform_options = {
#         #     "ios_x86_64": ["--config=ios_x86_64"],
#         #     "ios_i386": ["--config=ios_i386"],
#         #     "ios_arm64": ["--config=ios_arm64"],
#         #     "ios_armv7": ["--config=ios_armv7"],
#         # },
#         generate_transitive_xcode_targets = True,
#         generate_xcode_schemes = True,
#         paths = ["**"],
#     ),
#     targets = [
#         "//:ios-app",
#     ],
# )

load("@build_bazel_rules_swift//swift:swift.bzl", "swift_binary")
swift_binary(
    name = "simple",
    srcs = ["main.swift"],
    visibility = ["//swift:__subpackages__"],
    deps = [
        "@swift_pkgs//grpc-swift:GRPC",
    ],
)

swift_library(

        name = "simple2",
    srcs = ["main.swift"],
    visibility = ["//swift:__subpackages__"],
    deps = [
        "@swift_pkgs//grpc-swift:GRPC",
    ],
)

# xchammer_dist