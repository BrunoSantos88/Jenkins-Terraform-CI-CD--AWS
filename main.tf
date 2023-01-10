module "networking" {
  source       = "./networking"
  vpc_cidr     = "192.0.0.0/16"
  public_cidrs = ["192.0.1.0/24", "192.0.2.0/24"]
}


#Rede cluster EKS
resource "aws_vpc" "eks_vpc" {
  vpc_cidr     = "10.0.0.0/16"
  public_cidrs = ["10.0.1.0/24", "10.0.2.0/24" ,"10.0.30/24"]

  enable_dns_hostnames  = true
  enable_dns_support    = true

  tags = {
    Name = "networking-eks"
  }
}

#module "cluster" {
  #source        = "./clustereks"
 # web_sg        = module.networking.web_sg
 # public_subnet = module.networking.public_subnet
#}




#politicas IAM
resource "aws_iam_role" "example" {
  name = "eks-cluster-example"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.example.name
}

# Optionally, enable Security Groups for Pods
# Reference: https://docs.aws.amazon.com/eks/latest/userguide/security-groups-for-pods.html
resource "aws_iam_role_policy_attachment" "example-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.example.name
}