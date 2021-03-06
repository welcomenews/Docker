## DKR 20: Images. Минимизация времени сборки образа

1. Клонируйте репозиторий counter в свой аккаунт под именем dkr-20-counter.
2. Напишите для него Dockerfile с планом сборки, указанным в описании как универсальная структура. В роли базового образа используйте python:3.7-buster.
3. Соберите образ с тегом normal, замерив время, чтобы определить, сколько времени займет сборка.
4. Создайте копию Dockerfile с именем Dockerfile.mini и внесите в него изменения, очищающие образ от всего, что может увеличивать его объем (после сборки можно удалить pipfile* и сам менеджер pip, но нужно делать это в одной директиве, иначе файлы останутся в слоях образа и итоговый объем не уменьшится)
5. Соберите новый образ с тегом squash. При сборке используйте ключ --squash для уменьшения объема образа и с замером времени, чтобы определить, сколько времени займет сборка (для включения squash понадобится включение эксперементальных функций)
6. Сравните размеры получившихся образов.

```
docker build -t dkr-20-counter:normal -f Dockerfile .
docker build -t dkr-20-counter:squash -f Dockerfile.mini .
```
