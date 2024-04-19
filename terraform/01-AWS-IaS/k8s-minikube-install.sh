sudo apt update -y

#Installing docker as driver for minkube
sudo apt install docker.io -y

#Installing and starting minikube
cd /home/ubuntu
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo usermod -aG docker $USER && newgrp docker

sudo chown -R ubuntu:docker minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube -g docker -o ubuntu

