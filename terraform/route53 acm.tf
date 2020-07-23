#___Route 53___________________________________________________________________________________________________
resource "aws_route53_zone" "c0fee"{
	name = "c0fee.com"
}

resource "aws_route53_record" "c0fee" {
  zone_id = aws_route53_zone.c0fee.zone_id
  name    = aws_route53_zone.c0fee.name
  type    = "A"

  alias {
    name                   = aws_lb.c0fee.dns_name
    zone_id                = aws_lb.c0fee.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "c0fee_certificate" {
  zone_id = aws_route53_zone.c0fee.id
  name    = aws_acm_certificate.c0fee.domain_validation_options[0].resource_record_name
  type    = aws_acm_certificate.c0fee.domain_validation_options[0].resource_record_type
  records = [aws_acm_certificate.c0fee.domain_validation_options[0].resource_record_value]
  ttl     = 60
}


#___ACM_______________________________________________________________________________________________________
resource "aws_acm_certificate" "c0fee" {
  domain_name               = aws_route53_zone.c0fee.name
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
