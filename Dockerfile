FROM alpine:latest
MAINTAINER marvin.frick@sinnerschrader.com

RUN apk add --no-cache git g++ make cmake mariadb-dev boost-dev && \
    git clone --depth 1 https://github.com/cmangos/mangos-classic.git /tmp/c && \
    mkdir -p /tmp/c/build && \
    cd /tmp/c/build/ && \
    cmake .. && \
    cd src/realmd/ &&  \
    make -j2 && \
    make install && \
    cd / && \
    rm -rf /tmp/c && \
    apk del git g++ cmake

CMD realmd -c /etc/realmd/realmd.config
