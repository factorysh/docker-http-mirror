
include Makefile.lint
include Makefile.build_args

all: pull build

pull:
	docker pull python:3-slim

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
	# FIXME, it's a very cheap test
	docker run --rm bearstech/http-mirror:latest gunicorn --version

down:
	# no compose for now
	echo docker-compose down

cfssl:
	 docker build \
		$(DOCKER_BUILD_ARGS) \
		-t cfssl https://github.com/cloudflare/cfssl/raw/master/Dockerfile

run:
	docker run --rm -p 5000 bearstech/http-mirror:latest
