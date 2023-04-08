FROM alpine:latest as build

RUN apk add --no-cache git make gcc libc-dev zlib-dev zstd-dev libusb librtlsdr librtlsdr-dev && \
git clone https://github.com/wiedehopf/readsb.git readsb
RUN make -C readsb -E RTLSDR=yes -E DISABLE_INTERACTIVE=yes -E OPTIMIZE="-march=native"

FROM alpine:latest as main

WORKDIR /run/readsb
COPY --from=build /readsb/readsb /usr/local/bin
COPY ./entrypoints /entrypoints
RUN apk add --no-cache libusb librtlsdr zstd-dev && rm -Rf /var/cache/*
CMD ["readsb"]