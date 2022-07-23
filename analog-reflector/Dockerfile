FROM alpine

ENTRYPOINT [ "/startup.sh" ]

RUN set +x \
    && apk update && apk upgrade \
    && apk add --no-cache coreutils gettext openssl tcpdump yq

COPY startup.sh startup.sh
COPY src /
