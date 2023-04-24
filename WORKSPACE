load("//tools/bazel:deps.bzl", "fetch_dependencies")
fetch_dependencies()

load("//tools/js:deps.bzl", "load_rules_js_dependencies")
load_rules_js_dependencies()

load("//tools/ts:deps.bzl", "load_rules_ts_dependencies")
load_rules_ts_dependencies()

load("//tools/npm:deps.bzl", "load_rules_npm_dependencies")
load_rules_npm_dependencies()

load("@npm//:repositories.bzl", "npm_repositories")
npm_repositories()

load("//tools/jest:deps.bzl", "load_rules_jest_dependencies")
load_rules_jest_dependencies()
