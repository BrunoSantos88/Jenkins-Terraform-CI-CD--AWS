resource "aws_security_group" "eks-sec" {
  name        = "eks-sec-rules"
  description = "eks-traffic"
  vpc_id      = "vpc-05703b43456f02cad"

  ingress {
    description      = "https"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = "10.0.0.0/16"
  }

  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = "10.0.0.0/16"
  }

  ingress {
    description      = "eks"
    from_port        = 30000-32800
    to_port          = 30000-32800
    protocol         = "tcp"
    cidr_blocks      = "10.0.0.0/16"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ekssecuritygroup"
  }
  
}