resource "aws_instance" "ap_southeast_1_ec2" {
  provider    = aws.ap-southeast-1
  ami           = "${data.aws_ami.amazonlinux2_ap_southeast_1.id}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${module.ap_southeast_1_security_group.security_group_id}"]
  subnet_id              = data.terraform_remote_state.ap_southeast_1_main_prod_remote.outputs.vpc_private_subnets[0]
  iam_instance_profile   = aws_iam_instance_profile.ec2_demo_instance_profile.name

  tags = merge(
    data.terraform_remote_state.global_prod_main_remote.outputs.default_tags,
    var.default_tags,
    {
    Name = "ap-southeast-1-ec2"
    }
  )
}

module "ap_southeast_1_security_group" {
  source = "terraform-aws-modules/security-group/aws"
  providers = {
    aws = aws.ap-southeast-1
  }
  name               = "ap-southeast-1-security-group"
  description        = "test security group"
  vpc_id             = data.terraform_remote_state.ap_southeast_1_main_prod_remote.outputs.vpc_id
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]
  ingress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "10.103.0.0/16"
    },
    {
      rule        = "all-all"
      cidr_blocks = "10.101.0.0/16"
    },
  ]
}
