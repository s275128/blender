# Simple Docker container for super lightweight desktop environment

Based on ubuntu:20.04

Meant to be used as a side-car container

## Startup
Build image:

`docker build . --tag blender`

Run image:

`docker run -it --rm -v ~/random-dir/:/tmp/.X11-unix --net container:novnc --name blender blender`