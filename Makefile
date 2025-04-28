# Variáveis
PACKAGE_NAME=calculator-lib
VERSION=0.1.0

# Instalar dependências gerais (FastAPI, Uvicorn, etc.)
install:
	python -m pip install -r requirements.txt

# Instalar dependências de desenvolvimento (build, wheel, twine, pytest, etc.)
install-dev:
	python -m pip install -r requirements.txt
	python -m pip install wheel build twine pytest

# Instalar a lib calculator-lib do PyPI
install-lib:
	python -m pip install $(PACKAGE_NAME)

# Rodar testes da aplicação FastAPI
test-app:
	pytest tests/

# Rodar testes da biblioteca calculator-lib
test-lib:
	pytest tests_lib/

# Buildar a lib para publicação (modo tradicional)
build-lib:
	python setup.py sdist bdist_wheel

# Buildar a lib usando ferramenta moderna
build-modern:
	python -m build

# Publicar a lib no PyPI
publish-lib: build-modern
	python -m twine upload dist/*

# Limpar artefatos de build
clean:
	rm -rf build dist *.egg-info

# Mostrar ajuda
help:
	@echo "Comandos disponíveis:"
	@echo "  make install           - Instalar dependências gerais"
	@echo "  make install-dev       - Instalar dependências para build/publicação/testes"
	@echo "  make install-lib        - Instalar a lib calculator-lib do PyPI"
	@echo "  make test-app          - Rodar testes da aplicação FastAPI"
	@echo "  make test-lib          - Rodar testes unitários da lib"
	@echo "  make build-lib         - Buildar lib usando setup.py (modo tradicional)"
	@echo "  make build-modern      - Buildar lib usando python -m build (modo novo)"
	@echo "  make publish-lib       - Buildar e publicar no PyPI"
	@echo "  make clean             - Limpar arquivos de build"
