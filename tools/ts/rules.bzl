load(
  "@aspect_rules_ts//ts:defs.bzl",
  native_ts_config = "ts_config",
  native_ts_project = "ts_project"
)

def ts_project(
        name,
        srcs = [],
        deps = [],
        tsconfig = "//tools/ts/config:node",
        **kwargs,
):
  native_ts_project(
      name = name,
      srcs = srcs,
      deps = deps + [
        "//:node_modules/@types/node",
        "//:node_modules/reflect-metadata",
        "//:node_modules/typescript-transform-paths",
        "//:node_modules/tslib",
      ],
      declaration = True,
      declaration_map = True,
      source_map = True,
      incremental = True,
      composite = True,
      supports_workers = False, # This is a workaround for fixing "Error: Debug Failure. False expression: Paths must either both be absolute or both be relative"
      tsconfig = tsconfig,
      **kwargs,
  )

def ts_config(
        name,
        src,
        deps = [],
        **kwargs
):
  native_ts_config(
      name = name,
      src = src,
      deps = deps,
      **kwargs,
  )
