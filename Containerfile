FROM ghcr.io/ublue-os/cosmic:41-amd64

COPY build.sh /tmp/build.sh
COPY packages.txt /tmp/packages.txt
COPY system_files /tmp/system_files

RUN cp -R /tmp/system_files/* /
RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
    
