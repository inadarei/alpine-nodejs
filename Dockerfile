FROM alpine:3.2

ENV VERSION=v0.12.7
# ENV VERSION=v4.2.1

RUN apk add --update curl make gcc g++ python linux-headers paxctl \
    libgcc libstdc++ musl-dev openssl-dev zlib-dev \
 && mkdir -p /root/src \
 && cd /root/src \    
 && curl -sSL https://nodejs.org/dist/${VERSION}/node-${VERSION}.tar.gz | tar -xz \
 && cd /root/src/node-* \
 && ./configure --prefix=/usr \
 && make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
 && make install \
 && paxctl -cm /usr/bin/node \
 && npm i -g npm \
 && npm cache clean \
 && apk del curl make gcc g++ python linux-headers paxctl \
 && rm -rf /root/src \
    /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html
