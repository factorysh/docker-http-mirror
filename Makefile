GIT_VERSION := $(shell git rev-parse HEAD)

all: pull build

pull:
	docker pull python:3-alpine

build:
	docker build \
		--build-arg GIT_VERSION=${GIT_VERSION} \
		-t bearstech/http-mirror:latest \
		.

push:
	docker push bearstech/http-mirror:latest

remove_image:
	docker rmi bearstech/http-mirror:latest

tests:
	@echo "no tests"

down:

run:
	docker run --rm -p 5000 bearstech/http-mirror:latest
