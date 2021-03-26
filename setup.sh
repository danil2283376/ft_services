bash rmi.sh
clear
minikube stop
minikube delete
minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
docker build -t nginx_image .
minikube addons enable metallb
kubectl apply -f configmap.yaml
kubectl apply -f nginx/nginx.yaml
minikube dashboard