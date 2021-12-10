## DKR 34: Swarm. Знакомство с Docker Swarm-режимом

```
1. Инициализируйте Swarm кластер.
2. Выведите список нод.
3. Запустите одиночный сервис из образа nginx:stable с привязкой к порту 18989.
4. Выведите список сервисов.
5. Выведите список контейнеров.
6. Запустите стек из файла docker-compose-unmounted.yml
   version: "3"
   services:
     nginx:
       image: nginx:stable
       ports:
         - 127.0.0.1:18888:80 
7. Выведите список стеков.
8. Выведите список сервисов.
9. Выведите список контейнеров.


docker swarm init --advertise-addr 207.154.207.213
docker service create -p 18989:80 nginx:stable
docker service ls
docker service ps clever_cori
docker stack deploy -c docker-compose-unmounted.yml nginx
docker service ls
docker stack ps nginx
docker ps
```
