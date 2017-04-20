server:
	docker-compose up -d

build-httpie:
	docker build -t httpie ../../httpie

httpie:
	docker run -it --rm --network haproxy_public httpie
