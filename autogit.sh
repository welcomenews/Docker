#!/bin/bash


# Скачиваем новые изменения из ветки develop github и пушим их в ветку develop gitlab.
# Предварительно нужно добавить репозиторий github

cd /home/sergey/Rebrain/devops-engineer-basics/
git checkout develop
git pull
git push -u origin -o merge_request.create
cd ..

