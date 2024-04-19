![excali-image](https://github.com/Yashtank-git/java-maven-sonar-argocd-gh_actions-k8s/assets/69433053/e2f0748a-e969-4b81-9016-552e00961f95)


# java-maven-sonar-argocd-gh_actions-k8s
## Project Description
**GitHub Actions** CICD Pipeline Setup for Java based application with different stages using **Terraform, Maven, SonarQube, Argo CD and Kubernetes Deployment**

Technologies Used:
- Application                  - **java**
- Cloud Provider               - **AWS**
- IoC(Infrastructure as Code)  - **Terraform**
- CICD Tool                    - **GitHub Actions**
- Scripting                    - **Shell Scripting**
- Containerization             - **Docker**
- Deployment                   - **ArgoCD, Kubernetes**


## Setup

Download AWS CLI as per Appropriate OS: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
Download Terraform as per Appropriate OS: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

Create a IAM User from AWS Console for Terraform to create/modify/destroy AWS Resources

Configure aws IAM User for using Terraform as Ioc
Create a key pair to login to ec2 instances named as "app-keypair" and download private key

```bash
aws configure 
$ aws --version
aws-cli/2.15.27 Python/3.11.8 Linux/5.15.0-1055-aws exe/x86_64.ubuntu.20 prompt/off
aws configure
AWS Access Key ID [None]: <access key id>
AWS Secret Access Key [****************1OuQ]: <secret access key>
Default region name [None]: <default region>
Default output format [None]: 
```

To get this repository, run the following command inside your git enabled terminal
```bash
$ git clone https://github.com/Yashtank-git/java-maven-sonar-argocd-gh_actions-k8s.git
```
Update the aws config directory file path to **terraform/01-AWS-IaS/variables.tf** variable file

## Running IoC Commands

change directory to **terraform/01-AWS-IaS** and run below commands in shell

```bash
terraform init
terraform validate
terraform plan
terraform apply
```
## Setting up Minikube and Sonarqube servers

After the Terraform apply, The Public IPs of the servers will be displayed as output as terraform variable.

### Setting up Sonarqube

- Login to Sonarqube Application with URL
```bash
http://<sonarqube-server-ip>:9000
```
- Login with admin credentials
- Create a security token of Type "User Token"
- Update the SonarQube URL to **GitHub Actions Secrets** - SONAR_HOST_URL
- Update the user token to **GitHub Actions Secrets** - SONAR_TOKEN


### Setting up k8s-minikube
- Login to k8s-minikube server via ssh
- run below command to start minikube and set kubectl as minikube kubectl
```bash
minikube start --driver=docker
alias kubectl="minikube kubectl --"
ln -s $(which minikube) /usr/local/bin/kubectl
```
- Install ArgoCD Operator as per Instructions - https://operatorhub.io/operator/argocd-operator
- Get admin password for the cluster secret for loggin in
```bash
kubectl -n argocd get secret example-argocd-cluster -o jsonpath='{.data.admin\.password}' | base64 -d
```
- Create a basic-argocd.yml file for starting ArgoCD servers
```bash
#basic-argocd.yml
apiVersion: argoproj.io/v1alpha1
kind: ArgoCD
metadata:
  name: example-argocd
spec: {}
```
- Apply the configuration
```bash
kubectl apply -f basic-argocd.yml
```
- Once all the resouces are up and running, Edit the "example-argocd-server" service to be LoadBalancer Type
```bash
kubectl edit svc example-argocd-server
- change the Type of the Service to "LoadBalancer"
```
- Access the ArgoCD UI with the url
```bash
https://<k8s-minikube-server-ip>
```
### Create a Application with below settings and create
**General**
- Application Name  : spring-app-demo
- Project Name      : default
- Sync Policy       : Auto

**Source**
- Repo URL          : https://github.com/Yashtank-git/java-maven-sonar-argocd-gh_actions-k8s.git
- Revision          : main
- path              : spring-boot-app-manifests

**Destination**
- Cluster URL       : Default
- Namespace         : default


Hurray... 🥳 . CICD Pipeline and Application setup is complete and Finally Application can be accessible on
```bash
http://<k8s-minikube-server-ip>:8080
```

