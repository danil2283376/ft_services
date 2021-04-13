bash rmi.sh
clear
minikube stop
minikube delete
minikube start --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G
eval $(minikube docker-env)
minikube addons enable metallb
kubectl apply -f configmap.yaml

# nginx setup
docker build -t nginx_image srcs/nginx/
kubectl apply -f srcs/nginx/nginx.yaml

# mysql setup
docker build -t mysql_image srcs/mysql
kubectl apply -f srcs/mysql/srcs/mysql.yaml
minikube dashboard