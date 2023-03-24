#!/bin/sh
readsb --quiet --lat $READSB_LAT --lon $READSB_LON \
--device-type rtlsdr --device $READSB_DEVICE --gain $READSB_GAIN \
--forward-mlat --net --net-connector=readsb-server,30004,beast_out