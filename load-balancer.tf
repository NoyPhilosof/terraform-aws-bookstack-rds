# Create load balancer
resource "aws_lb" "lb-lesson9" {
  name               = "lb-lesson9"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg-lesson9.id]
  subnets            = [aws_subnet.use1c-lesson9.id, aws_subnet.use1a-lesson9.id]

  enable_deletion_protection = false
}

# Create lb target group
resource "aws_lb_target_group" "lb-tg-lesson9" {
  name     = "lb-tg-lesson9"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc-lesson9.id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/status"
    port                = "traffic-port"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    protocol            = "HTTP"
    matcher             = "200"
  }
}

# Create listener for lb
resource "aws_lb_listener" "lb-lister-lesson9" {
  load_balancer_arn = aws_lb.lb-lesson9.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-tg-lesson9.arn
  }
}

# Attach lb to auto scaling group
resource "aws_autoscaling_attachment" "asg-attach-lesson9" {
  autoscaling_group_name = aws_autoscaling_group.asg-lesson9.name
  lb_target_group_arn   = aws_lb_target_group.lb-tg-lesson9.arn
}
