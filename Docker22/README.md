## DKR 22: Images. Различия базовых образов

1. Скопируйте содержимое из официального репозитория zookeeper на предоставленную машину.
2. Создайте в репозитории /home/user/zookeeper/Dockerfile.alpine и /home/user/zookeeper/Dockerfile.buster, где в качестве базовых образов используются разные версии openjdk, в которых собирается приложение в JAR-файл (Используйте образы openjdk:8-jdk-alpine и openjdk:8-jdk-buster ).
3. Для сборки будет необходим mvn, вам необходимо добавить его в контейнер (попробуйте установить его не менеджером пакетов, а скачав через curl и распаковав его)
4. Команда сборки приложения присутствует в README, вам необходимо найти флаг, который позволит пропустить этап тестирования.
5. Соберите оба этих образа c тегами zookeeper-alpine:latest и zookeeper-buster:latest.
6. Выведите список образов и сравните итоговые размеры.
7. Изучите docker history каждого из образов, обратите внимание на размеры слоёв
Опционально: Объедините команду скачки/распаковки mvn, команду сборки приложения и команду удаления mvn (после сборки приложения менеджер пакетов не нужен в образе) в одну директиву RUN. Соберите образ заново оцените новые размеры образов и слоёв

``` docker build -t zookeeper-alpine:latest -f Dockerfile.alpine . ```

``` docker build -t zookeeper-buster:latest -f Dockerfile.buster . ```
