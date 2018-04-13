.DEFAULT_GOAL := help

build: ## build services with docker-compose
	@docker-compose build

clean: ## takedown services and remove unused images
	@docker-compose down --remove-orphans
	@docker images | awk '/<none>/{ print $$3 }' | xargs docker rmi

console-bash: services ## attach to bash on an extra client container
	@docker-compose run --rm client bash

console-pry: services ## attach to pry on the client container
	@docker-compose run --rm client

services: ## start services with docker-compose
	@docker-compose up -d

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'