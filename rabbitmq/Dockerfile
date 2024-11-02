FROM rabbitmq:3-management

RUN apt-get update
RUN apt-get install -y curl vim apt-utils telnet

# 启用 RabbitMQ 的管理插件
RUN rabbitmq-plugins enable --offline rabbitmq_management

# 暴露端口
EXPOSE 5672 15672
#-----------------------------------------------------

