resource "aws_eks_cluster" "eks_cluster" {
  name     = "terraformEKScluster"
  role_arn =  "${aws_iam_role.iam-role-eks-cluster.arn}"
  version  = "1.23"
 # Configure EKS with vpc and network settings 
  vpc_config {            
   security_group_ids = ["${aws_security_group.eks-cluster.id}"]
# Configure subnets below
   subnet_ids         = ["subnet-031cd6dbcbe80f86e","subnet-0ae6af88789b0b2d3"] 
    }
  depends_on = [
    "aws_iam_role_policy_attachment.eks-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.eks-cluster-AmazonEKSServicePolicy",
   ]
}
 