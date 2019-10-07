# National Leadership Centre Alpha Knowledge Graph: Neo4j

This is a project for the National Leadership Centre to run a [Neo4j](https://neo4j.com/) graph database in Docker containers.

# Usage

## Getting started

### Installation and configuration

1. **Clone this repository.**
2. **Copy-and-paste `.env.example` to `.env` and edit settings to suit your needs.**
  This is the environment for your local Docker. Most settings should be obvious and/or self-evident. The default values are probably fine.
3. **Start it up**

The `Makefile` and `docker.mk` included in this project provide some easy CLI tools to work with this Docker stack for Drupal.

**To start your Docker stack, from the root directory of your cloned repo:**

```bash
$ make up
```

**To stop your Docker stack:**

```bash
$ make down
```

#### Make commands:

Usage:

```bash
$ make {command}
```

```bash
Commands:
    up              Start up all container from the current docker-compose.yml
    stop            Stop all containers for the current docker-compose.yml (docker-compose stop)
    down            Same as stop
    prune           Stop and remove containers, networks, images, and volumes (docker-compose down)
    ps              List container for the current project (docker ps with filter by name)
    logs [service]  Show containers logs, use [service] to show logs of specific service
```
