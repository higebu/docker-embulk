FROM alpine:latest

RUN apk --update add openjdk7-jre openssl \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /usr/local/ssl \
    && cd /usr/local/ssl \
    && wget http://curl.haxx.se/ca/cacert.pem

ENV SSL_CERT_FILE /usr/local/ssl/cacert.pem

RUN wget http://dl.embulk.org/embulk-latest.jar -O /usr/local/bin/embulk \
    && chmod +x /usr/local/bin/embulk \
    && embulk gem install embulk-input-mysql embulk-output-elasticsearch

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
