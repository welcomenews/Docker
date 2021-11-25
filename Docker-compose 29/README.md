## DKR 29: Compose. Опции Compose-файла

1. В репозитории из предыдущего задания создайте новую ветку с именем dkr-29-compose-opt.
2. Измените /home/user/dkr-14-gocalc/docker-compose.yml файл, добавив следующее:
* установите политику перезапуска unless_stopped у gocalc;
* у nginx сократите capabilities до минимального уровня, как мы делали ранее;
* добавьте depends_on у сервисов по их зависимости друг от друга;
* создайте 2 сети - в одной будет gocalc и nginx, а в другой - gocalc и postgres.
3. Запустите сервис nginx - должны подняться все 3 контейнера с именем проекта rbm29
4. Подключитесь к контейнеру сервиса nginx и попытайтесь обратиться к сервису postgres командой ping
5. Загрузите новую ветку с изменениями в репозиторий.

```
export GIT_SSL_NO_VERIFY=1
git clone https://gitlab.rebrainme.com/docker_users_repos/1332/dkr-14-gocalc.git
git checkout -b dkr-29-compose-opt
docker-compose -p rbm29 build
docker-compose -p rbm29 up -d nginx
docker exec -it rbm29_nginx_1 bash

root@338cf07c52e1:/# ping app
PING app (172.21.0.2) 56(84) bytes of data.
64 bytes from rbm29_app_1.rbm29_gocalc_nginx (172.21.0.2): icmp_seq=1 ttl=64 time=0.102 ms
64 bytes from rbm29_app_1.rbm29_gocalc_nginx (172.21.0.2): icmp_seq=2 ttl=64 time=0.077 ms
root@338cf07c52e1:/# ping postgres
ping: postgres: Temporary failure in name resolution

git push --set-upstream origin dkr-29-compose-opt
```
