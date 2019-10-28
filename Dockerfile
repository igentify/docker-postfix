FROM ubuntu:19.10
LABEL MAINTAINER="Elliott Ye"

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# Start editing
# Install package here for cache
RUN apt-get update && apt-get -y install supervisor \
    postfix sasl2-bin opendkim \
    opendkim-tools \
    zlib1g && rm -rf /var/lib/apt/lists/* 

# Add files
COPY assets/install.sh /opt/install.sh

# Run
CMD /opt/install.sh;/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
