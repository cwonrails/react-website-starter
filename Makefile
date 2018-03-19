# Build site with client-side JS bundle
build.bundle:
	@echo "==> Building bundle"
	@make clean && x0 build/src/Index.js -d dist --cssLibrary='styled-components'
.PHONY: build.bundle

# Build static site.
build.static:
.PHONY: build.static

# Update and install deps
install.deps:
	@echo "==> Installing dev dependencies"
.PHONY: install.deps

# Run all tests.
test: internal/proxy/bin/bin_assets.go
	@$(GO) test -timeout 2m ./... && echo "\n==>\033[32m Ok\033[m\n"
.PHONY: test

# Clean.
clean:
	@rm -rf dist
.PHONY: clean

# Lint
