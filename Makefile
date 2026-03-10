.PHONY: help build-web build-file serve sync

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

help:
	# Usage: make help build-web build-file serve sync

