FROM debian

RUN apt-get update && \
        apt-get -y install curl ca-certificates && \
        rm -rf /var/lib/apt/lists/*

COPY ca.pem /usr/local/share/ca-certificates/vagrant-example.com.crt
RUN update-ca-certificates

CMD ["bash"]
