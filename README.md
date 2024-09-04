## PHP docker开发环境配置
php(72+74+81)+nginx+mysql+redis+rabbitmq

请先构建镜像 php72 php74 php81 rabbitmq 
再执行 docker-compose up -d

如果遇到 TLS timeout等问题
sudo vi /etc/docker/daemon.json

{
    "registry-mirrors": [
        "https://thjtcwuf.mirror.aliyuncs.com",
        "https://docker.mirrors.ustc.edu.cn/",
        "https://mirror.ccs.tencentyun.com",
        "https://dockerhub.azk8s.cn",
        "https://registry.docker-cn.com"
    ],
    "max-concurrent-downloads": 1,
    "experimental": false,
    "features": {
        "buildkit": false
    }
}

如果镜像拉取超时，可以尝试 手动拉取 在buildcd 
docker pull php:7.2-fpm

