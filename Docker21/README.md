## DKR 21: Images. Dockerignore

1. Склонируйте репозиторий fat_free_crm.
2. Добавьте в репозиторий файл /home/user/fat_free_crm/.dockerignore, который должен содержать:
 * директорию .git,
 * все скрытые файлы (начинаются с .) с расширением yml
 * все yml-файлы в директории config, кроме settings.default.yml database.sqlite.yml database.postgres.docker.yml
 * все файлы во всех подпапках ./public/avatars/ с расширением gif
3. Соберите образ локально с именем fat_free_crm:dockerignore.


``` time docker build -t fat_free_crm:dockerignore . ```
