resource "aws_security_group" "app-sg" {
  name        = "Allow Required Ports"
  description = "Allow Required ports"
  vpc_id      = aws_vpc.app-vpc.id


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "app-sg-allow-sonar" {
  security_group_id = aws_security_group.app-sg.id
  cidr_ipv4         = aws_vpc.app-vpc.cidr_block
  from_port         = 9000
  ip_protocol       = "tcp"
  to_port           = 9000
}

resource "aws_vpc_security_group_ingress_rule" "app-sg-allow-sonar" {
  security_group_id = aws_security_group.app-sg.id
  cidr_ipv4         = aws_vpc.app-vpc.cidr_block
  from_port         = 9000
  ip_protocol       = "tcp"
  to_port           = 9000
}
