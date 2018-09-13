FROM python:3-alpine

RUN pip install flask gunicorn

COPY mirror.py /mirror.py

EXPOSE 5000
USER nobody

CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:5000", "mirror:app"]