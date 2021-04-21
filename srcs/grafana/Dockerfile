FROM alpine:3.12

# RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
# RUN apk update
# RUN apk upgrade
# RUN apk add sudo openrc vim wget supervisor telegraf grafana

RUN apk update
RUN apk upgrade
RUN apk add sudo openrc vim wget supervisor \
    telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# RUN openrc
# RUN touch /run/openrc/softlevel

RUN wget https://dl.grafana.com/oss/release/grafana-7.4.0.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.4.0.linux-amd64.tar.gz
RUN rm -rf grafana-7.4.0.linux-amd64.tar.gz

RUN apk --no-cache add ca-certificates wget
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN apk add glibc-2.28-r0.apk

COPY ./srcs/supervisor.conf /etc/supervisord.conf
# COPY ./srcs/grafana.db /grafana-7.4.0/data/grafana.db
COPY ./srcs/telegraf.conf /etc/telegraf/
COPY ./srcs/start_grafana.sh /
RUN ln -s grafana-7.4.0/bin/grafana-server ./grafana-server
# RUN chmod +x tmp/start.sh

# COPY ./srcs/supervisor.conf /etc/supervisord.conf
# # COPY ./srcs/grafana.ini /etc/
# # COPY ./srcs/datasource.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
# # COPY ./srcs/dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml
# COPY ./srcs/telegraf.conf /etc/
# # COPY ./srcs/default.json /usr/share/grafana/public/dashboards/
# COPY ./srcs/start_grafana.sh .
# RUN chmod 777 start_grafana.sh
EXPOSE 3000

# CMD start.sh
ENTRYPOINT sh start_grafana.sh