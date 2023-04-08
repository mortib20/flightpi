FROM alpine:latest as libacars
RUN apk add git make \
cmake \
gcc \
libc-dev \
libusb \
librtlsdr \
librtlsdr-dev \
zlib-dev \
zstd-dev \
libxml2

RUN git clone https://github.com/szpajder/libacars /srv/libacars
WORKDIR /srv/libacars/build
RUN cmake ..
RUN make
RUN make install

RUN git clone https://github.com/TLeconte/acarsdec /srv/acarsdec
WORKDIR /srv/acarsdec/build
RUN cmake .. -Drtl=ON
RUN make
RUN make install

CMD ["acarsdec", "-r", "0", "131.525", "131.725", "131.825"]