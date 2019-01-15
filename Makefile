.DEFAULT_GOAL := help

docker.bin := docker
docker.org := unbounce
docker.image := sonarcloud-github

.PHONY: help
help: ## Display this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: deps ## Build a new docker image locally
	$(docker.bin) build --pull --force-rm --no-cache -t $(docker.image) .

.PHONY: tag
tag: deps ## Tag the docker image with a given value
ifndef VERSION
	@echo "Providea VERSION parameter to continue."; exit 1
endif
	$(docker.bin) tag $(docker.image) $(docker.org)/$(docker.image):$(VERSION)
	$(docker.bin) tag $(docker.image) $(docker.org)/$(docker.image):latest

.PHONY: release
release: deps ## Upload the docker image to DockerHub
ifndef VERSION
	@echo "Providea VERSION parameter to continue."; exit 1
endif
	$(docker.bin) push $(docker.org)/$(docker.image):$(VERSION)
	$(docker.bin) push $(docker.org)/$(docker.image):latest

.PHONY: deps
deps:
	type $(docker.bin) > /dev/null 2>&1 || (echo "Install docker to continue."; exit 1)

