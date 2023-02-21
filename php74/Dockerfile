FROM php:7.4-fpm

#PDO扩展
RUN docker-php-ext-install pdo_mysql
#mysqli扩展
RUN docker-php-ext-install mysqli
#sockets扩展（rabbitmq 依赖）
RUN docker-php-ext-install sockets
#redis 扩展
RUN pecl install redis && docker-php-ext-enable redis
#处理apt-get缓慢问题
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN sed -i s@/security.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get clean
#GD库扩展
RUN apt-get update
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev
RUN docker-php-ext-install gd
#swoole扩展 php7 最高支持 swoole4.8 / 使用本地包以解决联通网络下https://pecl.php.net/package/swoole下载慢的问题
RUN apt-get install -y openssl libssl-dev libcurl4-openssl-dev libc-ares-dev libc-ares2
COPY ./swoole-4.8.12.tgz /var/www/html/swoole-4.8.12.tgz
RUN pecl install -D 'enable-sockets="no" enable-openssl="yes" enable-http2="yes" enable-mysqlnd="yes" enable-swoole-json="no" enable-swoole-curl="yes" enable-cares="yes"' /var/www/html/swoole-4.8.12.tgz
RUN docker-php-ext-enable swoole
#其他扩展
RUN apt-get install -y libzip-dev zip
RUN docker-php-ext-install zip
#安装rabbitmq扩展
RUN apt-get install -y wget cmake
RUN wget https://github.com/alanxz/rabbitmq-c/archive/refs/tags/v0.13.0.tar.gz  \
    && wget https://pecl.PHP.net/get/amqp-1.11.0.tgz
RUN tar -zxvf v0.13.0.tar.gz  \
    && cd rabbitmq-c-0.13.0  \
    && mkdir build  \
    && cd build  \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr/local/rabbitmq-c ..  \
    && make && make install \
    && ln -s /usr/local/lib64 /usr/local/lib \
    && cd ../../
RUN tar -zxvf amqp-1.11.0.tgz  \
    && cd amqp-1.11.0  \
    && /usr/local/bin/phpize  \
    && ./configure --with-PHP-config=/usr/local/bin/PHP-config --with-amqp --with-librabbitmq-dir=/usr/local/rabbitmq-c  \
    && make && make install \
    && cd -
RUN docker-php-ext-enable amqp.so
#安装php composer
RUN curl -sS https://install.phpcomposer.com/installer | php \
  && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
#安装常用软件
RUN apt-get install -y vim git
