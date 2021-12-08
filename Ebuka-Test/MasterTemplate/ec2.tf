resource "aws_instance" "dev_server" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.devpublicsubnet.id
  key_name = var.keypair
  security_groups = [aws_security_group.dev_SG.id]
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.instace_profile.id

user_data = <<EOF
#! /bin/bash
sudo chown ec2-user /var/log
aws s3 cp /var/log s3://ebukabucket8 --recursive

EOF

  tags = {
    Name = "dev-server"
  }
}