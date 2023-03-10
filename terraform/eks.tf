module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 19.6.0"
  cluster_name    = local.name
  subnet_ids = var.subnets
  cluster_endpoint_public_access  = true

  eks_managed_node_group_defaults = {
    disk_size                             = 4
    instance_types                        = [var.instance_type]
    # ami_type                              = "AL2_x86_64"
    attach_cluster_primary_security_group = true
    create_security_group                 = false
  }
  eks_managed_node_groups = {
    control_plane = {
      name         = "node-group-1"
      disk_size    = 4
      min_size     = 1
      max_size     = 1
      desired_size = 1

      instance_types = [var.instance_type]
      capacity_type  = "SPOT"
    }
  }
}