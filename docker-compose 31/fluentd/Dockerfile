# FROM fluent/fluentd:v1.12.0-debian-1.0
FROM fluent/fluentd:v1.14-1
USER root
RUN ["gem", "install", "fluent-plugin-elasticsearch", "--no-document", "--version", "1.14.0"]
USER fluent
