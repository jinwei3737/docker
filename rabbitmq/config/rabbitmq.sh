#创建用户（安全原因rabbitmq 不允许 guest用户操作）
#设置用户为admin角色
#设置权限
rabbitmq-server -detached \
&& sleep 5s \
&& rabbitmqctl add_user root admin123 \
&& rabbitmqctl add_vhost / \
&& rabbitmqctl set_permissions -p / root ".*" ".*" ".*" \
&& rabbitmqctl set_user_tags root administrator \
&& tail -f /dev/null