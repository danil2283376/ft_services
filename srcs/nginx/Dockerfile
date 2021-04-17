# FROM alpine:3.12

# RUN apk update && apk upgrade
# RUN apk add nginx openssl

# RUN mkdir -p /run/nginx
# COPY ./srcs/nginx-localhost /etc/nginx/conf.d/default.conf

# COPY ./srcs/start_server.sh .
# RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=scolen/CN=localhost"

# EXPOSE 80 443
# CMD sh start_server.sh
FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor\
    telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN mkdir -p /run/nginx
#COPY NGINX-CONFIG
COPY ./srcs/telegraf.conf /etc/telegraf/
COPY ./srcs/nginx-localhost /etc/nginx/conf.d/default.conf
COPY ./srcs/supervisord.conf /etc/supervisord.conf

#openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt  -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=scolen/CN=localhost"

#start
COPY ./srcs/start_server.sh .
EXPOSE 80 443 22
RUN chmod +x start_server.sh
ENTRYPOINT ./start_server.sh