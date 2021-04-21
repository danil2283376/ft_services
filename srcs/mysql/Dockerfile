# FROM alpine:3.12

# RUN apk update && apk upgrade
# RUN	apk add mysql mysql-client mariadb mariadb-common mariadb-client supervisor sudo

# RUN mkdir -p /run/mysqld/
# COPY ./srcs/my.cnf /etc/my.cnf
# COPY ./srcs/scr_mysql.sh .
# EXPOSE 3306
# RUN sudo chmod -R 755 /var/lib/mysql/
# RUN chmod +x scr_mysql.sh
# VOLUME ["/var/lib/mysql"]
# CMD ["./scr_mysql.sh"]
FROM	alpine:3.12

RUN		apk add mariadb mariadb-client supervisor\
		telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
		mkdir -p /run/mysqld/

COPY	./srcs/supervisor.conf /etc/supervisord.conf
COPY 	./srcs/telegraf.conf /etc/telegraf/
COPY	./srcs/my.cnf			/etc/
COPY	./srcs/wordpress.sql		/
COPY	./srcs/scr_mysql.sh		/

EXPOSE 3306

VOLUME ["var/lib/mysql"]

ENTRYPOINT	sh scr_mysql.sh