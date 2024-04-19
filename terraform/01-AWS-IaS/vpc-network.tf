resource "aws_vpc" "app-vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags={
    Name = "app-vpc"
  }  

}

resource "aws_subnet" "app-subnet-public" {

  vpc_id     = aws_vpc.app-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags ={
    Name = "app-subnet-public"
  }
}

resource "aws_eip" "app-eip-sonar" {
  instance = aws_instance.app-sonarqube.id
  domain = "vpc"
}

resource "aws_eip" "app-eip-k8s" {
  instance = aws_instance.app-k8s-minikube.id
  domain = "vpc"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.app-vpc.id
  
  tags = {
    Name = "igw"
  }
}


resource "aws_default_route_table" "app-route-table" {
  default_route_table_id = aws_vpc.app-vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "app-route-table"
  }
}

