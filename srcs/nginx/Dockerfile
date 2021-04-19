FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor\
    telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN adduser -D turn
RUN echo "turn:qwerty" | chpasswd

RUN mkdir -p /run/nginx
#COPY NGINX-CONFIG
COPY ./srcs/telegraf.conf /etc/telegraf/
COPY ./srcs/nginx-localhost /etc/nginx/conf.d/default.conf
COPY ./srcs/supervisord.conf /etc/supervisord.conf

#openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt  -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=scolen/CN=localhost"

#start
COPY ./srcs/scr_nginx.sh .
EXPOSE 80 443 22
RUN chmod +x scr_nginx.sh
ENTRYPOINT sh scr_nginx.sh