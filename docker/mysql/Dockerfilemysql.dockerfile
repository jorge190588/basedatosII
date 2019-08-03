FROM alpine:3.7
# MAINTAINER WangXian <xian366@126.com>

WORKDIR /app
VOLUME /app
COPY bd/startup.sh /startup.sh

RUN apk add --update bash
RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*
COPY bd/my.cnf /etc/mysql/my.cnf

EXPOSE 3306
CMD  ["/startup.sh"]

# https://github.com/wangxian/alpine-mysql
# https://docs.docker.com/samples/library/mysql/#docker-secrets