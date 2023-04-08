#!/bin/sh
readsb --quiet --lat $READSB_LAT --lon $READSB_LON \
--write-json-every 1 --write-json /run/readsb \
--net-only --net --net-connector $READSB_BEAST_IN \
--uuid-file /script/uuid \
$READSB_FEED