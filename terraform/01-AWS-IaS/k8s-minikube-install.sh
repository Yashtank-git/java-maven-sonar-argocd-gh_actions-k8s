sudo apt update -y
sudo groupadd docker

#Installing docker as driver for minkube
sudo apt install docker.io -y


#Installing and starting minikube
cd /home/ubuntu
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
sudo usermod -aG docker $USER && newgrp docker
minikube start --driver=docker

#Setting kubectl to run as 'minikube kubectl'
alias kubectl="minikube kubectl --"
ln -s $(which minikube) /usr/local/bin/kubectl



