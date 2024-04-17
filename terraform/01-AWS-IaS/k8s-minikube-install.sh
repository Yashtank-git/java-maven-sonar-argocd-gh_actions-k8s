sudo apt update

#Installing docker as driver for minkube
sudo apt install docker.io -y

#Installing and starting minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
minikube start --driver=docker


#Setting kubectl to run as 'minikube kubectl'
alias kubectl="minikube kubectl --"
ln -s $(which minikube) /usr/local/bin/kubectl

