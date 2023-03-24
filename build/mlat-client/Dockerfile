FROM alpine:latest AS build
WORKDIR /build/
RUN apk add git libc-dev gcc python3 python3-dev
RUN git clone https://github.com/wiedehopf/mlat-client
WORKDIR /build/mlat-client/
RUN python3 -m venv .
RUN source ./bin/activate && python3 setup.py build

FROM alpine:latest AS main
COPY --from=build /build/ /build/
WORKDIR /build/mlat-client
RUN apk add python3
RUN source ./bin/activate && python3 setup.py install