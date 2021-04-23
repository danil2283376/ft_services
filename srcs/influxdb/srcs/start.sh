
# /etc/telegraf start
# influx -execute "CREATE DATABASE influxdb"
# influx -execute "CREATE USER admin WITH PASSWORD 'admin'"
# /usr/bin/supervisord -c /etc/supervisord.conf
# /usr/sbin/influxd -config /etc/influxdb.conf
/etc/init.d/telegraf start
/usr/sbin/influxd -config /etc/influxdb.conf