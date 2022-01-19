## DKR 42: Swarm. Собираем логи кластера через EFK


1. В репозитории из предыдущего задания добавьте Compose-файл /home/user/dkr-30-voting/efk.yml с описанием стека 
EFK с:
*  ElasticSearch хранит данные на диске GlusterFS (выставите ограничения по памяти для elastic)
*  установкой Fluentd на каждую ноду, чтобы он слушал на localhost,
*  доступом к Kibana через Traefik с Basic Auth rebrainme:DockerRocks!.

2. Запустите данный стек.
3. Перепишите все остальные docker-compose на отправку логов через fluentd на localhost (/home/user/dkr-30-voting/docker-compose.yml).
4. Перевыложите все стеки.
5. При помощи curl обратитесь к сервису по доменному имени, указанному для traefik, и по endpoint /polls и выведите время запроса.
6. Проверьте наличие логов в kibana


```
установка glusterFS
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:gluster/glusterfs-7
sudo apt-get update -y
sudo apt-get install -y glusterfs-server attr
sudo systemctl enable glusterd.service

# Verify the gluster service is enabled
sudo systemctl is-enabled glusterd.service

sudo systemctl start glusterd.service
sudo systemctl status glusterd.service

sudo gluster peer probe voting.165.232.78.24.nip.io; sudo gluster peer probe voting.165.232.78.151.nip.io; sudo gluster peer probe voting.165.232.70.238.nip.io

sudo gluster pool list

на каждой ноде создаём volume
sudo mkdir -p /data/gfs0/volume
sudo chmod -R 775 /data/gfs0/volume

на главной ноде
sudo gluster volume create gfs replica 3 voting.165.232.78.24.nip.io:/data/gfs0/ voting.165.232.78.151.nip.io:/data/gfs0/ voting.165.232.70.238.nip.io:/data/gfs0/ force
sudo gluster volume start gfs
sudo gluster volume status
sudo gluster volume info

установка плагина
на каждой ноде
docker plugin install --alias glusterfs trajano/glusterfs-volume-plugin:v2.0.3 --grant-all-permissions --disable
docker plugin set glusterfs SERVERS=node1,node2,node3
docker plugin enable glusterfs
sudo docker plugin ls


### Create file daemon.json into /etc/docker/
{
  "insecure-registries" : ["registry.rebrainme.com"]
}
docker restart
docker login registry.rebrainme.com
git clone https://gitlab.rebrainme.com/docker_users_repos/1332/dkr-30-voting.git
git checkout dkr-42
docker swarm init --advertise-addr 165.232.70.238  на ноде1(главная)
добавляем други ноды как manager
docker network create -d overlay traefik-public
docker network ls
env $(cat .env | grep ^[A-Z] | xargs) docker stack deploy --with-registry-auth -c traefik-compose.yml traf-42  (на главной ноде)
env $(cat .env | grep ^[A-Z] | xargs) docker stack deploy --with-registry-auth -c efk.yml efk-42
env $(cat .env | grep ^[A-Z] | xargs) docker stack deploy --with-registry-auth -c docker-compose.yml dkr-42

на ноде с voting сервисом запускаем миграции
php artisan migrate --force
php artisan db:seed --force

curl voting.165.232.78.24.nip.io/polls

git push --set-upstream origin dkr-42
```


https://habr.com/ru/post/551792/

https://marcofranssen.nl/building-a-elasticsearch-cluster-using-docker-compose-and-traefik

https://www.digitalocean.com/community/tutorials/how-to-use-traefik-as-a-reverse-proxy-for-docker-containers-on-debian-9

https://community.traefik.io/t/kibana-redirection-with-docker-provider/3716

https://jensknipper.de/blog/basic-authentication-with-traefik/

https://doc.traefik.io/traefik/v2.0/middlewares/basicauth/

https://stackoverflow.com/questions/51541323/recommended-ram-ratios-for-elk-with-docker-compose


