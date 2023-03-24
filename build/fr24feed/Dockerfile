FROM debian:latest as build

WORKDIR /srv
COPY ./download.sh ./
RUN apt-get update -y && apt-get install wget -y
RUN ./download.sh

FROM debian:latest as main

WORKDIR /srv
COPY --from=build /srv/fr24feed/fr24feed /usr/local/bin
CMD [ "fr24feed" ]