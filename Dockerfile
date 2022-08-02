FROM ubuntu:jammy

ARG DEBIAN_FRONTEND=noninteractive

# Main program and required packages.
RUN \
  apt-get update && \
  apt-get install -y \
    ca-certificates \
    locales \
    locales-all \
    neomutt \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/

RUN \
  mkdir --verbose --parents \
    ~/.cache/mutt/headers \
    ~/.cache/mutt/bodies

# Viewers, browsers, editors and other auxiliary tools.
RUN \
  apt-get update && \
  apt-get install -y \
    aview \
    bat \
    caca-utils \
    curl \
    links2 \
    nano \
    timg \
    vim \
    w3m \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/

# Install 'urlscan' for extracting URLs from messages.
RUN \
  apt-get update && \
  apt-get install -y \
    python3 \
    python3-pip \
  && \
  pip install --no-cache urlscan \
  && \
  curl --silent --show-error --location \
    https://github.com/sunaku/home/raw/master/bin/yank \
    --output /usr/local/bin/yank && \
  chmod --verbose +x /usr/local/bin/yank \
  && \
  apt-get purge -y --autoremove python3-pip && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/
