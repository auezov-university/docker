FROM mysql:latest

COPY ./my.cnf /etc/mysql/conf.d
COPY ./docker-entrypoint-initdb.d /docker-entrypoint-initdb.d

RUN ln -snf /usr/share/zoneinfo/Asia/Almaty /etc/localtime && echo Asia/Almaty > /etc/timezone && chown -R mysql:root /var/lib/mysql/

EXPOSE 3306