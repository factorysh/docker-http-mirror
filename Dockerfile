FROM python:3-slim

RUN python3 -m venv /opt/mirror \
        && /opt/mirror/bin/pip install -U pip wheel \
        && /opt/mirror/bin/pip install flask gunicorn

COPY mirror.py /mirror.py

EXPOSE 5000
USER nobody

ENV PATH=/opt/mirror/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:5000", "mirror:app"]

# generated labels

ARG GIT_VERSION
ARG GIT_DATE
ARG BUILD_DATE

LABEL \
    com.bearstech.image.revision_date=${GIT_DATE} \
    org.opencontainers.image.authors=Bearstech \
    org.opencontainers.image.revision=${GIT_VERSION} \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.url=https://github.com/factorysh/docker-http-mirror \
    org.opencontainers.image.source=https://github.com/factorysh/docker-http-mirror/blob/${GIT_VERSION}/Dockerfile
