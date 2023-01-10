resource "aws_eks_node_group" "node" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "node_tuto"
  node_role_arn   = aws_iam_role.eks_nodes.arn
  subnet_ids      = ["subnet-0f93eb1ba0436eae5","subnet-04776c3a79d7f875d"]
  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }
 
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}
