FROM alpine:latest

RUN apk --update add git less openssh-client busybox-extras && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

RUN git config --global --add safe.directory /git

COPY index.sh /www/cgi-bin/
WORKDIR /www

VOLUME /git

EXPOSE 80

ENTRYPOINT ["httpd", "-f", "-v"]
