
# FROM	alpine:3.12

# RUN apk update
# RUN apk upgrade
# RUN apk add supervisor influxdb && \
# 	apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# COPY    ./srcs/supervisor.conf /etc/supervisord.conf
# RUN		mkdir ./etc/telegraf 
# RUN 	telegraf -sample-config telegraf.conf --input-filter cpu:mem:exec --output-filter influxdb > telegraf.conf
# COPY	./srcs/telegraf.conf /etc/telegraf/telegraf.conf
# COPY	./srcs/start.sh /

# VOLUME ["/var/lib/influxdb"]

# EXPOSE	8086

# ENTRYPOINT sh start.sh

FROM	alpine:3.12

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update
RUN apk add influxdb
RUN apk add openrc
RUN apk add telegraf

RUN openrc
RUN touch /run/openrc/softlevel

COPY	./srcs/telegraf.conf /etc/
COPY	./srcs/start.sh /

VOLUME ["/var/lib/influxdb"]

EXPOSE	8086

ENTRYPOINT sh start.sh