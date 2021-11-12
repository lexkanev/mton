FROM nvidia/cuda:11.4.2-base-ubuntu18.04

LABEL maintainer=lexkanev@gmail.com \
      vendor=no

ENV DEBIAN_FRONTEND="noninteractive"

SHELL ["/bin/bash", "-c"]

RUN apt-get update \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
         openssh-server \
         git \
         locales \
         rsync \
         curl \
         wget \
         iputils-ping \
         telnet \
         screen \
         nano \
         sudo \
         apt-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ARG TINI_VERSION=v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/local/bin/tini

ADD https://github.com/tontechio/pow-miner-gpu/releases/download/20211112-1/minertools-cuda-ubuntu-18.04-x86-64.tar.gz /opt/

ADD https://newton-blockchain.github.io/global.config.json /opt/

RUN apt-get update \
    && cd /opt/ \
    && tar -xzvf minertools-cuda-ubuntu-18.04-x86-64.tar.gz \
    && chmod -R +x /opt

RUN rm -rf \
      /var/cache/debconf \
      /tmp/*

WORKDIR /tmp

USER 0

CMD ["/bin/sh", "-c", "exit 0"]

