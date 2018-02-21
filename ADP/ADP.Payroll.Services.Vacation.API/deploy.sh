#!/bin/bash
# Deploying solution in a Docker development environment.

# Compilar proyecto con Dockerfile y crear imagen en servidor Docker.
docker build -t vacationapi .

# TRASLADAR IMAGEN LOCAL DOCKER A DOCKER FIT (docker images from one host to another)
# NOTE: It's also a good idea to put pv in the middle of the pipe to see how the transfer is going.
docker save vacationapi | bzip2 | ssh admin@ADMINADPLAT01 'bunzip2 | docker load'