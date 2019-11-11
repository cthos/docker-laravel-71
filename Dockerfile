FROM cthos/docker-laravel-71:latest

RUN apt-get update
RUN apt-get -y install php7.2 php7.2-common php7.2-mbstring php7.2-xml php7.2-curl php7.2-fpm php7.2-mysql
RUN apt-get -y remove php7.1 php7.1-common php7.1-mbstring php7.1-xml php7.1-curl php7.1-fpm php7.1-mysql

COPY config/default-site /etc/nginx/sites-available/default
COPY config/php-fpm.conf /etc/supervisord/php-fpm.conf