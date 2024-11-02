FROM haproxy:latest

#先用root用户更新 否则会有权限问题
USER root
RUN apt-get update
RUN apt-get install -y curl vim telnet

#切回 haproxy 用户
USER haproxy


