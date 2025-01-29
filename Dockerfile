FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy

LABEL maintainer="lanjelin"

ENV TITLE=Nomachine-Kasm
ENV NOM_VERSION=8.16.1

RUN \
  echo "**** install packages ****" && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    wget && \
  echo "**** install nomachine ****" && \
  mkdir -p /app && \
  wget -q https://download.nomachine.com/download/${NOM_VERSION%.*}/Linux/nomachine_${NOM_VERSION}_1_x86_64.tar.gz -O /app/nomachine.tar.gz && \
  cd /app && \
  tar -xf nomachine.tar.gz && \
  /app/NX/nxserver --install && \
  echo "EnableClipboard both" >> /app/NX/etc/server.cfg && \
  sed -i 's|</applications>|  <application title="Nomachine-Kasm" type="normal">\n    <maximized>no</maximized>\n  </application>\n</applications>|' /etc/xdg/openbox/rc.xml && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /app/nomachine.tar.gz
# add local files
COPY /root /

# ports and volumes
EXPOSE 3000 3001

VOLUME /config
