#___Route 53___________________________________________________________________________________________________
# resource "aws_route53_zone" "c0fee"{
# 	name = "c0ffea.com"
# }

data "aws_route53_zone" "c0fee" {
  name = "c0ffea.com"
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
	for_each = {
    for dvo in aws_acm_certificate.c0fee.domain_validation_options : dvo.domain_name => {
      name    = dvo.resource_record_name
      record  = dvo.resource_record_value
      type    = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id = data.aws_route53_zone.c0fee.id
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
  validation_record_fqdns = [for record in aws_route53_record.c0fee_certificate : record.fqdn]
}
