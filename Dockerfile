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
    libpython3-dev

# Set locale
RUN locale-gen en_US.UTF-8

RUN git clone git://git.buildroot.net/buildroot --depth=1 --branch=2024.08 /root/buildroot

WORKDIR /root/buildroot

ENV O=/buildroot_output

RUN touch .config
RUN touch kernel.config

VOLUME /root/buildroot/dl
VOLUME /buildroot_output

CMD ["/bin/bash"]

RUN echo "\n" >> /root/buildroot/package/Config.in
RUN echo "menu \"RIDEOS\"" >> /root/buildroot/package/Config.in
RUN echo "        source \"/buildroot_output/rideosqt/Config.in\"" >> /root/buildroot/package/Config.in
RUN echo "endmenu" >> /root/buildroot/package/Config.in

RUN git config --global user.email "yasht3210@gmail.com"
RUN git config --global user.name "Yash Thakur"