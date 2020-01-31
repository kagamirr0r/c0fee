#___Route 53___________________________________________________________________________________________________
data "aws_route53_zone" "c0fee" {
  name = "allcofee.com"
}

resource "aws_route53_record" "c0fee" {
  zone_id = data.aws_route53_zone.c0fee.zone_id
  name    = data.aws_route53_zone.c0fee.name
  type    = "A"

  alias {
    name                   = aws_lb.c0fee.dns_name
    zone_id                = aws_lb.c0fee.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "c0fee_certificate" {
  zone_id = data.aws_route53_zone.c0fee.id
  name    = aws_acm_certificate.c0fee.domain_validation_options[0].resource_record_name
  type    = aws_acm_certificate.c0fee.domain_validation_options[0].resource_record_type
  records = [aws_acm_certificate.c0fee.domain_validation_options[0].resource_record_value]
  ttl     = 60
}


#___ACM_______________________________________________________________________________________________________
resource "aws_acm_certificate" "c0fee" {
  domain_name               = data.aws_route53_zone.c0fee.name
  subject_alternative_names = []
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "c0fee" {
  certificate_arn         = aws_acm_certificate.c0fee.arn
  validation_record_fqdns = [aws_route53_record.c0fee_certificate.fqdn]
}


#___Load Balancer____________________________________________________________________________________________
resource "aws_lb" "c0fee" {
  name                       = "c0fee"
  load_balancer_type         = "application"
  internal                   = false
  idle_timeout               = 60
  enable_deletion_protection = true

  subnets = [
    aws_subnet.public.id
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

output "alb_dns_name" {
  value = aws_lb.c0fee.dns_name
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
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.c0fee.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "This is HTTP"
      status_code  = "200"
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
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "This is HTTPS"
      status_code  = "200"
    }
  }
}

resource "aws_lb_listener" "redirect_http_to_https" {
  load_balancer_arn = aws_lb.c0fee.arn
  port              = "8080"
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

#___Listener Rule_______________________________________________________________________________________________________
resource "aws_lb_listener_rule" "c0fee" {
  listener_arn = aws_lb_listener.https.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.c0fee.arn
  }

  condition {
    field  = "path-pattern"
    values = ["/*"]
  }
}

#___Target Group__________________________________________________________________________________________________________
resource "aws_lb_target_group" "c0fee" {
  name                 = "c0fee"
  vpc_id               = aws_vpc.c0fee.id
  target_type          = "ip"
  port                 = 80
  protocol             = "HTTP"
  deregistration_delay = 300

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

