resource "aws_eks_cluster" "eks_cluster" {
  name     = "terraformEKScluster"
  role_arn =  "${aws_iam_role.iam-role-eks-cluster.arn}"
  version  = "1.23"
 # Configure EKS with vpc and network settings 
  vpc_config {            
   security_group_ids = ["${aws_security_group.eks-cluster.id}"]
# Configure subnets below
   subnet_ids         = ["subnet-0f93eb1ba0436eae5","subnet-04776c3a79d7f875d"] 
    }
  depends_on = [
    "aws_iam_role_policy_attachment.eks-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.eks-cluster-AmazonEKSServicePolicy",
   ]
}
 