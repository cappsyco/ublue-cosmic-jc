FROM ghcr.io/ublue-os/cosmic:41-amd64

COPY build.sh /tmp/build.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
