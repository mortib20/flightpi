#!/bin/sh
readsb --quiet --lat $READSB_LAT --lon $READSB_LON \
--write-json-every 1 --write-json /run/readsb --write-prom /run/readsb/prometheus.prom \
--forward-mlat \
--net-only --net \
--net-ri-port 30001 \
--net-ro-port 30002 --net-sbs-port 30003 --net-bi-port 30004,30104 --net-bo-port 30005