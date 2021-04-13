FROM alpine:3.12

RUN apk add mariadb mariadb-client supervisor

COPY ./srcs/my.cnf			/etc/
RUN mkdir -p /run/mysqld/

COPY /srcs/setup_database.sh .
# RUN chmod 777 /srcs/setup_database.sh
CMD sh setup_database.sh