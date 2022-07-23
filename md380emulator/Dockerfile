FROM debian:bullseye-slim AS builder

COPY src /src

RUN set +x \
 && apt-get update && apt-get upgrade -y \
 && apt-get install -y curl bc binutils-arm-linux-gnueabi bison build-essential flex gcc-arm-linux-gnueabihf libc6-armel-cross libc6-dev-armel-cross unzip libncurses5-dev libssl-dev python./run wget \
 && cd /src/emulator \
 && make all

FROM alpine

RUN set +x \
 && apk update --no-cache && apk upgrade --no-cache \
 && apk add --no-cache qemu-arm tcpdump
COPY --from=builder /src/emulator/md380-emu /bin/md380-emu

CMD qemu-arm /bin/md380-emu -S 2470