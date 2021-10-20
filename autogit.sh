#!/bin/bash

cd /home/sergey/Rebrain/devops-engineer-basics/
git checkout develop
git pull
git push -u origin -o merge_request.create
cd ..

