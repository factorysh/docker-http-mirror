
all: pull build

pull:
	docker pull python:3-alpine

build:
	docker build -t bearstech/http-mirror:latest .

push:
	docker push bearstech/http-mirror:latest

tests:
	@echo "no tests"

run:
	docker run --rm -p 5000 mirror
