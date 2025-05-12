FROM fedora:latest
RUN dnf install -y \
  curl wget git vim nano jq iproute iputils \
  bind-utils net-tools traceroute tcpdump unzip tar gzip less procps-ng \
  && dnf clean all
