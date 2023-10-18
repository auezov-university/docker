FROM mysql:latest

RUN ln -snf /usr/share/zoneinfo/Asia/Almaty /etc/localtime && echo Asia/Almaty > /etc/timezone && chown -R mysql:root /var/lib/mysql/

EXPOSE 3306