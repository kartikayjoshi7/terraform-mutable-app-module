resource "aws_route53_record" "private-record" {
  count = var.LB_PRIVATE ? 1 : 0
  zone_id = data.terraform_remote_state.vpc.id.PRIVATE_HOSTED_ZONE_ID
  name    = "www.example.com"
  type    = "A"
  ttl     = 300
  records = [aws_eip.lb.public_ip]
}