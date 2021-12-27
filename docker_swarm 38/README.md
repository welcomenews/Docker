## DKR 38: Swarm. Labels

1. В репозитории dkr-30-voting из предыдущих заданий создайте новую ветку с именем dkr-38-labels.
2. Измените docker-compose.yml файл, убрав routing mesh.
3. Создайте в репозитории второй файл /home/user/dkr-30-voting/traefik-compose.yml, в котором опишите стек для запуска Traefik.
4. Запустите стек traefik (Traefik должен принимать запросы по 80 и 443 порту и перенаправлять их на сервисы внутри swarm).
5. Добавьте в /home/user/dkr-30-voting/docker-compose.yml лейблы для приема трафика через traefik на домене из nip.io (Чтобы автопроверки корректно отработали, будем использовать адреса вида voting.x.x.x.x.nip.io , kibana.x.x.x.x.nip.io. Cервис nip.io будет резолвить их в ip-адрес x.x.x.x).
6. Запустите новый стек из /home/user/dkr-30-voting/docker-compose.yml.
7. Выведите список стеков.
8. Выведите список сервисов.
9. Выведите список контейнеров на каждой ноде.
10. При помощи команды curl с опцией -i обратитесь к каждой ноде по внешнему адресу и 80 порту по пути /ping (Для сервиса nginx должны быть 3 label, вида voting.x.x.x.x.nip.io, voting.y.y.y.y.nip.io, voting.z.z.z.z.nip.io, чтобы каждая из нод могла ответить на запрос).

```
docker network create -d overlay traefik-public
### Create file daemon.json into /etc/docker/
{
  "insecure-registries" : ["registry.rebrainme.com"]
}
docker restart
docker login registry.rebrainme.com
git clone https://gitlab.rebrainme.com/docker_users_repos/1332/dkr-30-voting.git
git checkout dkr-38-labels
docker swarm init --advertise-addr 161.35.201.31  на ноде1(главная)
добавляем други ноды
env $(cat .env | grep ^[A-Z] | xargs) docker stack deploy --with-registry-auth -c traefik-compose.yml traf-38  (на главной ноде)
или
docker-compose config -f traefik-compose.yml | docker stack deploy --with-registry-auth traf-38

env $(cat .env | grep ^[A-Z] | xargs) docker stack deploy --with-registry-auth -c docker-compose.yml dkr-38
или
docker-compose config -f docker-compose.yml | docker stack deploy --with-registry-auth dkr-38

curl -i voting.161.35.201.31:80/ping
```

