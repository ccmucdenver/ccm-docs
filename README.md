# CCM Docs

This repository contains documentation for the Center for Computational Mathematics (CCM), built with MkDocs.

## Build the site (Conda)

```bash
conda env create -f mkdocs-env.yml
conda activate mkdocs
mkdocs build
```

Generated output is written to `site/`.

## Run a local preview server

```bash
conda activate mkdocs
mkdocs serve
```

Then open in a browser: <http://127.0.0.1:8000>

## View the built site in a browser

After `mkdocs build`, open `site/index.html` in your browser.

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
mkdocs build
```

On Windows PowerShell, activate with:

```powershell
.venv\Scripts\Activate.ps1
```
