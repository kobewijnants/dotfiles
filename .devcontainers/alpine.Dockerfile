FROM alpine:latest
RUN apk add --no-cache \
  curl wget git vim nano jq iproute2 iputils busybox-extras \
  bind-tools net-tools tcpdump unzip tar gzip less procps
