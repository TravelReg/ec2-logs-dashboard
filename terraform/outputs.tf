output "instance_public_ip" {
  value = aws_instance.ec2-instance-1.public_ip
}

output "ssh_private_key_path" {
  value = local_file.ec2_private_key.filename
}

output "ssh_command" {
  value = "ssh -i ${local_file.ec2_private_key.filename} ubuntu@${aws_instance.ec2-instance-1.public_ip}"
}

output "sns_topic_arn" {
  value = aws_sns_topic.alerts-1.arn
}