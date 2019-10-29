# National Leadership Centre Knowledge Graph: Neo4j

This is a project for the National Leadership Centre to run a [Neo4j](https://neo4j.com/) graph database in Docker containers.

# Usage

## Requirements

This project assumes you already have [Traefik](https://traefik.io/) running on a container in an external network called `traefik`. 

To create a Docker external network called `traefik`:

```bash
docker network create traefik
```

A project like [joesb/docker-portainer-traefik](https://github.com/joesb/docker-portainer-traefik) may be a good way to run a Traefik (and [Portainer](https://www.portainer.io/)) instance on that external network.

## Getting started

### Installation and configuration

1. **Clone this repository.**
2. **Copy-and-paste `.env.example` to `.env` and edit settings to suit your needs.**
  This is the environment for your local Docker. Most settings should be obvious and/or self-evident. The default values are probably fine.
3. **Start it up**

The `Makefile` and `docker.mk` included in this project provide some easy CLI tools to work with this Docker stack for Drupal.

**To start your Docker stack, from the root directory of your cloned repo:**

```bash
make up
```

**To stop your Docker stack:**

```bash
make down
```

Once booted, you should have:

- a Neo4j instance running
- an Nginx container running a simple static HTML page with [Neovis.js](https://github.com/neo4j-contrib/neovis.js)

You will need to make changes to the `index.html` file so that Neovis.js can connect to your Neo4j instance.

#### Make commands

The project comes with several handy make commands.

Usage:

```bash
make {command}
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
