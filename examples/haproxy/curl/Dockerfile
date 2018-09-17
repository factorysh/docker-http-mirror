FROM bearstech/debian:stretch

RUN set -eux \
    &&  apt-get update \
    &&  apt-get -y install --no-install-recommends \
                      curl \
                      ca-certificates \
    &&  apt-get clean \
    &&  rm -rf /var/lib/apt/lists/*

COPY ca.pem /usr/local/share/ca-certificates/vagrant-example.com.crt

RUN update-ca-certificates

CMD ["bash"]
