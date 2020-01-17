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
