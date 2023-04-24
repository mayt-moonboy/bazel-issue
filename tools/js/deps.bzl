load("@rules_nodejs//nodejs:repositories.bzl","DEFAULT_NODE_VERSION","nodejs_register_toolchains")

def load_rules_js_dependencies():
  nodejs_register_toolchains(
      name = "nodejs",
      node_version = DEFAULT_NODE_VERSION,
  )
