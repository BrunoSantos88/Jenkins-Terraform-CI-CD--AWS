resource "aws_eks_node_group" "eks_node_group" {
    
  cluster_name    = "eksmaster"
  node_group_name = "nodemaster"
  node_role_arn   = "arn:aws:iam::555527584255:role/nodepolice"

subnet_ids = [
          "subnet-031cd6dbcbe80f86e", 
          "subnet-0ae6af88789b0b2d3"
      ]


  scaling_config {
    desired_size = "1"
    max_size     = "1"
    min_size     = "1"
  }

  depends_on = [
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
  ]

}