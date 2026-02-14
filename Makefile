IGNITE ?= ignite
PORT ?= 8000

.PHONY: build run stop-run

build:
	$(IGNITE) build

stop-run:
	@pids="$$(lsof -tiTCP:$(PORT) -sTCP:LISTEN 2>/dev/null || true)"; \
	if [ -n "$$pids" ]; then \
		echo "Stopping process(es) on port $(PORT): $$pids"; \
		kill $$pids; \
		sleep 1; \
		remaining="$$(lsof -tiTCP:$(PORT) -sTCP:LISTEN 2>/dev/null || true)"; \
		if [ -n "$$remaining" ]; then \
			echo "Force-stopping remaining process(es): $$remaining"; \
			kill -9 $$remaining; \
		fi; \
	fi

run: stop-run build
	@echo "Starting preview server on http://localhost:$(PORT)"
	$(IGNITE) run --port $(PORT) --preview
