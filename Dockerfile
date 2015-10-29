FROM alpine:3.2
MAINTAINER Irakli Nadareishvili

ENV VERSION=v0.12.7
# ENV VERSION=v4.2.1

ENV REFRESHED_AT 2015-10-28-10_30EST

RUN apk upgrade --update \
 && apk add curl make gcc g++ linux-headers paxctl musl-dev \
    libgcc libstdc++ python openssl-dev zlib-dev \
 && mkdir -p /root/src \
 && cd /root/src \    
 && curl -sSL https://nodejs.org/dist/${VERSION}/node-${VERSION}.tar.gz | tar -xz \
 && cd /root/src/node-* \
 && ./configure --prefix=/usr \
 && make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
 && make install \
 && paxctl -cm /usr/bin/node \
 && npm install -g npm \
 && npm cache clean \
 && apk del make gcc g++ python linux-headers \
 && rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
    /root/.npm /root/.node-gyp /usr/lib/node_modules/npm/man \
		/usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html \
 && apk search --update
