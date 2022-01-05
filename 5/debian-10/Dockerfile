FROM bitnami/wordpress-nginx
LABEL maintainer "Kirk Yuknis <kirkland@yuknis.com>"

## Change user to perform privileged actions
USER 0

## Install 'PhpRedis'
RUN install_packages gcc make autoconf libc-dev pkg-config wget
RUN wget https://pecl.php.net/get/redis-5.3.5.tgz
RUN tar xzf redis-5.3.5.tgz
WORKDIR /redis-5.3.5
RUN phpize
RUN ./configure
RUN make
RUN make install
RUN echo extension=redis.so >> /opt/bitnami/php/etc/php.ini
RUN apt-get remove --purge --yes gcc make autoconf libc-dev pkg-config wget

COPY /rootfs/opt/yuknis /opt/
ENV PHP_SESSION_SAVE_HANDLER=files \
    PHP_SESSION_SAVE_PATH=\/opt\/bitnami\/php\/var\/run\/session

EXPOSE 8080 8443

USER 1001
ENTRYPOINT [ "/opt/yuknis/scripts/setCustomSession.sh" ]
CMD [ "/opt/yuknis/scripts/defaultBehavior.sh" ]