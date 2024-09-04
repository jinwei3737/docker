FROM php:8.1-fpm

# 更新包管理器并安装必要的依赖
RUN apt-get update && apt-get install -y \
    libz-dev \
    libpq-dev \
    libpcre3-dev \
    gcc \
    make \
    autoconf \
    unzip \
    curl

#GD库扩展
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev
RUN docker-php-ext-install gd

# 安装 Mysql PDO 扩展
RUN er-php-ext-install pdo pdo_mysql

# 安装 Redis 扩展
RUN pecl install redis && docker-php-ext-enable redis

# 安装 Swoole 扩展 php7 最高支持 swoole4.8
RUN pecl install -D 'enable-sockets="no" enable-openssl="yes" enable-http2="yes" enable-mysqlnd="yes" enable-swoole-json="no" enable-swoole-curl="yes" enable-cares="yes"' swoole && docker-php-ext-enable swoole

# 安装 Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#其他扩展
RUN apt-get install -y libzip-dev zip
RUN docker-php-ext-install zip

#安装常用软件
RUN apt-get install -y vim git

# 清理包管理器缓存
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# 暴露 PHP-FPM 的默认端口
EXPOSE 9000

# 设置容器启动时的默认命令
CMD ["php-fpm"]
