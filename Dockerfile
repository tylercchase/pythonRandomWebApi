FROM python:3.8-slim

RUN apt update -y && apt install gcc
RUN pip3 install flask uwsgi
COPY . /src
CMD ["uwsgi", "--ini", "/src/uwsgi.ini"]
