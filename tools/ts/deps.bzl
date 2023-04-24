load("@aspect_rules_ts//ts:repositories.bzl", "rules_ts_dependencies")

def load_rules_ts_dependencies():
  # Fetches the rules_ts dependencies.
  # If you want to have a different version of some dependency,
  # you should fetch it *before* calling this.
  # Alternatively, you can skip calling this function, so long as you've
  # already fetched all the dependencies.
  rules_ts_dependencies(ts_version_from = "//:package.json")
