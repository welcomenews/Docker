## DKR 23: Advanced. Restart policy

 
1. no - автоматический рестарт не требуется (по умолчанию все контейнеры запускаются как раз с этой политикой).
2. on-failure - перезапуск производится только, если работа контейнера завершается с кодом ошибки, отличным от 0 (то есть при любых ошибках).
3. always - перезапускать всегда - и в случае успешного выполнения, и в случае неуспешного. Правда, есть нюанс - в случае, если вы вручную останавливаете контейнер, он не перезапускается. Зато если вы его остановили, а потом перезапустили Docker демон (ну или хост), то контейнер перезапустится тоже, даже если вы его прежде останавливали вручную.
4. unless-stopped - похоже на always, но если контейнер был остановлен (вручную или иным образом), то он не запустится даже после рестарта Docker/хоста.
 
 
1. Запустите 4 контейнера для каждой политики рестарта, со следующими параметрами:

* должно работать в фоне,
* имеет имя по шаблону rbm-dkr-23-$RESTART_POLICY,
* образ - nginx:stable-alpine.

2. По каждому из запущенных контейнеров вызовите docker kill -s 15 $CONTAINER_NAME.
3. Выведите список контейнеров с дублированием вывода в файл kill_15.txt (docker ps -a | tee /home/user/kill_15.txt).
4. Запустить неактивные контейнеры
5. Выведите список контейнеров.
6. По каждому из запущенных контейнеров вызовите docker kill $CONTAINER_NAME.
7. Выведите список контейнеров с дублированием вывода в файл kill.txt (docker ps -a| tee /home/user/kill.txt).
8. Перезапустите Docker.
9. Выведите список контейнеров.
    
    ```
    docker run -d --restart no --name rbm-dkr-23-no nginx:stable-alpine
    docker run -d --restart on-failure --name rbm-dkr-23-on-failure nginx:stable-alpine
    docker run -d --restart always --name rbm-dkr-23-always nginx:stable-alpine
    docker run -d --restart unless-stopped --name rbm-dkr-23-unless-stopped nginx:stable-alpine
    
    docker kill -s 15 rbm-dkr-23-no
    docker kill -s 15 rbm-dkr-23-always
    docker kill -s 15 rbm-dkr-23-on-failure
    docker kill -s 15 rbm-dkr-23-unless-stopped
    
    docker ps -a | tee /home/user/kill_15.txt
    
    docker kill rbm-dkr-23-no
    docker kill rbm-dkr-23-always
    docker kill rbm-dkr-23-on-failure
    docker kill rbm-dkr-23-unless-stopped
    
    docker ps -a | tee /home/user/kill.txt
    ```
    
