# cups
Common Unix Printing System (CUPS), is the most widely used printing system on Linux
systems. CUPS allows you to use, manage and share many printers on the network,
as it is designed as a client/server system.

This repository contains only build scripts for the CUPS daemon.

## Usage
To start cups directly over cli:

```bash
docker run \
  --detach \
  --env CUPS_ADMIN_USER=print \
  --env CUPS_ADMIN_PASSWD=print \
  --network=host \
  --volume /var/run/dbus:/var/run/dbus \
  --name cupsd \
  volkerraschek/cupsd
```

or if you want to use a `docker-compose.yml`

```yaml
version: '3'
services:
  cupsd:
    container_name: cupsd
    environment:
      - CUPS_ADMIN_USER=print
      - CUPS_ADMIN_PASSWD=print
    network_mode: host
    restart: always
    volumes:
      - /var/run/dbus:/var/run/dbus
```

After starting the container, cups is available over http://localhost:631