FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    bash \
    bc \
    binutils \
    bzip2 \
    cpio \
    g++ \
    gcc \
    git \
    gzip \
    locales \
    libncurses5-dev \
    libdevmapper-dev \
    libsystemd-dev \
    make \
    mercurial \
    whois \
    patch \
    perl \
    python3 \
    python3-pip \
    rsync \
    sed \
    tar \
    vim \
    file \
    unzip \
    wget \
    bison \
    flex \
    libssl-dev \
    libfdt-dev \
    cmake \
    ninja-build \
    pkg-config \
    libglib2.0-dev \
    libpixman-1-dev \
    libpython3-dev \
    squashfs-tools 

# Set locale
RUN locale-gen en_US.UTF-8

WORKDIR /root/buildroot

ENV O=/buildroot_output

RUN touch .config
RUN touch kernel.config

VOLUME /root/buildroot/dl
VOLUME /buildroot_output

CMD ["/bin/bash"]

RUN git config --global user.email "yasht3210@gmail.com"
RUN git config --global user.name "Yash Thakur"
