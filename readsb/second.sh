readsb --quiet --device-type rtlsdr --device $READSB_DEVICE --gain $READSB_GAIN --ppm 0 \
--lat $READSB_LAT --lon $READSB_LON \
--net --net-heartbeat 60 --net-ro-size 1250 --net-ro-interval 0.05 \
--net-connector=readsb-main,30001,raw_out