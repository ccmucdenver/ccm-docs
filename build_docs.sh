#!/bin/bash
# run with bash -i for proper conda behavior
date
cd $(dirname "$0")
conda activate mkdocs
git pull
mkdocs build
