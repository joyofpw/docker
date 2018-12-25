# Docker files for ProcessWire

These files is a base structure for [ProcessWire](https://processwire.com)
projects using [Docker](https://www.docker.com/).

## Setup

For starting the project use

`$ docker-compose up -d`

A new `Apache` and `MariaDB` instance will start.

Configure your `ProcessWire` files in `pw` directory.

## Database Credentials (Dev Environment)

Use these credentials in `ProcessWire` configuration.

- *user*: `docker`
- *password* : `docker`
- *database* : `docker`
- *host* : `172.23.0.3`
- *port* `3306`

For accesing db using an external tool like [Sequel Pro](https://www.sequelpro.com/) or [HeidiSQL](https://www.heidisql.com/).

- *user*: `docker`
- *password* : `docker`
- *database* : `docker`
- *host* : `127.0.0.1`
- *port* `3306`

For changing PHP settings go to *docker/processwire/init.sh* and then rebuild
the containers.