resource "aws_sns_topic" "alerts-1" {
  name = "critical-alerts"
}

resource "aws_sns_topic_subscription" "email-1" {
  topic_arn = aws_sns_topic.alerts-1.arn
  protocol  = "email"
  endpoint  = "frankjobby2@gmail.com"
}