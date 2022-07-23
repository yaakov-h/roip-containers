FROM debian:bullseye-slim

ENTRYPOINT [ "/startup.sh" ]

RUN set +x \
    && apt update && apt upgrade -y \
    && apt install -y gettext-base libsndfile1 libasound2 tcpdump

COPY startup.sh startup.sh
COPY src /
