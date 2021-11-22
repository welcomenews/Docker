## DKR 27: Compose. Знакомство с Docker compose

1. Создайте compose-файл docker-compose-unmounted.yml, который будет запускать сервис со следующими параметрами:
* слушает на хосте 127.0.0.1:18888,
* имеет имя nginx,
* образ - nginx:stable.
2. Запустите данный сервис работающий в фоне и имеющий имя проекта rbm27.
3. Выведите список запущенных контейнеров.
4. Скачайте конфигурационный файл nginx.
5. Создайте второй compose-файл docker-compose-mounted.yml, который будет запускать тот же сервис с теми же параметрами, и еще подключать скачанный вами конфигурационный файл nginx внутрь контейнера.
6. Перезапустите сервис с использованием нового файла, но со старым именем, чтобы старый контейнер был заменен новым.
7. Выведите список запущенных контейнеров.

```
docker-compose -f docker-compose-unmounted.yml -p rbm27 up -d
docker-compose -f docker-compose-unmounted.yml ps
docker-compose -f docker-compose-mounted.yml -p rbm27 up -d
curl 127.0.0.1:18888
```


Установка docker-compose

- sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
- sudo chmod +x /usr/local/bin/docker-compose
- sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
- docker-compose --version
