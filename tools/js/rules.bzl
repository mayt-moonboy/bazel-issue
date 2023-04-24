load(
  "@aspect_rules_js//js:defs.bzl",
  native_js_library = "js_library",
)

def js_library(
    name,
    srcs = [],
    **kwargs,
):
    native_js_library(
      name = name,
      srcs = srcs,
      **kwargs,
    )
