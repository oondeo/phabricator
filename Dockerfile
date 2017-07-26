FROM alpine:3.6
MAINTAINER Lyndon <snakeliwei@gmail.com>

RUN addgroup -S wwwgrp-phabricator && \
    adduser -S -G wwwgrp-phabricator PHABRICATOR && \
    apk add --no-cache \
            'su-exec>=0.2' \
            openssh \
            bash \
            libc6-compat \
            git \
            nginx \
            nodejs \
            nodejs-npm \
            php7 \
            php7-fpm \
            php7-mbstring \
            php7-mysqli \
            php7-curl \
            php7-pcntl \
            php7-gd \
            php7-openssl \
            php7-ldap \
            php7-fileinfo \
            php7-posix \
            php7-json \
            php7-iconv \
            php7-ctype \
            php7-zip \
            php7-sockets \
            php7-xmlwriter  \
            php7-opcache \
            php7-apcu \
            which \
            py3-pygments \
            subversion \
            mercurial \
            imagemagick \
            postfix \
            mariadb-client \
            vim \
            supervisor && \
     npm i -g ws 
    
EXPOSE 80 443 22 24
COPY baseline /baseline
RUN /baseline/setup.sh
COPY preflight /preflight
RUN /preflight/setup.sh
CMD ["/bin/bash", "/app/init.sh"]
