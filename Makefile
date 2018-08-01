build:
	docker build -t mirror .

run:
	docker run --rm -p 5000 mirror
