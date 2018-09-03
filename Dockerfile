# Social Test
# Version: 1.0
FROM python:3
# Install packages
RUN apt-get update && apt-get upgrade -y && apt-get autoremove && apt-get autoclean
RUN apt-get install -y \
    libffi-dev \
    libssl-dev \
    libxml2-dev \
    libxslt-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zlib1g-dev \
    net-tools \
    vim
# Project Files and Settings
ARG PROJECT=social
ARG PROJECT_DIR=/var/www/${PROJECT}
RUN mkdir -p $PROJECT_DIR
WORKDIR $PROJECT_DIR/social
COPY Pipfile Pipfile.lock ./
RUN pip install -U pipenv
RUN pipenv install --system
# Server
EXPOSE 8000
STOPSIGNAL SIGINT
CMD ["gunicorn"  , "-b", "0.0.0.0:8000", "social.wsgi"]
