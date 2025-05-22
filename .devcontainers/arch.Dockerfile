FROM archlinux:latest

# Update system and install required packages
RUN pacman -Syu --noconfirm \
    base-devel \
    curl wget git vim nano jq iproute2 iputils net-tools traceroute \
    tcpdump unzip tar gzip less procps-ng \
    && pacman -Scc --noconfirm

# Add a non-root user (required for makepkg)
RUN useradd -m builder && echo 'builder ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER builder
WORKDIR /home/builder

# Clone and install yay
RUN git clone https://aur.archlinux.org/yay.git \
    && cd yay \
    && makepkg -si --noconfirm

# Optionally return to root user
USER root
WORKDIR /root
