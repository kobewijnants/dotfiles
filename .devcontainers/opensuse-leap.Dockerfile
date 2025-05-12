FROM opensuse/leap:latest
RUN zypper --non-interactive install \
  curl wget git vim nano jq iproute2 iputils \
  bind-utils net-tools traceroute tcpdump unzip tar gzip less procps \
  && zypper clean
