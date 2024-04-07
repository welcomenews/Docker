### INSTALLATION DOCKER FOR LINUX

Uninstall old versions
$ sudo apt-get remove docker docker-engine docker.io containerd runc

Supported storage drivers
Docker Engine on Ubuntu supports overlay2, aufs and btrfs storage drivers.

Install using the repository

```
$ sudo apt-get update
$ sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
```
### Даём права.
$ sudo usermod -aG docker $USER

$ newgrp docker

#### Удалить none из имеджей
docker rmi $(docker images -f "dangling=true" -q)


### Полезные ссылки
https://github.com/docker/awesome-compose  Примеры сборок различных приложений

https://github.com/wyveo/nginx-php-fpm/blob/master/Dockerfile   просто пример сборки


### To download and install Docker Compose standalone, run:
```
sudo curl -SL https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```
