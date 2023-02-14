FROM php:7.2-fpm

#PDO扩展
RUN docker-php-ext-install pdo_mysql
#mysqli扩展
RUN docker-php-ext-install mysqli
#redis 扩展
RUN pecl install redis && docker-php-ext-enable redis
#处理apt-get缓慢问题
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get clean
#GD库扩展
RUN apt-get update
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev
RUN docker-php-ext-install gd
#swoole扩展
RUN apt-get install -y openssl libssl-dev libcurl4-openssl-dev libc-ares-dev libc-ares2
RUN pecl install -D 'enable-sockets="no" enable-openssl="yes" enable-http2="yes" enable-mysqlnd="yes" enable-swoole-json="no" enable-swoole-curl="yes" enable-cares="yes"' https://pecl.php.net/get/swoole-4.8.11.tgz
RUN docker-php-ext-enable swoole
#其他扩展
RUN apt-get install -y libzip-dev zip
RUN docker-php-ext-install zip
#安装php composer
RUN curl -sS https://install.phpcomposer.com/installer | php \
  && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
#安装常用软件
RUN apt-get install -y vim
