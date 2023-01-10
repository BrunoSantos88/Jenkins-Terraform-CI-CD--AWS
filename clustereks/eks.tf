resource "aws_eks_cluster" "eks_cluster" {

  name     = "eksmaster"
  role_arn = "arn:aws:iam::555527584255:role/eks-cluster-example"
  version  = "1.23.0"
  
  vpc_config {

      subnet_ids = [
          "subnet-031cd6dbcbe80f86e", 
          "subnet-0ae6af88789b0b2d3"
      ]
      
  }

  depends_on = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  ]

}