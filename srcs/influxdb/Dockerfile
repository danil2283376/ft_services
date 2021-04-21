
FROM	alpine:3.12

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update
RUN apk add influxdb
RUN apk add openrc
RUN apk add telegraf

RUN openrc
RUN touch /run/openrc/softlevel

COPY ./srcs/supervisor.conf /etc/supervisord.conf
COPY	./srcs/telegraf.conf /etc/
COPY	./srcs/start.sh /

VOLUME ["/var/lib/influxdb"]

EXPOSE	8086

ENTRYPOINT sh start.sh