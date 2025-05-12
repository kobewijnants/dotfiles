FROM archlinux:latest
RUN pacman -Syu --noconfirm \
  curl wget git vim nano jq iproute2 iputils net-tools traceroute \
  tcpdump unzip tar gzip less procps-ng
