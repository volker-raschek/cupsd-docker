#!/bin/bash

set -e

useradd \
  --groups=sudo,lp,lpadmin \
  --create-home \
  --home-dir=/home/${CUPS_ADMIN_USER} \
  --shell=/bin/bash \
  ${CUPS_ADMIN_USER}

echo "${CUPS_ADMIN_USER}:${CUPS_ADMIN_PASSWD}" | chpasswd

sed --in-place '/%sudo[[:space:]]/ s/ALL[[:space:]]*$/NOPASSWD:ALL/' /etc/sudoers