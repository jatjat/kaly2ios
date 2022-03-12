load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "domain-api",
    module_name = "DomainAPI",
    srcs = glob(["Sources/DomainAPI/**/*.swift"]),
    visibility = ["//visibility:public"],
    deps = ["//Kaly2iOS/Common:common-api"],
)

swift_library(
    name = "domain",
    module_name = "Domain",
    srcs = glob(["Sources/Domain/**/*.swift"]),
    visibility = ["//visibility:public"],
    deps = ["//Kaly2iOS/Domain:domain-api",
            "//Kaly2iOS/Data:data-api",
            "//Kaly2iOS/Common:common",
                        "@cleanse-repo//:Cleanse"
            # "@swift_di_pkgs//Cleanse:Cleanse"
            ],
)
