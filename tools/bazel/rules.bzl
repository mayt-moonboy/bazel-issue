load(
  "//tools/ts:rules.bzl",
  _ts_config = "ts_config",
  _ts_project = "ts_project",
)

load(
  "//tools/jest:rules.bzl",
  _jest_test = "jest_test",
)

load(
  "//tools/js:rules.bzl",
  _js_library = "js_library",
)

ts_config = _ts_config
ts_project = _ts_project

jest_test = _jest_test

js_library = _js_library
