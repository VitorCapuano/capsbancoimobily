export SIMPLE_SETTINGS=monopoly.settings.development

export PYTHONPATH=$(shell pwd)/monopoly/
export PYTHONDONTWRITEBYTECODE=1
export DJANGO_SETTINGS_MODULE=$(settings)

.PHONY: help

help:  ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

clean:
	@find . -name "*.pyc" | xargs rm -rf
	@find . -name "*.pyo" | xargs rm -rf
	@find . -name "*.log" | xargs rm -rf
	@find . -name "__pycache__" -type d | xargs rm -rf
	@find . -name ".pytest_cache" -type d | xargs rm -rf
	@rm -f .coverage
	@rm -rf htmlcov/
	@rm -f coverage.xml
	@rm -f *.log

run:
	uvicorn factory:app

install:
	pip install -r requirements.txt

flake8:
	@flake8 --show-source ./monopoly

check-python-import:
	isort ./monopoly --check-only --multi-line=3 --trailing-comma --force-grid-wrap=0 --use-parentheses --line-width=88 -l 79

fix-python-import:
	isort ./monopoly --multi-line=3 --trailing-comma --force-grid-wrap=0 --use-parentheses --line-width=88 -l 79

black:
	black ./monopoly --line-length 79 -t py37 --skip-string-normalization

black-check:
	black ./monopoly --line-length 79 -t py37 --skip-string-normalization --check

lint: clean fix-python-import black flake8

check-lint: check-python-import black-check flake8
