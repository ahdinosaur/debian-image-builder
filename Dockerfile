FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive
ARG VMDB2_SOURCE=http://git.liw.fi/vmdb2/snapshot/vmdb2-f47e49ebfd6bcda2e20e3251ef9bdf96016f8164.tar.gz

RUN apt-get -y update && \
    apt-get -y install \
      curl \
      qemu-user-static qemu-utils \
      dosfstools \
      cmdtest debhelper debootstrap cmdtest kpartx pandoc parted \
      python3-cliapp python3-jinja2 python3-yaml \
      && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN cd /app && \
  mkdir vmdb2 && \
  cd vmdb2 && \
  curl "${VMDB2_SOURCE}" | tar xvfz - --strip-components=1

ENV PATH "/app/vmdb2:${PATH}"

COPY ./build /app/

VOLUME ["/app/input", "/app/output"]
