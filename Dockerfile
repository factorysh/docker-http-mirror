FROM python:3-alpine

RUN pip install flask gunicorn

COPY mirror.py /mirror.py

EXPOSE 5000
USER nobody

ARG GIT_VERSION
LABEL com.bearstech.source.http-mirror=https://github.com/factorysh/docker-http-mirror/commit/${GIT_VERSION}

ARG GIT_DATE
LABEL com.bearstech.date.http-mirror=${GIT_DATE}

CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:5000", "mirror:app"]
