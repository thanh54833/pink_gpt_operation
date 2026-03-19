.PHONY: be fe dev kill setup setup-be setup-fe info p_c kb opencode auth

VENV_DIR := backend/.venv
PYTHON := $(VENV_DIR)/bin/python
PIP := $(VENV_DIR)/bin/pip
UVICORN := $(VENV_DIR)/bin/uvicorn

$(PYTHON):
	cd backend && python3 -m venv .venv

$(VENV_DIR)/.deps-installed: | $(PYTHON)
	$(PIP) install --upgrade pip
	$(PIP) install fastapi uvicorn
	touch $(VENV_DIR)/.deps-installed

ROOT_DIR := $(shell pwd)
VENV_BIN := $(ROOT_DIR)/backend/.venv/bin
UVICORN := $(VENV_BIN)/uvicorn

be: setup-be
	cd $(ROOT_DIR)/backend && PYTHONPATH=. $(UVICORN) app.main:app --reload --host 0.0.0.0 --port 8001

fe: setup-fe
	cd frontend && npm run dev -- --port 3001

dev: setup
	$(MAKE) be & $(MAKE) fe & wait

setup: setup-be setup-fe
	@echo "Done. Run 'make dev' to start both services."

setup-be: $(VENV_DIR)/.deps-installed

setup-fe:
	cd frontend && npm install

info:
	@echo "Project info:"
	@echo "  VENV_DIR: $(VENV_DIR)"
	@if [ -x "$(PYTHON)" ]; then \
		echo "  Python path: $$(realpath $(PYTHON))"; \
		echo "  Python version: $$($(PYTHON) --version)"; \
	else \
		echo "  Python path: (venv not found, run: make setup-be)"; \
	fi
	@if command -v npm >/dev/null 2>&1; then \
		echo "  npm path: $$(command -v npm)"; \
		echo "  npm version: $$(npm --version)"; \
	else \
		echo "  npm path: (not found)"; \
	fi

kill:
	- lsof -ti:8001 | xargs kill 2>/dev/null || true
	- lsof -ti:3001 | xargs kill 2>/dev/null || true
	@for port in 8001 3001; do \
		for _ in 1 2 3 4 5; do \
			if ! lsof -ti:$$port >/dev/null 2>&1; then \
				break; \
			fi; \
			sleep 1; \
		done; \
	done

p_c:
	git add . && git commit -m "Update Document" || true
	git pull --rebase 2>/dev/null || true
	git push -u origin main

kb:
	npx vibe-kanban

opencode:
	@npx -y opencode-ai web &

auth:
	npx -y opencode-ai auth login
