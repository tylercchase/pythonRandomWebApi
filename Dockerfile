FROM python:3.8-slim

RUN apt update -y && apt install -y gcc
RUN pip3 install flask uwsgi
COPY uwsgi.ini /
COPY randomAPI.py /
CMD ["uwsgi", "--ini", "/src/uwsgi.ini"]
