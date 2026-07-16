resource "aws_cloudwatch_dashboard" "dashboard-1" {
  dashboard_name = "dashboard-1"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 6
        height = 6

        properties = {
          metrics = [
            [
              "AWS/EC2",
              "CPUUtilization",
              "InstanceId",
              aws_instance.ec2-instance-1.id
            ]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "CPU Utilization"
          view   = "timeSeries"
        }
      },
      {
        type   = "metric"
        x      = 6
        y      = 0
        width  = 6
        height = 6

        properties = {
          metrics = [
            [
              "CWAgent",
              "mem_used_percent",
              "InstanceId",
              aws_instance.ec2-instance-1.id
            ]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "Memory Utilization"
          view   = "timeSeries"
        }
      },
      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 6
        height = 6

        properties = {
          metrics = [
            [
              "CWAgent",
              "disk_used_percent",
              "InstanceId",
              aws_instance.ec2-instance-1.id,
              "path",
              "/",
              "device",
              "nvme0n1p16",
              "fstype",
              "ext4"
            ]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "Disk Utilization"
          view   = "timeSeries"
        }
      },
      {
        type   = "metric"
        x      = 6
        y      = 6
        width  = 6
        height = 6

        properties = {
          metrics = [
            [
              "AWS/EC2",
              "NetworkIn",
              "InstanceId",
              aws_instance.ec2-instance-1.id
            ]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "Network In"
          view   = "timeSeries"
        }
      },
      {
        type   = "metric"
        x      = 0
        y      = 12
        width  = 6
        height = 6

        properties = {
          metrics = [
            [
              "AWS/EC2",
              "NetworkOut",
              "InstanceId",
              aws_instance.ec2-instance-1.id
            ]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "Network Out"
          view   = "timeSeries"
        }
      },
      {
        type   = "metric"
        x      = 6
        y      = 12
        width  = 6
        height = 6

        properties = {
          metrics = [
            [
              "SecurityMetrics",
              "UnauthorizedLoginAttempts"
            ]
          ]
          period = 300
          stat   = "Sum"
          region = var.aws_region
          title  = "UnauthorizedLoginAttempts"
          view   = "timeSeries"
        }
      },
      {
        type   = "metric"
        x      = 0
        y      = 18
        width  = 6
        height = 6

        properties = {
          metrics = [
            [
              "SecurityMetrics",
              "SudoCommands"
            ]
          ]
          period = 300
          stat   = "Sum"
          region = var.aws_region
          title  = "SudoCommands"
          view   = "timeSeries"
        }
      },
      {
        type   = "metric"
        x      = 6
        y      = 18
        width  = 6
        height = 6

        properties = {
          metrics = [
            [
              "AWS/EC2",
              "StatusCheckFailed",
              "InstanceId",
              aws_instance.ec2-instance-1.id
            ]
          ]
          period = 300
          stat   = "Maximum"
          region = var.aws_region
          title  = "StatusCheckFailed"
          view   = "timeSeries"
        }
      },
      {
        type   = "metric"
        x      = 0
        y      = 24
        width  = 6
        height = 6

        properties = {
          metrics = [
            [
              "AWS/EC2",
              "StatusCheckFailed_Instance",
              "InstanceId",
              aws_instance.ec2-instance-1.id
            ]
          ]
          period = 300
          stat   = "Maximum"
          region = var.aws_region
          title  = "StatusCheckFailed_Instance"
          view   = "timeSeries"
        }
      },
      {
        type   = "metric"
        x      = 6
        y      = 24
        width  = 6
        height = 6

        properties = {
          metrics = [
            [
              "AWS/EC2",
              "StatusCheckFailed_System",
              "InstanceId",
              aws_instance.ec2-instance-1.id
            ]
          ]
          period = 300
          stat   = "Maximum"
          region = var.aws_region
          title  = "StatusCheckFailed_System"
          view   = "timeSeries"
        }
      }
    ]
  })
}