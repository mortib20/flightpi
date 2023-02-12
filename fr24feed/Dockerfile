FROM debian:latest

WORKDIR /srv
COPY ./download.sh ./

RUN apt-get update -y && apt-get install wget -y
RUN ./download.sh
RUN mkdir /var/log/fr24feed
CMD [ "fr24feed" ]