FROM python:3

RUN pip install flask

COPY mirror.py /mirror.py

EXPOSE 5000
USER nobody

CMD ["python", "-u", "/mirror.py"]
