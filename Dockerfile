FROM ubuntu:16.04

MAINTAINER Nhat Duong <duongn@email.chop.edu>

RUN apt-get update && apt-get install -y bzip2 gcc g++ make python zlib1g-dev wget


# set environment
ENV MANTA_VERSION=1.5.0

# install manta

RUN wget https://github.com/Illumina/manta/releases/download/v${MANTA_VERSION}/manta-${MANTA_VERSION}.release_src.tar.bz2 \
 && tar -xjf manta-${MANTA_VERSION}.release_src.tar.bz2 \
 && mkdir build \
 && cd build \
 && ../manta-${MANTA_VERSION}.release_src/configure --jobs=4 --prefix=/bin \
 && make -j4 install


