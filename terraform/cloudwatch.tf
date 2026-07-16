resource "aws_cloudwatch_metric_alarm" "cpu_alarm-1" {
  alarm_name          = "HighCPUUsage"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 85

  dimensions = {
    InstanceId = aws_instance.ec2-instance-1.id
  }

  alarm_actions = [
    aws_sns_topic.alerts-1.arn
  ]
}

resource "aws_cloudwatch_log_group" "auth_logs-1" {
  name              = "/aws/ec2/auth"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_metric_filter" "failed_logins-1" {
  name           = "FailedSSHLogins"
  log_group_name = aws_cloudwatch_log_group.auth_logs-1.name

  pattern = "Invalid user"

  metric_transformation {
    name      = "UnauthorizedLoginAttempts"
    namespace = "SecurityMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "failed_login_alarm-1" {
  alarm_name          = "UnauthorizedLoginAttempts"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "UnauthorizedLoginAttempts"
  namespace           = "SecurityMetrics"
  period              = 300
  statistic           = "Sum"
  threshold           = 5

  alarm_actions = [
    aws_sns_topic.alerts-1.arn
  ]
}

resource "aws_cloudwatch_metric_alarm" "memory_alarm_1" {
  alarm_name          = "HighMemoryUsage"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "mem_used_percent"
  namespace           = "CWAgent"
  period              = 300
  statistic           = "Average"
  threshold           = 85

  dimensions = {
    InstanceId = aws_instance.ec2-instance-1.id
  }

  alarm_actions = [
    aws_sns_topic.alerts-1.arn
  ]
}

resource "aws_cloudwatch_metric_alarm" "disk_alarm_1" {
  alarm_name          = "HighDiskUsage"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "disk_used_percent"
  namespace           = "CWAgent"
  period              = 300
  statistic           = "Average"
  threshold           = 90

  dimensions = {
    InstanceId = aws_instance.ec2-instance-1.id
    path       = "/"
    device     = "nvme0n1p16"
    fstype     = "ext4"
  }

  alarm_actions = [
    aws_sns_topic.alerts-1.arn
  ]
}

resource "aws_cloudwatch_log_metric_filter" "sudo_usage_1" {
  name           = "SudoUsage"
  log_group_name = aws_cloudwatch_log_group.auth_logs-1.name

  pattern = "COMMAND="

  metric_transformation {
    name      = "SudoCommands"
    namespace = "SecurityMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "sudo_alarm_1" {
  alarm_name          = "SudoCommandsDetected"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "SudoCommands"
  namespace           = "SecurityMetrics"
  period              = 300
  statistic           = "Sum"
  threshold           = 10

  alarm_actions = [
    aws_sns_topic.alerts-1.arn
  ]
}