FROM python:3.8-alpine

MAINTAINER Sergey Ignatov <welcome-news@mail.ru>

EXPOSE 8888

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk add --update
RUN pip install --no-cache-dir tornado

COPY hello-tornado.py .

ENTRYPOINT ["python3", "hello-tornado.py"]
