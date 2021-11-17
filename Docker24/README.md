## DKR 24: Advanced. Capabilities

Currently docker containers by default only get the following capabilities.

CHOWN, DAC_OVERRIDE, FSETID, FOWNER, MKNOD, NET_RAW, SETGID, SETUID, SETFCAP, SETPCAP, NET_BIND_SERVICE, SYS_CHROOT, KILL, AUDIT_WRITE


1. Запустите контейнер со следующими параметрами:

* должно работать в фоне,
* имеет имя rbm-dkr-24,
* образ - nginx:stable-alpine,
* убраны все capabilities,
* добавлены только необходимые capabilities для работы контейнера (в зависимости от пути решения у вас будет 2-4 capabilites).

2. Выведите список контейнеров, чтобы показать, что требуемый контейнер работает.
3. Выведите информацию о контейнере через docker inspect.

```
docker run -d --name rbm-dkr-24 --cap-drop ALL --cap-add=chown --cap-add=dac_override --cap-add=setgid --cap-add=setuid nginx:stable-alpine
docker inspect rbm-dkr-24
```
