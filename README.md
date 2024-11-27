# About

This is the second part of the Docker Python Builder. This is used to create the actual container that will use the compiled Python.

# Required

Linux OS
Docker

# Security Info

The final container uses a non-admin user account (py).

If you need a root or sudo account either add (py) the related group or remove the related lines from the Dockerfile:
[RUN useradd -rm -d /home/py -s /bin/bash -u 1000 py
USER py]

# Configuration

In Dockerfile replace the {Version} with the required version number(s).

In python{Version}.sh replace the {Version} with the required version number(s).

Make sure the Dockerfile and python{Version}.sh are in the same folder.

# To Build the Final Python

docker build -t python:{Python Version} {Path of the Docker File}

# Some Ways to Run and Use the Python Container

1. Build another Docker Container with python:{Python Version} as the base

2. Run the container through Bash:
docker run -it python:{Python Version} bash

3. Run a script (--it and --rm are optional):
docker run -it --rm -v {script.py:/script.py} python:{Python Version} python{Python Version} /script.py

# To have a GUI interface

Make sure the host is set with the following command: (xhost +)

docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v {script.py:/script.py} python:{Python Version} python{Python Version} /script.py
