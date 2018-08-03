.PHONY: server curl

server: crt/server.crt+key
	docker-compose up -d

crt:
	mkdir crt

crt/server.crt+key: crt
	cat pki/server.pem pki/server-key.pem > crt/server.crt+key

build-curl-image:
	cp pki/ca.pem curl/
	docker build -t curl curl

curl:
	docker run -it --rm --network haproxy_public curl

logs:
	docker-compose logs -f
