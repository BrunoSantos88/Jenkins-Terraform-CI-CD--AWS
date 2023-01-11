resource "aws_eks_cluster" "eks_cluster" {
  name     = "terraformEKScluster"
  role_arn =  "${aws_iam_role.iam-role-eks-cluster.arn}"
  version  = "1.23"
  vpc_config {            
   security_group_ids = ["${aws_security_group.eks-cluster.id}"]
   subnet_ids         = ["subnet-0f93eb1ba0436eae5","subnet-04776c3a79d7f875d"] 
    }

enable_irsa = true
  eks_managed_node_group_defaults = {
    disk_size = 50
  }
  
  eks_managed_node_groups = {
    general = {
      desired_size = 1
      min_size     = 1
      max_size     = 1

      labels = {
        role = "general"
      }
      instance_types = ["t3.small"]
    }
  tags = {
    Environment = "staging"
  }

  depends_on = [
    "aws_iam_role_policy_attachment.eks-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.eks-cluster-AmazonEKSServicePolicy",
   ]
}

}