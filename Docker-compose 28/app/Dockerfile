FROM golang:1.16.5-alpine as build
COPY main.go .
RUN go env -w GO111MODULE=auto \
    && apk add git \
    && go get github.com/caarlos0/env \
    && go get github.com/lib/pq \
    && go get github.com/prometheus/client_golang/prometheus \
    && go get github.com/prometheus/client_golang/prometheus/promhttp \
    && go build -o ./app \
    && apk del git

CMD ["./app"]
