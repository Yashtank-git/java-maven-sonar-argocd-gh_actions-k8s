resource "aws_instance" "app-sonarqube" {
  subnet_id = aws_subnet.app-subnet-public.id
  security_groups=[aws_security_group.app-sg.id]
  depends_on = [ aws_security_group.app-sg ]
  associate_public_ip_address = true
  ami           = "ami-053b0d53c279acc90" #Ubuntu 22.04
  instance_type = "t2.medium"
  key_name = data.aws_key_pair.app-keypair.key_name
  
  tags = {
    Name = "app-sonarqube"
  }
  user_data = "${file("sonarqube-install.sh")}"
}

resource "aws_instance" "app-k8s-minikube" {
  subnet_id = aws_subnet.app-subnet-public.id
  security_groups=[aws_security_group.app-sg.id]
  depends_on = [ aws_security_group.app-sg ]
  associate_public_ip_address = true

  ami           = "ami-053b0d53c279acc90" #Ubuntu 22.04
  instance_type = "t2.medium"
  key_name = data.aws_key_pair.app-keypair.key_name
  
  tags = {
    Name = "app-minikube"
  }
  user_data = "${file("k8s-minikube-install.sh")}"
}




