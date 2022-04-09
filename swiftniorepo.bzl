def _impl(repo_ctx):
  repo_ctx.download_and_extract(
      url = "https://github.com/apple/swift-nio/archive/refs/tags/2.33.0.tar.gz",
      stripPrefix = "swift-nio-2.33.0",
  )
  repo_ctx.file('BUILD', content = repo_ctx.attr.build_file_content)
  repo_ctx.file('CNIOAtomics.modulemap',
   content = """
module "CNIOAtomics" {
    export *
    header "external/swift-nio-repo/Sources/CNIOAtomics/include/CNIOAtomics.h"
}
"""
)

my_source_lib = repository_rule(
  implementation = _impl,
  local = False,
  attrs={"build_file_content": attr.string(mandatory=True)},
)
