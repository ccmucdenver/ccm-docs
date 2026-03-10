build-web:
	mkdocs build --clean --use-directory-urls

build-file:
	mkdocs build --clean --no-directory-urls

serve:
	mkdocs serve

sync:
	-git commit -a -m update
	git push
