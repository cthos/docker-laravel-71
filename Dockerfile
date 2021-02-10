FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y nginx mysql-server mysql-client php7.4 php7.4-common php7.4-mbstring php7.4-xml php7.4-gd php7.4-curl php7.4-fpm php7.4-mysql supervisor curl git nodejs npm

RUN npm install -g npm
RUN npm install -g n

RUN n lts

COPY config/default-site /etc/nginx/sites-available/default
COPY config/php-fpm.conf /etc/supervisord/php-fpm.conf
COPY config/supervisor.conf /etc/supervisor.conf
COPY config/install-composer.sh /install-composer.sh

RUN /bin/bash /install-composer.sh && rm -rf /install-composer.sh

COPY config/start.sh /start.sh
RUN chmod +x /start.sh

CMD ["supervisord", "-c", "/etc/supervisor.conf"]