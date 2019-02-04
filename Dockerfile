FROM alpine:3.9

# Version of Helm & Tiller to install
ARG VERSION=2.12.3

# Distribution to use
ARG DIST=linux-amd64

ENV BASE_URL="https://storage.googleapis.com/kubernetes-helm"
ENV TAR_FILE="helm-v${VERSION}-${DIST}.tar.gz"

RUN apk add --update --no-cache curl ca-certificates && \
    curl -L ${BASE_URL}/${TAR_FILE} |tar xvz && \
    mv ${DIST}/helm /usr/bin/helm && \
    mv ${DIST}/tiller /usr/bin/tiller && \
    chmod +x /usr/bin/helm && \
    chmod +x /usr/bin/tiller && \
    rm -rf ${DIST} && \
    apk del curl && \
    rm -f /var/cache/apk/*

ENTRYPOINT ["helm"]
CMD ["--help"]
