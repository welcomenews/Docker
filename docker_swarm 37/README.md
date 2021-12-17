## DKR 37: Swarm. Запускаем доступный извне сервис

1. В репозитории dkr-30-voting из предыдущих заданий создайте новую ветку с именем dkr-37-routing-mesh.
2. Измените docker-compose.yml файл, добавив директиву для routing mesh сервиса nginx на порт 8080 внешнего адреса каждой ноды.
3. Запустите обновленный стек.
4. При помощи команды curl с опцией -i обратитесь к каждой ноде по внешнему адресу и порту по пути /ping.

```
### Create file daemon.json into /etc/docker/
{
  "insecure-registries" : ["registry.rebrainme.com"]
}
docker restart
docker login registry.rebrainme.com
git clone https://gitlab.rebrainme.com/docker_users_repos/1332/dkr-30-voting.git
git checkout dkr-37-routing-mesh
docker swarm init --advertise-addr 64.227.113.28  на ноде1(главная)
добавляем други ноды
env $(cat .env | grep ^[A-Z] | xargs) docker stack deploy --with-registry-auth -c docker-compose.yml dkr-37  (на главной ноде)
curl -i 64.227.113.28:8080/ping
curl -i 64.227.125.200:8080/ping
```
