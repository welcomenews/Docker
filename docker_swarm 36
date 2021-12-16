## DKR 36 [Optional]: Swarm. Многонодовый Docker Swarm-кластер

1. С машины node1 сгенерируйте ssh-ключ при помощи команды ssh-keygen
2. Настройте авторизацию по ключам с node1 на node2,node3 при помощи команды ssh-copy-id user@NODEIP
3. Выведите текущий список контекстов на машине при помощи команды docker context ls
4. При помощи команды docker context создайте контексты node2,node3 для управления соответсвующими нодами
5. Выведите текущий список контекстов на машине при помощи команды docker context ls
6. Переключитесь на контекст node2
*  Выполните команду docker pull образа nginx:stable
*  Выполните команду docker images
7. Переключитесь на контекст default и выполните команду docker images. Убедитесь, что на текущей машине нет заруженных образов.
8. Переключитесь на контекст node3
*  Запустите контейнер с redis
*  Выполните команду docker ps - убедитесь, что ваш контейнер стартован
9. Переключитесь на контекст default и выполните команду docker ps - убедитесь, что на текущей машине нет запущенных контейнеров

```
ssh-copy-id user@IP-NODE2
ssh-copy-id user@IP-NODE3
docker context create node2 --default-stack-orchestrator=swarm --docker host=ssh://[user]@IP
docker context create node3 --default-stack-orchestrator=swarm --docker host=ssh://[user]@IP
docker context use node2
docker info
docker pull nginx:stable
docker images
docker context use node3
docker info
docker run -d redis
docker ps
docker context use default
docker ps
```
