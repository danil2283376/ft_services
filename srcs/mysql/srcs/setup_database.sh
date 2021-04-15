mariadb-install-db -u root
mysqld -u root & sleep 5

mysql -u root -e "CREATE DATABASE wordpress;"

# copy wp database
# mysql -u root wordpress < wordpress.sql

mysql -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION; USE wordpress;"
mysql -u root -e "FLUSH PRIVILEGES"

/usr/bin/supervisord -c /etc/supervisord.conf