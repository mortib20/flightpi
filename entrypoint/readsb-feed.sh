#!/bin/sh
readsb --quiet --lat $READSB_LAT --lon $READSB_LON \
--write-json-every 1 --write-json /run/readsb \
--forward-mlat \
--net-only --net --net-connector readsb-server,30005,beast_in \
--uuid-file /script/uuid \
$READSB_FEED