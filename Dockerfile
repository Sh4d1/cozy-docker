FROM golang:1.9 as builder

RUN apt-get update && apt-get --no-install-recommends -y install \
        ca-certificates \
        curl \
        net-tools \
        nginx \
        sudo \
        vim-tiny \
        build-essential \
        pkg-config \
        erlang \
        libicu-dev \
        libmozjs185-dev \
        libcurl4-openssl-dev \
        git && apt-get clean

RUN go get -u github.com/cozy/cozy-stack

RUN echo $GOPATH

FROM debian:stretch

COPY --from=0 /go/bin/cozy-stack /usr/bin
COPY ./cozy.yml /cozy.yml
COPY ./start.sh /start.sh

RUN apt-get update && apt-get --no-install-recommends -y install \
        git \
        ca-certificates \
        curl \
        net-tools \
        libcurl4-openssl-dev \
        && apt-get clean


