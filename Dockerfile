FROM python:3.8-slim


RUN apt-get update && apt-get install -y gcc libc6-dev libffi-dev libgl1-mesa-glx libglib2.0-0 ghostscript

WORKDIR /app
COPY . .

RUN pip install .
RUN pip install "backports.zoneinfo"

EXPOSE 5000

RUN excalibur initdb
CMD ["excalibur", "webserver"]
