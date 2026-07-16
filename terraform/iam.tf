resource "aws_iam_role" "ec2_role-1" {
  name = "cloudwatch-agent-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Effect = "Allow"

      Principal = {
        Service = "ec2.amazonaws.com"
      }

      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "cw_policy-1" {
  role       = aws_iam_role.ec2_role-1.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_instance_profile" "ec2_profile-1" {
  name = "cloudwatch-instance-profile"
  role = aws_iam_role.ec2_role-1.name
}