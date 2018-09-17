.PHONY:

all: ca.csr ca.pem ca-key.pem server-key.pem server.csr server.pem

ca.csr ca.pem ca-key.pem:
	cfssl gencert -initca ca-csr.json | cfssljson -bare ca -

server-key.pem server.csr server.pem:
	cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=server server.json | cfssljson -bare server

clean:
	rm -f ca.csr ca.pem ca-key.pem server-key.pem server.csr server.pem
