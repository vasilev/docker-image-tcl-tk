# Based on ideas from https://github.com/mdouchement/docker-zoom-us
FROM ubuntu

LABEL org.opencontainers.image.source https://github.com/vasilev/docker-image-tcl-tk

RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y sudo tk \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
