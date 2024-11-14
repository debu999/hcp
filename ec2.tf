provider "aws" {
  region = "us-west-1"
}

data "aws_ami" "free_tier_ami" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["al2023-ami-2023*"]
  }
  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "default_ec2" {
  ami           = data.aws_ami.free_tier_ami.id
  instance_type = "t2.micro"
  tags = {
    Name = "default_ec2"
  }
}

output "instance_id" {
  value = aws_instance.default_ec2.id
}
