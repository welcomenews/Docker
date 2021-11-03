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


### Полезные ссылки
https://github.com/docker/awesome-compose  Примеры сборок различных приложений
