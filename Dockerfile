FROM python:3.8-slim

RUN apt update -y && apt install -y gcc
RUN pip3 install flask
COPY uwsgi.ini / 
COPY randomAPI.py /
COPY static /static
COPY templates /templates
CMD ["uwsgi", "--ini", "/uwsgi.ini"]
