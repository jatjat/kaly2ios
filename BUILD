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

load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

# xcode_project(
#     name = "kaly2",
#     targets = [ "//ios-app:ios-app" ],
#     paths = [ "**" ],
# )

# xcode_project(
#     name = "kaly2",
#     # testonly = True,
#     # bazel = "tools/bazelwrapper",
#     project_config = project_config(
#         # build_bazel_platform_options = {
#             # "ios_x86_64": ["--config=ios_x86_64"],
#             # "ios_i386": ["--config=ios_i386"],
#             # "ios_arm64": ["--config=ios_arm64"],
#             # "ios_armv7": ["--config=ios_armv7"],
#         # },
#         # generate_transitive_xcode_targets = True,
#         # generate_xcode_schemes = False,
#         paths = ["Kaly2iOS/**"],
#     ),
#     # target_config = {
#     #     "//ios-app:ios-app": target_config(
#     #         scheme_config = app_scheme_config,
#     #     ),
#     # },
#     targets = [
#         "//Kaly2iOS/Shared:ios-app",
#         # "//ios-app:UrlGetClasses",
#         # "//ios-app:UnitTests",
#         # "//ios-app:UnitTestsWithHost",
#     ],
# )

ios_application(
    name = "ios-app",
    bundle_id = "ca.joelathiessen.kaly2",
    families = ["iphone"],
    infoplists = ["Info.plist"],
    minimum_os_version = "15.0",
    visibility = ["//visibility:public"],
    # deps = ["ios-app-main"],
    deps = ["//Kaly2iOS/Shared/UI:ui"],
)

swift_library(
    name = "ios-app-main",
    srcs = [
        "**",
    ],
    # copts = [
    #     "-swift-version 4.2",
    # ],
    # TODO: Add the ability to customize a module name.
    # This works, but not in Xcode!
    # module_name = "ios-app-main",
    visibility = ["//visibility:public"],

    
)


xcode_project(
    name = "Kaly2Bazel",
    bazel = "tools/bazelwrapper",
    project_config = project_config(
        build_bazel_platform_options = {
            "ios_x86_64": ["--config=ios_x86_64"],
            "ios_i386": ["--config=ios_i386"],
            "ios_arm64": ["--config=ios_arm64"],
            "ios_armv7": ["--config=ios_armv7"],
        },
        generate_transitive_xcode_targets = True,
        generate_xcode_schemes = True,
        paths = ["**"],
    ),
    targets = [
        "//:ios-app",
    ],
)