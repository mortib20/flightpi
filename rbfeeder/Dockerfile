FROM alpine:latest as build

ENV RBKEY=SET

RUN apk add --no-cache git make gcc g++ libc-dev libusb patch automake autoconf libtool ncurses ncurses-dev glib glib-dev librtlsdr-dev librtlsdr jansson jansson-dev curl curl-dev protobuf-dev libprotobuf-lite libprotobuf protoc libprotoc
RUN git clone https://github.com/protobuf-c/protobuf-c protobuf-c
WORKDIR /protobuf-c
RUN ./autogen.sh
WORKDIR /protobuf-c/build
RUN ../configure && make && make install
WORKDIR /
RUN git clone https://github.com/airnavsystems/rbfeeder rbfeeder
WORKDIR /rbfeeder
ADD rbfeeder_curl.patch .
RUN patch -u airnav_rtlpower.c -i rbfeeder_curl.patch
WORKDIR /
RUN make -C rbfeeder proto && make -C rbfeeder -E RTLSDR=yes -E CPUFEATURES=yes rbfeeder
RUN mv /rbfeeder/rbfeeder /usr/local/bin
RUN mv /rbfeeder/etc/rbfeeder.ini /etc
RUN env
RUN rbfeeder --setkey $RBKEY
RUN rbfeeder --set-network-mode on
RUN rbfeeder --set-network-protocol beast
RUN rbfeeder --set-network-port 172.17.0.1:30005
CMD rbfeeder

#FROM alpine:latest as main
#WORKDIR /srv
#COPY --from=build /rbfeeder/rbfeeder /usr/local/bin
#COPY --from=build /rbfeeder/etc/rbfeeder.ini /etc/rbfeeder.ini
#RUN apk add --no-cache git make gcc g++ libc-dev libusb patch automake autoconf libtool ncurses ncurses-dev glib glib-dev librtlsdr-dev librtlsdr jansson jansson-dev curl curl-dev protobuf-dev libprotobuf-lite libprotobuf protoc libprotoc && rm -Rf /var/cache/*
#RUN ldconfig /usr/local/lib/
#RUN rbfeeder
#CMD rbfeeder $ARGS