FROM ubuntu:latest
COPY test.sh /test.sh

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# RUN apk add build-base opam git m4
RUN dpkg --add-architecture i386 && \
    apt-get update --fix-missing -y && \
    apt-get install gcc-multilib make opam m4 -y
RUN opam init --disable-sandboxing -y && eval $(opam env)


RUN apt-get update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/*
# RUN add-apt-repository ppa:avsm/ppa \
RUN apt update -y \
    && apt install opam -y \
    && opam init --disable-sandboxing -y \
    && opam --version \
    && opam install depext -y \
    && opam depext camlp5 -y \
    && eval $(opam env) \
    && apt-get install  \
    && opam switch create lama ocaml-variants.4.10.1+fp+flambda \
    && export OPAMSWITCH=lama \
    && eval $(opam env) \
    && opam pin add Lama https://github.com/JetBrains-Research/Lama-devel.git\#1.10+ocaml4.10 -y \
    && eval $(opam env) \
    && which lamac

# RUN opam pin add -y ostap https://github.com/dboulytchev/ostap.git\#memoCPS
# RUN opam pin add -y lama https://github.com/JetBrains-Research/Lama.git
# RUN eval $(opam env)
#     && apt-get install libstring-shellquote-perl libipc-system-simple-perl \
