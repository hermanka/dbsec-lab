FROM alpine:latest

ENV USERNAME="user" \
    PASSWORD="Passw0rd" \
    SUDO_OK="false" \
    AUTOLOGIN="true" \
    TZ="Etc/UTC"

COPY ./entrypoint.sh /
COPY ./mysqlstart.sh /etc/profile.d/
COPY ./skel/ /etc/skel

RUN apk update && \
    apk add --no-cache tini bash ttyd tzdata sudo nano mysql-client && \
    chmod 700 /entrypoint.sh && \
    chmod 755 /etc/profile.d/mysqlstart.sh && \
    touch /etc/.firstrun && \
    ln -s "/usr/share/zoneinfo/$TZ" /etc/localtime && \
    echo $TZ > /etc/timezone 

RUN apk add mariadb-connector-c-dev 

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/entrypoint.sh"]

EXPOSE 7681/tcp

# How to build n run
# docker build -t lab/client .
