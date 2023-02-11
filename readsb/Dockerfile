FROM alpine:latest as build

RUN apk add --no-cache git make gcc libc-dev zlib-dev zstd-dev libusb librtlsdr librtlsdr-dev && git clone https://github.com/wiedehopf/readsb.git readsb
RUN make -C readsb -E RTLSDR=yes -E DISABLE_INTERACTIVE=yes -E OPTIMIZE="-march=native"

FROM alpine:latest as main

ENV DEVICE=0 GAIN=-10 LAT=50 LON=10

EXPOSE 30002 30003 30004 30005 30104

WORKDIR /srv
COPY --from=build /readsb/readsb /usr/local/bin
RUN apk add --no-cache libusb librtlsdr zstd-dev && rm -Rf /var/cache/*
CMD readsb --device-type rtlsdr \
--device $DEVICE \
--gain $GAIN --ppm 0 \
--lat $LAT --lon $LON \
--max-range 450 --write-json-every 1 \
--net --net-heartbeat 60 --net-ro-size 1250 --net-ro-interval 0.05 \
--net-ri-port 30001 \
--net-ro-port 30002 \
--net-sbs-port 30003 \
--net-bi-port 30004,30104 \
--net-bo-port 30005 \
--json-location-accuracy 2 --range-outline-hours 24 \
--write-json /srv