resource "aws_instance" "bastion" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg_id]
  subnet_id = local.public_subnet_id

  # need more for terraform
  root_block_device {
    volume_size = 50
    volume_type = "gp3" # or "gp2", depending on your preference
  }
  user_data = file("bastion.sh")
  iam_instance_profile = "TerraformAdmin"
  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-bastion"
    }
  )
}