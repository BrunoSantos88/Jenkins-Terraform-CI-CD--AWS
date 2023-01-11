resource "aws_eks_cluster" "eks_cluster" {
  name     = "terraformEKScluster"
  role_arn =  "${aws_iam_role.iam-role-eks-cluster.arn}"
  version  = "1.23"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  enable_irsa = true

  eks_managed_node_group_defaults = {
    disk_size = 50
  }
 
  vpc_config {            
   security_group_ids = ["${aws_security_group.eks-cluster.id}"]

   subnet_ids         = ["subnet-0f93eb1ba0436eae5","subnet-04776c3a79d7f875d"] 
    }
  depends_on = [
    "aws_iam_role_policy_attachment.eks-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.eks-cluster-AmazonEKSServicePolicy",
   ]
}
 