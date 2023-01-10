resource "aws_security_group" "eks-cluster" {
  name        = "SG-eks-cluster"
# Use your VPC here
  vpc_id      = "vpc-05703b43456f02cad" 
 # Outbound Rule
  egress {                
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Inbound Rule
  ingress {                
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}