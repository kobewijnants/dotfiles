FROM ubuntu:24.04
RUN apt-get update && apt-get install -y \
  curl wget git vim nano jq iproute2 iputils-ping \
  dnsutils net-tools traceroute tcpdump unzip tar gzip less procps \
  && apt-get clean
