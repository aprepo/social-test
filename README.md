# social-test
Testing Django app with social signup features

## Hot get this done:
- Create directory: mkdir social-test
- Go to directory: cd social-test
- Set python version with pyenv: pyenv local 3.6.2
- Set pipenv: pipenv install --python 3
- Start pipenv shell: pipenv shell
- Install django: pipenv install django
- Install django-social-app: pipenv install django-social-app
- Create django app: django-admin startproject social
- Do django db migration: python manage migrate
- Run djang to test it works: python manage runserver
- Create Dockerfile and docker-compose-yml
- Create docker image: docker-compose build
- Run docker container: docker-compose up

## Create docker image
``
docker-compose build
``

## Start docker image
``
docker-compose up
``

## Start docker in background
``
docker-composer up -d
``

## Show running instances
``
docker-compose ps
``

## Start shell in running docker
``
docker-compose exec django bash
``