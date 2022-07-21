FROM alpine

ENTRYPOINT [ "/startup.sh" ]

RUN set +x \
    && apk update && apk upgrade \
    && apk add --no-cache coreutils gettext openssl tcpdump yq

COPY startup.sh startup.sh
COPY src /

# # RUN penssl 

# RUN set +x \
#  && apk --no-cache update && apk --no-cache upgrade \
#  && apk --no-cache add tcpdump bash \
#  && mkdir -p /var/log/dvswitch
# COPY /Analog_Reflector/opt/Analog_Reflector /app
# COPY startup /startup

# CMD /startup