# /etc/init.d/telegraf start
# grafana-server -homepath /usr/share/grafana
# ./grafana-server
# /usr/bin/supervisord -c /etc/supervisord.conf
/etc/init.d/telegraf start
grafana-server -homepath /usr/share/grafana -config /etc/grafana.ini