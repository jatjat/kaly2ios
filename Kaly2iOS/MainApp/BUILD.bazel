load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "main-app",
    srcs = glob(["Sources/**/*.swift"]),
    visibility = ["//visibility:public"],
    deps = ["//Kaly2iOS/Presentation:presentation",
            "//Kaly2iOS/Presentation:presentation-api",
            "//Kaly2iOS/Domain:domain",
            "//Kaly2iOS/Domain:domain-api",
            "//Kaly2iOS/Data:data",
            "//Kaly2iOS/Data:data-api",
            "//Kaly2iOS/Common:common",
            "//Kaly2iOS/Common:common-api",
            "@cleanse-repo//:Cleanse",
            ],
)
