# Docker files for ProcessWire

These files is a base structure for [ProcessWire](https://processwire.com)
projects using [Docker](https://www.docker.com/).

## Setup

For starting the project use

`$ docker-compose up -d`

A new `Apache` and `MariaDB` instance will start.

Configure your `ProcessWire` files in `pw` directory. You can copy
files from a existing project or install a fresh copy.

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

For changing *PHP* settings go to *docker/processwire/init.sh* and then rebuild
the containers.

## Local host

Once `Docker` is running you can access `ProcessWire` by going to localhost
in your browser. `127.0.0.1`. Is recommended that you edit your `hosts` file
to add a [custom domain](https://www.howtogeek.com/howto/27350/beginner-geek-how-to-edit-your-hosts-file/).

If you want to use another port (default is 80) you must change it in the `docker-compose.yaml` file.

```yml
ports:
    # local port : docker port
    - 80:80
```

## Other Resources

- [https://processwire.com/talk/topic/10736-running-a-processwire-site-with-docker/](https://processwire.com/talk/topic/10736-running-a-processwire-site-with-docker/)

- [https://github.com/raleerg/docker-processwire](https://github.com/raleerg/docker-processwire)

- [https://github.com/undernewmanagement/processwire-docker-compose](https://github.com/undernewmanagement/processwire-docker-compose)