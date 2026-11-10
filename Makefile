MKDOCS ?= .venv/bin/mkdocs

.PHONY: venv serve build deploy deploy-dry

venv:            ## create .venv with the pinned MkDocs requirements
	python3 -m venv .venv
	.venv/bin/pip install -r requirements.txt

serve:           ## live preview on http://127.0.0.1:8000
	$(MKDOCS) serve

build:           ## build site/, warnings are errors
	$(MKDOCS) build --strict

deploy: build    ## build, then SFTP upload to Hetzner (deploy/deploy.sh)
	deploy/deploy.sh

deploy-dry: build ## same build, prints the SFTP batch, does not connect
	deploy/deploy.sh --dry-run
