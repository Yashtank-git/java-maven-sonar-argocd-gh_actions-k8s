![excali-image](https://github.com/Yashtank-git/java-maven-sonar-argocd-gh_actions-k8s/assets/69433053/d8a66080-3f65-47bf-a4d9-39812cae5cec)


# java-maven-sonar-argocd-gh_actions-k8s
## Project Description
GitHub Actions CICD Pipeline Setup for Java based application with different stages using **Terraform, Maven, SonarQube, Argo CD and Kubernetes Deployment**

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

