# Build and run:
# docker build -t cpm-ssh-env -f Dockerfile . --build-arg SSH_KEY="$(cat ~/.ssh/id_rsa)" --build-arg UID=$(id -u)

FROM ubuntu:latest

RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get -y install tzdata

ARG SSH_KEY
ARG UID

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

RUN useradd --create-home -m -u $UID user
USER user

RUN mkdir ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN echo "$SSH_KEY" > ~/.ssh/id_rsa
RUN chmod 600 ~/.ssh/id_rsa