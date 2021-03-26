FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl

COPY ./srcs/nginx-localhost /etc/nginx/conf.d/default.conf

RUN mkdir -p /run/nginx
COPY ./nginx/start_server.sh .
RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=scolen/CN=localhost"

EXPOSE 80 443
CMD sh start_server.sh