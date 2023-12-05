FROM alpine:latest

RUN apk --update --no-cache add nginx
RUN apk --update --no-cache add apache2-utils

RUN mkdir -p /run/nginx

COPY nginx.conf /etc/nginx/nginx.tmpl
COPY start.sh /usr/local/bin/start_nginx.sh

RUN chmod +x /usr/local/bin/start_nginx.sh

EXPOSE 8080

CMD ["/usr/local/bin/start_nginx.sh"]
