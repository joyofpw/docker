# Docker files for ProcessWire

These files is a base structure for [ProcessWire](https://processwire.com)
projects using [Docker](https://www.docker.com/).

This is a **testing** environment docker configuration tailored for *ProcessWire*. 
If you want to use it in production you must properly check security and other configurations.

## Setup

For starting the project use

```sh
$ docker compose up -d --build
```

A new `Apache` and `MariaDB` instance will start.

Configure your `ProcessWire` files in `public` directory. You can copy
files from a existing project or install a fresh copy.

## Dev Environment

Create a new `.env` file with the environment configuration.
Use [env.example.txt](env.example.txt) file as base.

Use these credentials in `ProcessWire` configuration.

```sh
WEB_PORT=8080
MARIADB_HOST=db
MARIADB_PORT=3306
MARIADB_DATABASE=pw_db
MARIADB_USER=pw_user
MARIADB_PASSWORD=pw_password
MARIADB_ROOT_PASSWORD=root_password
```

Access the database using an external tool such as [HeidiSQL](https://www.heidisql.com/) or [DBeaver](https://dbeaver.io/).
Use the local machine IP and port:

- *host* : `127.0.0.1`
- *port* `3306`

### Important

Always **backup** your database sql because you may 
loose your data if you *prune your containers*.

### Known Issues

These issues may ocur if the docker container was incorrectly stopped or pruned and restarted.

All the files are stored inside `docker/database`.

When starting database could fail. Delete the file `tc.log`.

When importing sql may show `Error : Tablespace for table xxxx exists. Please DISCARD the tablespace before IMPORT.`. Search for `*.idb` files without it's matching `*.frm` file. Move those `idb` files to another directory or delete them.

## PHP

For changing *PHP* settings go to [`docker/php/config/local.ini`](/docker/php/config/local.ini) and then rebuild
the containers. For installing additional modules change the [`docker/php/Dockerfile`](/docker/php/Dockerfile).

- Default timezone *UTC*.

## Local host

Once `Docker` is running you can access `ProcessWire` by going to localhost
in your browser. `127.0.0.1:8080`. Is recommended that you edit your `hosts` file
to add a custom domain.

If you want to use another port (default is 8080) you must change it in the `docker-compose.yaml` file.

```yml
ports:
    # local port : docker port
    - 8080:80
```

## Docker Commands

- `docker-compose up -d` : Starts the containers
- `docker ps`: Show the running containers
- `docker kill <container id>`: Kills a container
- `docker network prune`: Reset the network
- `docker container prune`: Resets the stopped containers

## Taskfile

A [Taskfile](https://taskfile.dev/) is a way of simplifyng some tasks.

- `task up`: Will start the containers.
- `task down`: Will stop the containers.
- `task restart`: Will stop and then start the containers.

## Other Resources

- [https://processwire.com/talk/topic/10736-running-a-processwire-site-with-docker/](https://processwire.com/talk/topic/10736-running-a-processwire-site-with-docker/)

- [https://github.com/raleerg/docker-processwire](https://github.com/raleerg/docker-processwire)


Made with <i class="fa fa-heart">&#9829;</i> by <a href="https://ninjas.cl" target="_blank">Ninjas.cl</a>.
