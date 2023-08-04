# Variables
DOCKER_COMPOSE_FILE := docker-compose.yml
CONTAINER_FRONT := react_docker_frontend

# Commandes

.PHONY: start # This allows to use the command "make start" to build and start the containers
start:
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d

.PHONY: stop
stop:
	docker stop $(CONTAINER_FRONT)

.PHONY: restart # This allows to use the command "make restart" to restart the containers
restart: stop start

.PHONY: exec-logs # This allows to use the command "make exec-logs" to see the logs of the containers continuously
exec-logs:
	docker compose -f $(DOCKER_COMPOSE_FILE) logs -f

.PHONY: logs # This allows to use the command "make logs" to see the logs of the container once
logs:
	docker logs $(CONTAINER_FRONT)
	
.PHONY: clean # This allows to use the command "make clean" to stop the containers and remove the volumes
clean:
	docker compose -f $(DOCKER_COMPOSE_FILE) down -v

.PHONY: bash # This allows to use the command "make bash" to connect to the container trough bash
exec-bash:
	docker exec -it $(CONTAINER_FRONT) bash
