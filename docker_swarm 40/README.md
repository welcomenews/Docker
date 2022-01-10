## DKR 40: Swarm. Построение постоянного хранилища для кластера на базе GlusterFS

1. На нодах разверните GlusterFS сервер и создайте replicated volume с 3 репликами, используя локальные директории.
2. Выведите информацию о пирах на каждой ноде.
3. Выведите информацию о созданном Volume.
4. Подключите volume на каждой из нод к локальной директории.
5. Создайте файл rbmdkr38 в подключенной директории.
6. Выведите на каждой из нод содержимое директорий, используемых в volume, при помощи ls.
7. Запускаем GlusterFS на 3 серверах в replicated режиме с 3 репликами.
8. В репозитории из предыдущего задания используйте поддиректорию из подключенной директории как хранилище базы данных.
9. Перезапустите стек.
10. Накатите миграции и сиды на базу данных из контейнера с приложением.
11. Выведите на каждой из нод содержимое директорий, используемых в volume, при помощи ls.
12. При помощи curl обратитесь к сервису по доменному имени, указанному для traefik, и по endpoint /polls.
13. Закоммитьте изменения в ветку dkr-38.


install
```
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:gluster/glusterfs-3.10;
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
sudo mkdir -p /data/gfs0

sudo gluster volume create gfs replica 3 voting.165.232.78.24.nip.io:/data/gfs0/ voting.165.232.78.151.nip.io:/data/gfs0/ voting.165.232.70.238.nip.io:/data/gfs0/ force
sudo gluster volume start gfs

на каждой ноде монтируем СВОЙ volume
один из нижних 3-х.
sudo mount -t glusterfs voting.165.232.70.238.nip.io:/gfs /mnt
sudo mount -t glusterfs voting.165.232.78.151.nip.io:/gfs /mnt
sudo mount -t glusterfs voting.165.232.78.24.nip.io:/gfs /mnt

sudo gluster volume status

### Create file daemon.json into /etc/docker/
{
  "insecure-registries" : ["registry.rebrainme.com"]
}
docker restart
docker login registry.rebrainme.com
git clone https://gitlab.rebrainme.com/docker_users_repos/1332/dkr-30-voting.git
git checkout dkr-38
docker swarm init --advertise-addr 165.232.70.238  на ноде1(главная)
добавляем други ноды как manager
docker network create -d overlay traefik-public
env $(cat .env | grep ^[A-Z] | xargs) docker stack deploy --with-registry-auth -c traefik-compose.yml traf-40  (на главной ноде)
env $(cat .env | grep ^[A-Z] | xargs) docker stack deploy --with-registry-auth -c docker-compose.yml dkr-40

на ноде с voting сервисом запускаем миграции
php artisan migrate --force
php artisan db:seed --force

curl voting.165.232.78.24.nip.io/polls

git push --set-upstream origin dkr-38
```


https://docs.gluster.org/en/latest/Quick-Start-Guide/Quickstart/

https://medium.com/running-a-software-factory/setup-3-node-high-availability-cluster-with-glusterfs-and-docker-swarm-b4ff80c6b5c3

https://www.howtoforge.com/tutorial/high-availability-storage-with-glusterfs-on-centos-7/

https://theworkaround.com/2019/05/15/docker-swarm-persistent-storage.html

https://www.svennd.be/installing-gluster-3-brick-distributed-centos-7/
