## DKR 39: Swarm. Placement 

1. Инициализируйте swarm-кластер на 3х серверах
2. В репозитории dkr-30-voting из предыдущих заданий создайте новую ветку с именем dkr-39-placement.
3. Измените оба docker-compose файла, добавив директиву placement для сервисов traefik и nginx, чтобы они запускались только на Manager нодах.
4. Запустите все стеки.
5. Выведите данные о всех нодах.
6. Выведите список стеков.
7. Выведите список сервисов.
8. Выведите список контейнеров на каждой ноде.

```
### Create file daemon.json into /etc/docker/
{
  "insecure-registries" : ["registry.rebrainme.com"]
}
docker restart
docker login registry.rebrainme.com
git clone https://gitlab.rebrainme.com/docker_users_repos/1332/dkr-30-voting.git
git checkout dkr-39-placement
docker swarm init --advertise-addr 161.35.201.31  на ноде1(главная)
добавляем други ноды
docker network create -d overlay traefik-public
env $(cat .env | grep ^[A-Z] | xargs) docker stack deploy --with-registry-auth -c traefik-compose.yml traf-39  (на главной ноде)
env $(cat .env | grep ^[A-Z] | xargs) docker stack deploy --with-registry-auth -c docker-compose.yml dkr-39
```
