# social-test
Testing Django app with social signup features

## Hot get this done:
- Create directory: ``mkdir social-test``
- Go to directory: ``cd social-test``
- Set python version with pyenv: ``pyenv local 3.6.2``
- Set pipenv: ``pipenv install --python 3``
- Start pipenv shell: ``pipenv shell``
- Install django: ``pipenv install django``
- Install django-social-app: ``pipenv install django-social-app``
- Create django app: ``django-admin startproject social``
- Do django db migration: ``python manage migrate``
- Run djang to test it works: ``python manage runserver``
- Create Dockerfile and docker-compose-yml
- Create docker image: ``docker-compose build``
- Run docker container: ``docker-compose up``
- Install gunicorn: ``pipenv install gunicorn``
- Run django with gunicorn: ``gunicorn social.wsgi``
- Install aws cli tools: ``pipenv install awscli``
- Run aws configuration: ``aws configure``
  - See: https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html

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

# Troubleshoot
## I can't connect to http://127.0.0.1:8000/
Check the actual IP to be used with:
``
docker-machine ip default
``

This happens when running the docker on VirtualBOX, for example when running on mac, on Linux this probably is not a problem.
The Docker is exposing the port to the VirtualBOX host, not on the actual machine, so you need to connect to the IP of the virtualbox. If you want to use localhost instead (so you don't have to care if the IP of the VirtualBOX changes), you can forward the local port to the VirtualBOX port easily by configuring it on the VirtualBOX itself: 
- Open the settings of the "default" machine on VirtualBOX (assuming this is the name of the machine you are using)
- Open "Network"
- On "Adapter 1", open "Advanced"
- Open "Port forwarding"
- Add following:
  -  Name: django
  - Protocol: TCP
  - Host IP: 127.0.0.1
  - Host port: 8000
  - Guest IP: <leave empty>
  - Guest port: 8000
  
Now you can connect to localhost:8000 and it will go to port 8000 on the vm and via taht to the django on the docker image. Note: this will reserve the port 8000 when the VirtualBOX is running, so if you want to run the app on local, you need to shut down the VirtualBOX (or change the port).
