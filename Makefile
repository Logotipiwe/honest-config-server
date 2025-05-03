# Makefile

DC=docker-compose
COMPOSE_FILES=-f docker-compose.yml -f docker-compose-local.yml
CHECK_ENV = \
	if [ -z "$$ENV_FILE" ]; then \
		echo "❌ ENV_FILE variable is not set"; \
		exit 1; \
	fi

.PHONY: up-local down-local build-local restart-local logs-local

up-local:
	@$(CHECK_ENV) && $(DC) $(COMPOSE_FILES) --env-file ${ENV_FILE} up -d --build

down-local:
	$(DC) $(COMPOSE_FILES) down

build-local:
	$(DC) $(COMPOSE_FILES) build

restart-local:
	@$(CHECK_ENV) && $(DC) $(COMPOSE_FILES) down
	$(DC) $(COMPOSE_FILES) --build ${ENV_FILE} up -d

logs-local:
	$(DC) $(COMPOSE_FILES) logs -f
