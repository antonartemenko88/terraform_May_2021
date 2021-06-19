resource "aws_autoscaling_group" "web_asg" {
  name     = "${var.env}-web-asg"
  max_size = 5
  min_size = 3
  //   health_check_grace_period = 300
  //   health_check_type         = "ELB"
  desired_capacity     = 3
  launch_configuration = aws_launch_configuration.web-1.name
  vpc_zone_identifier  = data.aws_subnet_ids.default.ids

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
  }
}

# desired = 3       normal hours, 3 instances are good
# maximum = 5       peak hours, 5 instances are good

resource "aws_autoscaling_attachment" "web_lb_attachment" {
  autoscaling_group_name = aws_autoscaling_group.web_asg.id
  alb_target_group_arn   = aws_lb_target_group.web_tg.arn
}