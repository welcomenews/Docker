## DKR 31: Compose. Хранение логов в EFK

1. В репозитории из предыдущего задания создайте новую ветку с именем dkr-31-voting-efk.
2. Измените docker-compose.yml файл, добавив следующее:
* добавьте EFK стек;
* Fluentd должен быть доступен с хоста;
* Kibana должна быть доступна с хоста;
* остальные сервисы должны отправлять логи в fluentd через fluentd log driver.
3. Запустите сервис с именем проекта rbm31.
4. Сконфигурируйте приложение, выполнив команды из раздела Migration и Seeding в README репозитория.
5. Обратитесь к сервису по localhost:20000/polls (вы должны увидеть json-объект).
6. Откройте Kibana в браузере и проверьте, что логи запроса присутствуют.

```
git clone https://gitlab.rebrainme.com/docker_users_repos/1332/dkr-30-voting.git
git checkout -b dkr-31-voting-efk
docker-compose -p rbm31 up -d
docker exec -it rbm31_voting_1 sh

php artisan migrate --force
php artisan db:seed --force
php artisan polls:collect:status
php vendor/bin/phpunit -c phpunit.xml
exit

curl localhost:20000/polls
```
