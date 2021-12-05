## DKR 30: Compose. Запуск Compose со сборкой образа

1. Склонируйте репозиторий voting в свой аккаунт на gitlab.rebrainme.com с именем dkr-30-voting.
2. Напишите docker-compose.yml файл, который бы собирал приложение, запускал его и все требуемые зависимости:
* nginx - проксирует запросы на voting и доступен на хосте на порту 20000
пример конфигурационного файла находится в папке nginx, смонтируйте его в /etc/nginx/conf.d/default.conf.
Используйте alpine-версию образа
* voting - собирается из репозитория;
* mysql - база данных, к которой подключается voting;
* redis - In-memory хранилище для кэша;
3. Запустите сервис с именем проекта rbm30.
4. Сконфигурируйте приложение, выполнив команды из раздела Migration и Seeding в README репозитория.
5. Обратитесь к сервису по localhost:20000/polls (в ответе вы должны увидеть json-объект).

```
docker-compose -p dkr30 up -d
docker exec -it dkr30_voting_1 sh

/var/www/html # php artisan migrate --force
/var/www/html # php artisan db:seed --force
/var/www/html # php artisan polls:collect:status
/var/www/html # php vendor/bin/phpunit -c phpunit.xml

curl localhost:20000/polls | python3 -mjson.tool
```
