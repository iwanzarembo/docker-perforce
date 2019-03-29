FROM ubuntu:18.04

LABEL maintainer="Iwan Zarembo <iwan.zarembo@sap.com>"

# let the system choose default answers.
# See http://manpages.ubuntu.com/manpages/bionic/man7/debconf.7.html#frontends
ENV DEBIAN_FRONTEND noninteractive

# Install the required tools
RUN apt-get update && apt-get install -y wget gnupg2 curl && \
    # Add perforce packages
    wget -q http://package.perforce.com/perforce.pubkey -O - | apt-key add - && \
    echo 'deb http://package.perforce.com/apt/ubuntu bionic release' > /etc/apt/sources.list.d/perforce.sources.list && \
    # Install the perforce server
    apt-get update && apt-get install -y helix-p4d=2018.2-1751184~bionic && \
    # clean temporary files
    rm -rf /var/log/* && \
    rm -rf /var/lib/apt/lists/*

# Volumes for server roots and triggers
VOLUME /opt/perforce/servers
VOLUME /opt/perforce/triggers

# Add startup file and run it by default
COPY run.sh /
CMD ["/run.sh"]
