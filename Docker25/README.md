## DKR 25: Advanced. Сети 


1. Создайте сеть с драйвером bridge и именем rbm-25-bridge.
2. Выведите список всех сетей.
3. Создайте из образа nginx:stable контейнер с именем rbm-dkr-25-nginx, работающий в фоне и подключенный к новой сети.
4. Запустите второй контейнер с именем rbm-dkr-25-pinger в интерактивном режиме из образа alpine:3.10 и подключенный к новой сети, установите в нем curl и обратитесь к контейнеру rbm-dkr-25-nginx по DNS-записи.

```
docker network create -d bridge rbm-25-bridge
docker run -d --name rbm-dkr-25-nginx --network rbm-25-bridge nginx:stable
docker run -it --name rbm-dkr-25-pinger --network rbm-25-bridge alpine:3.10
curl rbm-dkr-25-nginx
```
