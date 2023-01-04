FROM gcc:latest

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y make gcc wget 

WORKDIR /root
RUN wget https://github.com/chadwickbureau/chadwick/releases/download/v0.10.0/chadwick-0.10.0.tar.gz && tar -xzvpf chadwick-0.10.0.tar.gz

WORKDIR /root/chadwick-0.10.0
RUN ./configure && make && make install

ENV LD_LIBRARY_PATH="/usr/local/lib"
