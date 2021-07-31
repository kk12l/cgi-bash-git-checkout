FROM alpine

RUN apk --update add git less openssh-client busybox-extras && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY index.sh /www/cgi-bin/
WORKDIR /www

VOLUME /git

EXPOSE 80

ENTRYPOINT ["httpd", "-f", "-v"]
