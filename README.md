# CCM Docs

This repository contains documentation for the Center for Computational Mathematics (CCM), built with MkDocs.

## Setup (Conda)

```bash
conda env create -f mkdocs-env.yml
conda activate mkdocs
```

## Build the site (web server / Read the Docs style)

```bash
conda activate mkdocs
make build-web
```

This generates directory-style URLs in `site/`.

## Build the site (local `file://` browsing)

```bash
conda activate mkdocs
make build-file
```

This generates file-style URLs for opening `site/index.html` directly.

## Run a local preview server

```bash
conda activate mkdocs
make serve
```

Then open in a browser: <http://127.0.0.1:8000>

## View the built site in a browser

After `make build-file`, open `site/index.html` in your browser.

Examples:

- macOS:
  ```bash
  open site/index.html
  ```
- Linux:
  ```bash
  xdg-open site/index.html
  ```
- Windows PowerShell:
  ```powershell
  start site\index.html
  ```

## Alternative: pip/venv

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r docs/requirements.txt
make build-web
```

On Windows PowerShell, activate with:

```powershell
.venv\Scripts\Activate.ps1
```
