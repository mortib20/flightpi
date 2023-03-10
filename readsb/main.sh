readsb --quiet --device-type rtlsdr --device $READSB_DEVICE --gain $READSB_GAIN --ppm 0 --modeac --forward-mlat \
--lat $READSB_LAT --lon $READSB_LON \
--max-range 450 --write-json-every 1 --write-json /run/readsb --write-prom /run/readsb/prom \
--net --net-heartbeat 60 --net-ro-size 1250 --net-ro-interval 0.05 \
--net-ri-port 30001 --net-ro-port 30002 --net-sbs-port 30003 --net-bi-port 30004,30104 --net-bo-port 30005 \
--json-location-accuracy 2 --range-outline-hours 24