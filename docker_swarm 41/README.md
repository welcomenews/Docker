## DKR 41: Swarm. GlusterFS через Plugin

1. На каждой из нод установите плагин для работы с glusterfs. Используйте версию 2.0.3 от trajano. 2.0.6 не работает и есть issue по этому поводу
2. В репозитории из предыдущего задания замените использование bind на плагин.
3. Перезапустите стек.
4. Накатите миграции и сиды на базу данных из контейнера с приложением.
5. Выведите на каждой из нод содержимое директорий, используемых в volume, при помощи ls.
6. При помощи curl обратитесь к сервису по доменному имени, указанному для traefik, и по endpoint /polls.
7. Закоммитьте изменения в ветку dkr-39.

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

на главной ноде
sudo gluster volume create gfs replica 3 voting.165.232.78.24.nip.io:/data/gfs0/ voting.165.232.78.151.nip.io:/data/gfs0/ voting.165.232.70.238.nip.io:/data/gfs0/ force
sudo gluster volume start gfs
sudo gluster volume status

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
git checkout dkr-39
docker swarm init --advertise-addr 165.232.70.238  на ноде1(главная)
добавляем други ноды как manager
docker network create -d overlay traefik-public
docker network ls
env $(cat .env | grep ^[A-Z] | xargs) docker stack deploy --with-registry-auth -c traefik-compose.yml traf-41  (на главной ноде)
env $(cat .env | grep ^[A-Z] | xargs) docker stack deploy --with-registry-auth -c docker-compose.yml dkr-41

на ноде с voting сервисом запускаем миграции
php artisan migrate --force
php artisan db:seed --force

curl voting.165.232.78.24.nip.io/polls

git push --set-upstream origin dkr-39

```


https://blog.ruanbekker.com/blog/2019/03/05/container-persistent-storage-for-docker-swarm-using-a-glusterfs-volume-plugin/

https://blog.ruanbekker.com/blog/2019/03/05/setup-a-3-node-replicated-storage-volume-with-glusterfs/?referral=github.com

https://ivirt-it.ru/glusterfs-create-volumes/

https://docs.gluster.org/en/v3/Administrator%20Guide/Setting%20Up%20Volumes/

https://www.digitalocean.com/community/tutorials/how-to-create-a-redundant-storage-pool-using-glusterfs-on-ubuntu-20-04-ru

https://stackify.dev/925308-docker-compose-volume-on-node-modules-but-is-empty

https://medium.com/running-a-software-factory/setup-3-node-high-availability-cluster-with-glusterfs-and-docker-swarm-b4ff80c6b5c3

https://github.com/trajano/docker-volume-plugins/tree/master/glusterfs-volume-plugin


