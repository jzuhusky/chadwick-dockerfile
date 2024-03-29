# chadwick-dockerfile
Dockerized Chadwick https://github.com/chadwickbureau/chadwick

# Why?

Personally, I've been using the [chadwick](https://github.com/chadwickbureau/chadwick) tool a lot recently for working with the retrosheet dataset. There exists a MacOS homebrew distribution of the tool, but I've always needed it to run on linux (really in a docker container). And AFAIK, that distro is like 0.7.... so this at least provides an avenue for compiling any distro. 

Now chadwick on Linux! And able to run in Docker! Which opens a world of possibilities (for me at least). 

# So here it is! 

This image will compile and make available the latest distro, i.e. 0.10.0 (see https://github.com/chadwickbureau/chadwick/releases). Another contributor should feel free to extend this dockerfile (perhaps using `ARG`(?) to pull any distro a user would want. 

1st, clone this repo, then do this (make sure you have docker installed and running):
```bash
docker build . -t gcc/chadwick-compiled:latest
```
Then, run the docker image to use the tool!
```bash
docker run -it gcc/chadwick-compiled:latest bash

---- INSIDE THE CONTAINER NOW ----
root@3c3d00826dc6:~/chadwick-0.10.0# cwevent

Chadwick expanded event descriptor, version 0.10.0
  Type 'cwevent -h' for help.
Copyright (c) 2002-2023
Dr T L Turocy, Chadwick Baseball Bureau (ted.turocy@gmail.com)
This is free software, subject to the terms of the GNU GPL license.

Can't find teamfile (team)
```

Alternatively, you can run cwevent directly without interactively bash-ing into the container:
```
docker run chadwick:latest cwevent

Chadwick expanded event descriptor, version 0.10.0
  Type 'cwevent -h' for help.
Copyright (c) 2002-2023
Dr T L Turocy, Chadwick Baseball Bureau (ted.turocy@gmail.com)
This is free software, subject to the terms of the GNU GPL license.

Can't find teamfile (team)
```
# Notes
* This has setup the software inside a linux container, so it's on the user to get the raw retrosheet files into the container. I would suggest cloning the retrosheet repo from chadwick, and mounting inside the container as a volume (hint, use the `-v` flag when doing a `docker run`). If you redirect the output of a chadwick command, e.g. `cwevent, cwbox` to a file, that file should persist in the directory on your host machine that you mounted into the container. 

# TODO
* Ideally, I'd like to write a script that does the magic noted above for the user, so one could use this tool as a mac/unix command line tool, and not have to run the docker command. 

# Contributing
I make no guarantees about what this is trying to do. If you see something that could be bettter... -> Fork -> PR 

# Author and License (Not me, but original chadwick software)

Chadwick is written and maintained by T L Turocy (ted.turocy@gmail.com), and is Copyright (C) 2002-2021 by T L Turocy and Chadwick Baseball Bureau.

Chadwick is Open Source software, distributed under the terms of the GNU General Public License (GPL).

