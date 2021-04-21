
FROM	alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add supervisor influxdb && \
	apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY    ./srcs/supervisor.conf /etc/supervisord.conf
COPY	./srcs/telegraf.conf /etc/
COPY	./srcs/start.sh /

VOLUME ["/var/lib/influxdb"]

EXPOSE	8086

ENTRYPOINT sh start.sh