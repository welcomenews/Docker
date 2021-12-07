## DKR 32: Server. Insecure Registry

1. Запустите контейнер с Docker Registry.
2. Скачайте образ nginx:stable, переименуйте образ для локального registry (ввиду того, что localhost захардкожен в Docker как разрешенный, адрес registry необходимо указать в виде ip адреса отличного от 127.0.0.1).
3. Выведите список образов на вашем хосте.
4. Попробуйте загрузить образ в registry.
5. Разрешите Docker использовать небезопасные registry с помощью файла /etc/docker/daemon.json.
6. Попробуйте еще раз загрузить образ в registry.
7. Удалите ваш новый образ с хоста.
8. Выведите список образов на вашем хосте.
9. Скачайте ваш образ из registry.
10. Выведите список образов на вашем хосте.

```
docker pull nginx:stable

### Instalation docker regestry
docker run -d -p 5000:5000 --restart always --name registry registry:2

### Create file daemon.json into /etc/docker/
{
  "insecure-registries" : ["46.101.182.75:5000"]
}

docker tag nginx:stable 46.101.182.75:5000/nginx:v1
docker push 46.101.182.75:5000/nginx:v1
docker rmi -f 46.101.182.75:5000/nginx:v1
docker pull 46.101.182.75:5000/nginx:v1
```

https://hub.docker.com/_/registry?tab=description
