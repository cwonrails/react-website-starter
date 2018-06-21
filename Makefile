# Set variables for local binaries.
x0=node_modules/.bin/x0
standard=node_modules/.bin/standard
node-prune=$HOME/go/bin/node-prune

all: clean deps prune dev
.PHONY: all

# Start development server.
dev:
	$(x0) src/index.js -op 8888
.PHONY: dev

# Remove dist folder.
clean:
	rm -rf dist
.PHONY: clean

# Update dependencies.
# deps: go get -u github.com/tj/node-prune/cmd/node-prune; yarn upgrade --latest
deps:
	yarn upgrade --latest
.PHONY: deps

# Lint with Standard.
lint:
	$(standard) src/*.js* --fix
.PHONY: lint

# Reduce package.json size with node-prune.
prune:
	node-prune
.PHONY: prune

# Build static site with client-side JS bundle.
bundle:
	$(x0) build src/index.js -d dist --cssLibrary='emotion'
.PHONY: bundle

# Build html-only static site.
static:
	$(x0) build src/index.js -d dist --static
.PHONY: static

