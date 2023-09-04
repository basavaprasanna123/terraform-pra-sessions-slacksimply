# Get latest AMI IDs for Amazon Linux2 OS
# Terraform documentation: "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami"
#So here we can follow above link Main block is data and Resource type is aws_ami's.

#This for ami under c5 session we can pass the : data.aws_ami.amzlinux2.id

data "aws_ami" "amzlinux2" {
  #executable_users = ["self"]
  most_recent      = true #It will look the most recent one of ami's
  #name_regex       = "^myami-\\d{3}"
  owners           = ["aws"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}
