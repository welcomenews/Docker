FROM ubuntu:18.04
RUN apt-get update && apt install nginx -y && rm -rf /var/lib/apt/lists/*
COPY nginx.conf /etc/nginx/
ENTRYPOINT ["nginx", "-g", "daemon off;"]
CMD ["-g", "daemon off;"]
WORKDIR /etc/nginx/
VOLUME /var/lib/nginx

