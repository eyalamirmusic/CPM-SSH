# Build and run:
# docker build -t cpm-ssh-env -f Dockerfile . --progress=plain --build-arg SSH_KEY="$(cat ~/.ssh/id_rsa)"

FROM ubuntu:latest

RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get -y install tzdata

ARG SSH_KEY

RUN apt-get update \
  && apt-get install -y build-essential \
      git \
      gcc \
      g++ \
      gdb \
      clang \
      make \
      ninja-build \
      cmake \
      autoconf \
      automake \
      locales-all \
      dos2unix \
      rsync \
      tar \
      python \
      python-dev \
  && apt-get clean

RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN echo "$SSH_KEY" > ~/.ssh/id_rsa
RUN chmod 600 ~/.ssh/id_rsa

#Just to check that git clone works:
RUN git clone git@github.com:eyalamirmusic/cpp_data_structures.git