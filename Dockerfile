FROM mtmacdonald/docker-laravel:1.4.0

RUN apt-get update
RUN apt-get install software-properties-common python-software-properties -y
RUN add-apt-repository ppa:ondrej/php -y
RUN apt-get update

RUN apt-get -y install php7.1 php7.1-common php7.1-mbstring php7.1-xml php7.1-curl php7.1-fpm php7.1-mysql`