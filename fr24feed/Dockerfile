FROM debian:latest

WORKDIR /srv
COPY ./download.sh ./
COPY ./entry.sh ./

RUN apt-get update -y && apt-get install wget -y
RUN ./download.sh
ENTRYPOINT [ "entry.sh" ]