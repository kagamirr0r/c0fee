#___Load Balancer____________________________________________________________________________________________
resource "aws_lb" "c0fee" {
  name                       = "c0fee"
  load_balancer_type         = "application"
  internal                   = false
  idle_timeout               = 60
  enable_deletion_protection = false

  subnets = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]

  access_logs {
    bucket  = aws_s3_bucket.alb_log.id
    enabled = true
  }

  security_groups = [
    module.http_sg.security_group_id,
    module.https_sg.security_group_id,
    module.http_redirect_sg.security_group_id,
  ]
}


#___Security Group____________________________________________________________________________________________
module "http_sg" {
  source      = "./modules/security_group/"
  name        = "http-sg"
  vpc_id      = aws_vpc.c0fee.id
  port        = 80
  cidr_blocks = ["0.0.0.0/0"]
}

module "https_sg" {
  source      = "./modules/security_group/"
  name        = "https-sg"
  vpc_id      = aws_vpc.c0fee.id
  port        = 443
  cidr_blocks = ["0.0.0.0/0"]
}

module "http_redirect_sg" {
  source      = "./modules/security_group/"
  name        = "http-redirect-sg"
  vpc_id      = aws_vpc.c0fee.id
  port        = 8080
  cidr_blocks = ["0.0.0.0/0"]
}

#___Listener_______________________________________________________________________________________________________

resource "aws_lb_listener" "redirect_http_to_https" {
  load_balancer_arn = aws_lb.c0fee.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.c0fee.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.c0fee.arn
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.c0fee.arn
  }
}

# resource "aws_lb_listener" "http" {
#   load_balancer_arn = aws_lb.c0fee.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type = "fixed-response"

#     fixed_response {
#       content_type = "text/plain"
#       message_body = "This is HTTP"
#       status_code  = "200"
#     }
#   }
# }

# #___Listener Rule_______________________________________________________________________________________________________
# resource "aws_lb_listener_rule" "c0fee" {
#   listener_arn = aws_lb_listener.https.arn
#   priority     = 100

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.c0fee.arn
#   }

#   condition {
#     path_pattern{
#     values = ["/*"]
#			}
#   }
# }

#___Target Group__________________________________________________________________________________________________________
resource "aws_lb_target_group" "c0fee" {
  name_prefix          = "c0fee"
  port                 = 3000
  protocol             = "HTTP"
  vpc_id               = aws_vpc.c0fee.id
  target_type          = "ip"
  deregistration_delay = 300

  lifecycle {
    create_before_destroy = true
  }

  health_check {
    path                = "/"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    matcher             = 200
    port                = "traffic-port"
    protocol            = "HTTP"
  }

  depends_on = [aws_lb.c0fee]
}

