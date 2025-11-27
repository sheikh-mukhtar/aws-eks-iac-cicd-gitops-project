# ===== IAM role for EC2 =====
resource "aws_iam_role" "terraform_admin_role" {
  name = "TerraformAdmin"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

# Attach managed policies for typical bastion needs (SSM, ECR read, CloudWatch agent)
resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.terraform_admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "ecr_readonly" {
  role       = aws_iam_role.terraform_admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "cw_agent" {
  role       = aws_iam_role.terraform_admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_role_policy_attachment" "eks_agent" {
  role       = aws_iam_role.terraform_admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}


# ===== Instance profile =====
resource "aws_iam_instance_profile" "terraform_admin" {
  name = "TerraformAdmin"
  role = aws_iam_role.terraform_admin_role.name
}

# ===== EC2 instance (bastion) =====
resource "aws_instance" "bastion" {
  ami                    = local.ami_id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg_id]
  subnet_id              = local.public_subnet_id

  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }

  user_data = file("bastion.sh")

  # reference the TF-managed instance profile (do NOT use hard-coded ARN)
  iam_instance_profile = aws_iam_instance_profile.terraform_admin.name

  # optional: ensure EC2 waits on the profile (usually not required if profile is managed)
  depends_on = [
    aws_iam_instance_profile.terraform_admin
  ]

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-bastion"
    }
  )
}
