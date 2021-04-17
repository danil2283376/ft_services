# rebuild minikube
bash rmi.sh
clear
minikube stop
minikube delete
minikube start --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G
eval $(minikube docker-env)
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2
minikube addons enable metallb
kubectl apply -f configmap.yaml

# nginx setup
docker build -t nginx_image srcs/nginx/
kubectl apply -f srcs/nginx/nginx.yaml

# mysql setup
docker build -t mysql_image srcs/mysql
kubectl apply -f srcs/mysql/mysql.yaml

# wordpress setup
docker build -t wordpress_image srcs/wordpress
kubectl apply -f srcs/wordpress/wordpress.yaml

# phpMyAdmin setup
docker build -t phpmyadmin_image srcs/phpMyAdmin
kubectl apply -f srcs/phpMyAdmin/phpMyAdmin.yaml

# ftps setup
docker build -t ftps_image srcs/ftps
kubectl apply -f srcs/ftps/ftps.yaml

# influxDB setup
docker build -t influxdb_image srcs/influxdb
kubectl apply -f srcs/influxdb/influxdb.yaml

minikube dashboard