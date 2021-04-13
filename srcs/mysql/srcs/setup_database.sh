mariadb-install-db -u root
# mysqld -u root
# mysql -u root -e "CREATE DATABASE wordpress;"
# mysql -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION; USE wordpress;"
# mysql -u root -e "FLUSH PRIVILEGES"
/usr/bin/mysqld_safe --datadir="/var/lib/mysql"