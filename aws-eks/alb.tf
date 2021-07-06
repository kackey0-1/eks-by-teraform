resource "aws_lb" "alb_test_env" {
  name               = "eks_test_env"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_test_env.id]
  subnets            = module.vpc.public_subnets
}

resource "aws_lb_listener" "listener_test_env" {
  load_balancer_arn = aws_lb.alb_test_env.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target_test_env.arn
  }
}

resource "aws_lb_target_group" "lb_target_test_env" {
  name     = "lb_target_test_env"
  port     = 30001
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}
