# Build site with client-side JS bundle
build.bundle:
	@echo "==> Building static site with client-side JS"
	@make clean && x0 build/src/Index.js -d dist --cssLibrary='styled-components'
.PHONY: build.bundle

# Build html-only static-site.
build.static:
	@echo "==> Building html-only static site"
	@make clean && x0 build src/Index.js -d dist --static
.PHONY: build.static

# Update and install deps.
deps:
	@echo "==> Installing and updating dependencies"
	@yarn upgrade
.PHONY: install.deps

# Clean.
clean:
	@rm -rf dist
.PHONY: clean

# Lint
lint:
	@standard src/*.js* --fix
.PHONY: lint
