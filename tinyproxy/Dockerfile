FROM alpine:latest
RUN apk --update --no-cache add tinyproxy
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf
EXPOSE 8080
CMD ["tinyproxy", "-d"]

