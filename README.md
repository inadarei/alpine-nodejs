# alpine-nodejs

[![Docker Hub Link][docker-img]][docker-url]

Tiny, Alpine Linux-based Nodejs Container for Docker.

Compare 50MB of this container with typical 500MB to 800MB sizes you get with Ubuntu- or CentOS-based images.

### Runit

If you need runit (e.g. for cron, syslog etc.) there's a related project that provides additional support for runit: https://hub.docker.com/r/irakli/alpine-nodejs-runit/

## Adding More Packages (if needed)

If you need more packages installed (e.g. make, gcc for compiling some native Node modules, or imagemagick etc.) base your new container on this one and you can use `apk` package manager that Alpine provides. For instance:

```
apk search --update imagemagick
```

or:

```
apk add --update make gcc g++ python linux-header
```

## License

[MIT](LICENSE)

[docker-img]: https://img.shields.io/badge/docker-ready-blue.svg
[docker-url]: https://hub.docker.com/r/irakli/alpine-nodejs/

