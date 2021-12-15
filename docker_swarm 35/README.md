## DKR 35: Swarm. Многонодовый Docker Swarm-кластер


1. Инициализируйте swarm на 3х нодах. Выведите список нод.
2. В репозитории dkr-30-voting используйте docker-compose.yml из DKR_30 решения и создайте новую ветку с именем dkr-35-swarm. Соберите и загрузите образы в registry.rebrainme.com.
3. Измените docker-compose.yml на использование образа из registry и добавьте директиву для запуска сервиса nginx в двух экземплярах.
4. Запустите стек из файла docker-compose.yml.
5. Выведите список стеков.
6. Выведите список сервисов.
7. Выполните команду curl -i localhost/ping внутри контейнера сервиса nginx - должен вернуться ответ от сервиса voting.

```
### Create file daemon.json into /etc/docker/
{
  "insecure-registries" : ["registry.rebrainme.com"]
}
docker restart
docker login registry.rebrainme.com
git clone https://gitlab.rebrainme.com/docker_users_repos/1332/dkr-30-voting.git
git checkout dkr-35-swarm
docker swarm init --advertise-addr 165.227.166.196  на ноде1(главная)
добавляем други ноды
env $(cat .env | grep ^[A-Z] | xargs) docker stack deploy --with-registry-auth -c docker-compose.yml dkr-35  (на главной ноде)
docker exec -it dkr-35_nginx.1.j3e9d33y69bgvgdo3sofgt7ff sh
curl localhost/ping
```
