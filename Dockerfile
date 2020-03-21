FROM python:3.8-slim

RUN apt update -y && apt install -y gcc
RUN pip3 install flask
COPY randomAPI.py /
COPY static /static
COPY templates /templates
CMD ["python3", "randomAPI.py", "--host", "0.0.0.0", "--port", "80"]
