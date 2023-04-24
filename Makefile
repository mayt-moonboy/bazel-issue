WORKSPACE:=$(PWD)
BAZEL:=bazel


# Run Example test
.PHONY: example-test
example-coverage:
	@$(BAZEL) coverage \
		--combined_report=lcov //packages/example:example_test

# Generate LCOV HTML Coverage Report
.PHONY: coverage-html
coverage-html: example-test
	@genhtml bazel-out/_coverage/_coverage_report.dat \
		--output-directory bazel-out/_coverage/temp

# Update pnpm lockfile and fetch packages
.PHONY: bootstrap
bootstrap: pnpm-install-lockfile fetch-npm-deps

# Fetch all the NPM dependencies
.PHONY: fetch-npm-deps
fetch-npm-deps:
	@$(BAZEL) fetch @npm//...

# Install the pnpm lockfile for dependencies
.PHONY: build
pnpm-install-lockfile:
	@npx pnpm install --lockfile