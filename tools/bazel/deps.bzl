load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def fetch_dependencies():
  # SkyLib Rules
  RULES_SKYLIB_VERSION = "1.4.1"
  RULES_SKYLIB_HASH = "b8a1527901774180afc798aeb28c4634bdccf19c4d98e7bdd1ce79d1fe9aaad7"
  http_archive(
      name = "bazel_skylib",
      sha256 = RULES_SKYLIB_HASH,
      urls = [
          "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/{v}/bazel-skylib-{v}.tar.gz".format(v = RULES_SKYLIB_VERSION),
          "https://github.com/bazelbuild/bazel-skylib/releases/download/{v}/bazel-skylib-{v}.tar.gz".format(v = RULES_SKYLIB_VERSION)
      ],
  )
  # Typescript Rules
  ASPECT_RULES_TS_VERSION = "1.3.3"
  ASPECT_RULES_TS_HASH = "8eb25d1fdafc0836f5778d33fb8eaac37c64176481d67872b54b0a05de5be5c0"
  http_archive(
      name = "aspect_rules_ts",
      sha256 = ASPECT_RULES_TS_HASH,
      strip_prefix = "rules_ts-%s" % ASPECT_RULES_TS_VERSION,
      url = "https://github.com/aspect-build/rules_ts/releases/download/v{v}/rules_ts-v{v}.tar.gz".format(v = ASPECT_RULES_TS_VERSION),
  )
  # JavaScript Rules
  ASPECT_RULES_JS_VERSION = "1.25.0"
  ASPECT_RULES_JS_HASH = "4722264788b92aeca47bf108c5909d94720114d73739e3cff9f48a10b18ef8cd"
  http_archive(
      name = "aspect_rules_js",
      sha256 = ASPECT_RULES_JS_HASH,
      strip_prefix = "rules_js-%s" % ASPECT_RULES_JS_VERSION,
      url = "https://github.com/aspect-build/rules_js/releases/download/v{v}/rules_js-v{v}.tar.gz".format(v = ASPECT_RULES_JS_VERSION),
  )
  # NodeJS Rules
  RULES_NODEJS_VERSION = "5.8.1"
  RULES_NODEJS_HASH = "764a3b3757bb8c3c6a02ba3344731a3d71e558220adcb0cf7e43c9bba2c37ba8"
  http_archive(
      name = "rules_nodejs",
      sha256 = RULES_NODEJS_HASH,
      urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/{v}/rules_nodejs-{v}.tar.gz".format(v = RULES_NODEJS_VERSION)],
  )
  # Jest Rules
  ASPECT_RULES_JEST_VERSION = "0.18.1"
  ASPECT_RULES_JEST_HASH = "52dc08fd252add240124ef7ccc46df3a505121758dfb96578a3d5f2ebb4c2b40"
  http_archive(
        name = "aspect_rules_jest",
        sha256 = ASPECT_RULES_JEST_HASH,
        strip_prefix = "rules_jest-%s" % ASPECT_RULES_JEST_VERSION,
        url = "https://github.com/aspect-build/rules_jest/releases/download/v{v}/rules_jest-v{v}.tar.gz".format(v = ASPECT_RULES_JEST_VERSION),
    )
