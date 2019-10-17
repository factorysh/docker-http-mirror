
include Makefile.lint
include Makefile.build_args

all: pull build

pull:
	docker pull python:3-alpine

build:
	 docker build \
		$(DOCKER_BUILD_ARGS) \
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
