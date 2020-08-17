# Docker files for ProcessWire

These files is a base structure for [ProcessWire](https://processwire.com)
projects using [Docker](https://www.docker.com/).

This is a **testing** environment docker configuration tailored for *ProcessWire*. If you want to use it in production you must properly check security and other configurations.

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
- *host* : `db` (You could also use just the ip)
- *port* `3306`

For accesing db using an external tool like [Sequel Pro](https://www.sequelpro.com/) or [HeidiSQL](https://www.heidisql.com/).

- *user*: `docker`
- *password* : `docker`
- *database* : `docker`
- *host* : `127.0.0.1`
- *port* `3306`

### Important

Always **backup** your database sql because you may loose your data if you *prune your containers*.

### Known Issues

This issues may ocur if the docker container was incorrectly stopped or pruned and restarted.

When starting database could fail. Delete the file `tc.log`.

When importing sql may show `Error : Tablespace for table xxxx exists. Please DISCARD the tablespace before IMPORT.`. Search for `*.idb` files without it's matching `*.frm` file. Move those `idb` files to another directory or delete them.

## PHP

For changing *PHP* settings go to [`docker/processwire/init.sh`](/docker/processwire/init.sh) and then rebuild
the containers. For installing additional modules change the [`docker/processwire/Dockerfile`](/docker/processwire/Dockerfile).

- Default timezone *America/Santiago*.

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

## Docker Commands

- `docker-compose up -d` : Starts the containers
- `docker ps`: Show the running containers
- `docker kill <container id>`: Kills a container
- `docker network prune`: Reset the network
- `docker container prune`: Resets the stopped containers

## Other Resources

- [https://processwire.com/talk/topic/10736-running-a-processwire-site-with-docker/](https://processwire.com/talk/topic/10736-running-a-processwire-site-with-docker/)

- [https://github.com/raleerg/docker-processwire](https://github.com/raleerg/docker-processwire)

- [https://github.com/undernewmanagement/processwire-docker-compose](https://github.com/undernewmanagement/processwire-docker-compose)



Made with <i class="fa fa-heart">&#9829;</i> by <a href="https://ninjas.cl" target="_blank">Ninjas.cl</a>.
