load("@aspect_rules_js//npm:npm_import.bzl", "npm_translate_lock")

def load_rules_npm_dependencies():
  npm_translate_lock(
      name = "npm",
      npmrc = "//:.npmrc",
      pnpm_lock = "//:pnpm-lock.yaml",
      verify_node_modules_ignored = "//:.bazelignore",
  )
