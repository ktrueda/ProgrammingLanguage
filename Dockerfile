FROM ubuntu

ENV SML_VERSION v110.79

RUN apt update \
  && apt install -y \
    smlnj \
    rlwrap \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

