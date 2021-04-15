FROM	alpine:3.12

RUN		apk add mariadb mariadb-client supervisor
		# telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
RUN		mkdir -p /run/mysqld/

COPY	./srcs/supervisor.conf /etc/supervisord.conf
# COPY 	./srcs/telegraf.conf /etc/telegraf/
COPY	./srcs/my.cnf			/etc/
# COPY	./srcs/wordpress.sql		/
COPY	./srcs/setup_database.sh		/

EXPOSE 3306

VOLUME ["var/lib/mysql"]

ENTRYPOINT	sh setup_database.sh