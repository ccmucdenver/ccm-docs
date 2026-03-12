.PHONY: help build-web build-file serve sync local mac clean

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@echo "  help       Show this help"
	@echo "  build-web  Build MkDocs site with directory URLs (RTD style)"
	@echo "  build-file Build MkDocs site for local file:// browsing"
	@echo "  serve      Run local MkDocs dev server"
	@echo "  clean      Remove generated site output"
	@echo "  mac        Build file-site and open site/index.html (macOS)"
	@echo "  local      Alias for mac"
	@echo "  sync       Commit all changes with message 'update' and push"

build-web:
	conda run -n mkdocs mkdocs build --clean --use-directory-urls

build-file:
	conda run -n mkdocs mkdocs build --clean --no-directory-urls

serve:
	conda run -n mkdocs mkdocs serve

sync:
	-git commit -a -m update
	git push

local: mac

mac: build-file
	open site/index.html

clean:
	rm -rf site/*
