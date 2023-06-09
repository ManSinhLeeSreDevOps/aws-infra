data "aws_availability_zones" "available" {}

data "aws_route53_zone" "zone" {
  name         = var.domain_name
  private_zone = false
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# data "aws_ami" "centos" {
#   owners      = ["679593333241"]
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["CentOS Linux 7 x86_64 HVM EBS *"]
#   }

#   filter {
#     name   = "architecture"
#     values = ["x86_64"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }
# }

data "aws_ami" "amz_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}