data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

resource "tls_private_key" "ec2" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ec2_private_key" {
  content         = tls_private_key.ec2.private_key_pem
  filename        = "${path.module}/ssh-key.pem"
  file_permission = "0600"
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = tls_private_key.ec2.public_key_openssh
}

resource "aws_instance" "ec2-instance-1" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet-1.id
  vpc_security_group_ids      = [aws_security_group.monitoring_sg-1.id]
  key_name                    = aws_key_pair.ssh-key.key_name
  associate_public_ip_address = true

  iam_instance_profile = aws_iam_instance_profile.ec2_profile-1.name

  user_data = file("${path.module}/userdata.sh")

  tags = {
    Name = "ec2-instance-1"
  }
}