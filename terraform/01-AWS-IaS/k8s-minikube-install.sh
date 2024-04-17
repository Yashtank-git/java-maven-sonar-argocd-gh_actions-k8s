sudo apt update -y

#Installing docker as driver for minkube
sudo apt install docker.io -y
sudo usermod -aG docker ubuntu
sudo usermod -aG sudo ubuntu


#Installing and starting minikube
cd /home/ubuntu
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
minikube start --driver=docker


#Setting kubectl to run as 'minikube kubectl'
alias kubectl="minikube kubectl --"
ln -s $(which minikube) /usr/local/bin/kubectl

