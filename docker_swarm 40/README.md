## DKR 40: Swarm. Построение постоянного хранилища для кластера на базе GlusterFS

1. На нодах разверните GlusterFS сервер и создайте replicated volume с 3 репликами, используя локальные директории.
2. Выведите информацию о пирах на каждой ноде.
3. Выведите информацию о созданном Volume.
4. Подключите volume на каждой из нод к локальной директории.
Создайте файл rbmdkr38 в подключенной директории.
Выведите на каждой из нод содержимое директорий, используемых в volume, при помощи ls.
Запускаем GlusterFS на 3 серверах в replicated режиме с 3 репликами.
В репозитории из предыдущего задания используйте поддиректорию из подключенной директории как хранилище базы данных.
Перезапустите стек.
Накатите миграции и сиды на базу данных из контейнера с приложением.
Выведите на каждой из нод содержимое директорий, используемых в volume, при помощи ls.
При помощи curl обратитесь к сервису по доменному имени, указанному для traefik, и по endpoint /polls.
Закоммитьте изменения в ветку dkr-38.


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

sudo gluster peer probe node3; sudo gluster peer probe node2; sudo gluster peer probe node1

sudo gluster pool list

sudo gluster volume create gfs replica 3 voting.165.232.78.24.nip.io:/data/gfs0/ voting.165.232.78.151.nip.io:/data/gfs0/ voting.165.232.70.238.nip.io:/data/gfs0/ force
sudo gluster volume start gfs

монтируем volume
sudo mount -t glusterfs voting.165.232.70.238.nip.io:/gfs /mnt
sudo mount -t glusterfs voting.165.232.78.151.nip.io:/gfs /mnt
sudo mount -t glusterfs voting.165.232.78.24.nip.io:/gfs /mnt

sudo gluster volume status


git push --set-upstream origin dkr-38
```
