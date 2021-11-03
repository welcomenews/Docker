##DKR 17 Images. Использование нескольких Dockerfile


1. Создайте репозиторий в gitlab.rebrainme.com с именем dkr-17-alonetone.
2. Скопируйте в созданный вами репозиторий dkr-17-alonetone содержимое из репозитория проекта alonetone.
3. Напишите и добавьте в репозиторий /home/user/dkr-17-alonetone/Dockerfile.dev - с установкой development зависимостей, второй /home/user/dkr-17-alonetone/Dockerfile.prod без таковых (изучите флаги bundler).
4. Соберите 2 образа, выставив им теги alonetone:dev для образа с development зависимостями, и alonetone:prod для образа без завистимостей. (Внутри Dockerfile необходимо выставить переменную RAILS_ENV).
5. Выведите список образов.
    
    В данном файле нас интересуют этапы:

    Установка системных зависимостей
    Установка yarn-зависимостей
    Установка ruby-зависимостей при помощи bundler
    Для сборки используйте ruby не ниже 2.6


```Команда для сборки docker build -t alonetone:dev -f Dockerfile.dev .```

```Команда для сборки docker build -t alonetone:prod Dockerfile.prod .```

