# Base-Image
FROM ubuntu:18.04

# Environment
ENV CUPS_ADMIN_USER=print
ENV CUPS_ADMIN_PASSWD=print

# Labels
LABEL maintainer="Markus Pesch"

# Non-Interactive
ENV DEBIAN_FRONTEND="noninteractive"

# Software installation
RUN apt-get update && \
    apt-get upgrade --yes && \
    apt-get install --yes \
      sudo \
      cups \
      cups-client \
      cups-bsd \
      cups-filters \
      foomatic-db-compressed-ppds \
      printer-driver-all \
      openprinting-ppds \
      hpijs-ppds \
      hp-ppd \
      hplip && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh"]