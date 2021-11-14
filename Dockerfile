FROM gcc:latest

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y make gcc wget 

WORKDIR /root
RUN wget https://github.com/chadwickbureau/chadwick/releases/download/v0.9.1/chadwick-0.9.1.tar.gz && tar -xzvpf chadwick-0.9.1.tar.gz

# For some reason, this file isn't in the tar distro
# so I've copied it into this repo, and we manually copy it into the image,
# otherwise, the program doesn't compile. 
COPY util.h /root/chadwick-0.9.1/src/cwlib

# Now compile
WORKDIR /root/chadwick-0.9.1
RUN ./configure && make && make install

ENV LD_LIBRARY_PATH="/usr/local/lib"
