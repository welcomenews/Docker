### DKR 19: Images. Внешние Docker-реестры

1. Соберите образ приложения gocalc, которое мы собирали ранее в 14 задании, и загрузите в наш GitLab registry — registry.rebrainme.com.
2. В качестве подсказки можете использовать веб-интерфейс gitlab. В каждом репо есть раздел Packages & Registries, который подскажет как правильно тэгировать образ.
3. Образ необходимо загрузить в свою группу в общем разделе практикума (группа docker_users_repos). Имя репозитория должно быть dkr-19-gocalc.


```
docker login registry.rebrainme.com
docker build -t registry.rebrainme.com/docker_users_repos/1332/dkr-19-gocalc .
docker push registry.rebrainme.com/docker_users_repos/1332/dkr-19-gocalc
```

