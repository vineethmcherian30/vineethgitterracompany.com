resource "aws_cloudwatch_metric_alarm" "cpu" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alarm when CPU > 80%"
  dimensions = {
    InstanceId = var.instance_id
  }
}
output "alarm_name" { value = aws_cloudwatch_metric_alarm.cpu.alarm_name }
