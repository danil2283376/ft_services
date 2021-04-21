/usr/bin/supervisord -c /etc/supervisord.conf

# /etc/init.d/telegraf start
influx -execute "CREATE DATABASE influxdb"
influx -execute "CREATE USER admin WITH PASSWORD 'admin'"
# /usr/sbin/influxd -config /etc/influxdb.conf