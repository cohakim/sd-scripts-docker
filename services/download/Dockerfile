FROM bash:alpine3.15

RUN --mount=type=cache,target=/var/cache/apk \
    apk add git git-lfs
COPY . /docker
RUN chmod +x /docker/download.sh
ENTRYPOINT ["/docker/download.sh"]
