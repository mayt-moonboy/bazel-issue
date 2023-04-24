load(
  "@aspect_rules_jest//jest:defs.bzl",
  native_jest_test = "jest_test",
)

load("//tools/ts:rules.bzl", "ts_project")

def jest_test(
        name,
        config = "//tools/jest:jest_config",
        srcs = [],
        deps = [],
        node_modules = "//:node_modules",
        visibility = None,
        snapshots = [],
        **kwargs,
):
  ts_project(
    name = "%s-test-lib" % name,
    srcs = srcs,
    deps = deps + [
      "//:node_modules/@types/jest",
      "//:node_modules/jest",
      "//:node_modules/ts-jest",
    ],
    tsconfig = "//tools/ts/config:jest",
    visibility = visibility,
  )
  native_jest_test(
      name = name,
      config = config,
      data = srcs + deps + [
        "%s-test-lib" % name,
      ],
      node_modules = node_modules,
      visibility = visibility,
      snapshots = snapshots,
      **kwargs,
  )
#  native_jest_test(
#      name = name,
#      config = config,
#      data = srcs + deps + [
#        "//:node_modules/@types/jest",
#        "//:node_modules/jest",
#        "//:node_modules/ts-jest",
#      ],
#      node_modules = node_modules,
#      visibility = visibility,
#      snapshots = snapshots,
#      **kwargs,
#  )

