data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical's AWS account ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
  }
}

resource "aws_instance" "CNC-test" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.nano"
  tags = {
    Name = "CNC-test"
  }
}

output "CNC-Test-PublicIP" {
  value = aws_instance.CNC-test.public_ip
}