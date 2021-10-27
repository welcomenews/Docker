ARG SECRET=123456
FROM golang:1.16.5-alpine
ARG SECRET
COPY . .
RUN go env -w GO111MODULE=auto \
    && apk add git \
    && go get github.com/caarlos0/env \
    && go get github.com/lib/pq \
    && go get github.com/prometheus/client_golang/prometheus \
    && go get github.com/prometheus/client_golang/prometheus/promhttp \
    && go build -o ./app

FROM alpine:3.10.3
ARG SECRET
COPY --from=0 /go/app .
RUN echo ${SECRET} > /secret.txt \
    && ls -l \
    && pwd \
    && ls -l ../
CMD ["./app"] 
