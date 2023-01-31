# 4.7-skillbox

Что нужно сделать

Возьмите одну виртуальную машину с доступом из интернета для работы над заданием. Для последующей проверки доступности используйте свою локальную машину.

- Настройте registry, используя самоподписанный SSL-сертификат (если у вас есть свой домен, то Let's Encrypt). В качестве реверс прокси используйте docker-образ Nginx.
- Напишите docker-compose для старта Nginx и registry.
- Соберите базовый образ для Python-приложения Tornado.
- Возьмите пример hello world из документации и добавьте файл в образ.
- Запустите контейнер из только что собранного образа.
- Запушьте полученный образ в registry из первого пункта.
- Покажите с помощью curl список образов в registry.


Рекомендации

Выполнить работу вам помогут следующие материалы:
- Docker-образ Nginx
- Python-приложение Tornado

Следите за тем, чтобы полученный образ не превышал 200 Мбайт. Если выходит больше, то используйте рекомендации по уменьшению размера образа из наших видео.


```
## Если используем самоподписываемый сертификат то

$ sudo apt install openssl
$ vim /etc/ssl/openssl.cnf 
находим [ v3_ca ] и под ним пишем
subjectAltName = IP:192.168.1.96 <-- это IP наш 


$ vim /usr/lib/systemd/system/docker.service
находим блок [Service] и в него дописываем
Environment=GODEBUG=x509ignoreCN=0
$ sudo systemctl daemon-reload
$ sudo systemctl restart docker.service

## Создание самоподписанного сертификата
$ mkdir cert
$ cd cert
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout mykey.key -out mycert.crt
где:
-x509 — уточнение, что нам нужен именно самоподписанный сертификат;
-newkey — автоматическое создание ключа сертификата;
-days — срок действия сертификата в днях;
-keyout — путь (если указан) и имя файла ключа;
-out —  путь (если указан) и имя файла сертификата.
--+---+
Country Name (2 letter code) [AU]:RU
State or Province Name (full name) [Some-State]:
Locality Name (eg, city) []:Moscow
Organization Name (eg, company) [Internet Widgits Pty Ltd]:My Compony              
Organizational Unit Name (eg, section) []:
Common Name (e.g. server FQDN or YOUR name) []:192.168.1.96  <-- это IP наш 
Email Address []:

$ openssl dhparam -out dhparam.pem 2048

## ----- Прочитать сертификат можно ------
$ openssl -x509 -in certs/mycert.crt -text

$ mkdir -p /etc/docker/certs.d/192.168.1.96/
туда кидаем наш серт mycert.crt только переиновать там его нужно в ca.crt

$ docker login 127.0.0.1
или
$ docker login 192.168.1.96

## Проверяем что ключ добавился
$ cat ~/.docker/config.json
{
	"auths": {
		"127.0.0.1": {
			"auth": "c2VyZ2V5OjE..."
		}
	}
}

```
#### Для запуска утилиты htpasswd
sudo apt install apache2-utils -y

#### Создаём пользователя и пароль
$ mkdir auth
$ cd auth
$ htpasswd -B -c ./auth/htpasswd sergey  <-- имя

#### Собираем образ
$ docker build -t tornado .

#### Запуск docker-compose
$ docker-compose up -d

#### Запуск нашего собранного образа tornado
$ docker run -d -p 127.0.0.1:8888:8888 tornado

#### Даём таг для загрузки в наш репозиторий
$ docker tag tornado:latest 127.0.0.1/tornado

#### Загружаем в наш репозиторий
$ docker push 127.0.0.1/tornado

#### Проверяем список образов в нашем репозитории
$ curl https://sergey:123456@192.168.1.96/v2/_catalog -k

###########################

https://docs.docker.com/registry/deploying/

https://trueconf.ru/blog/baza-znaniy/kak-sgenerirovat-samopodpisannyj-sertifikat.html#_OpenSSL_Linux

https://github.com/wargx/docker-tornado/blob/master/4.5.2/Dockerfile




