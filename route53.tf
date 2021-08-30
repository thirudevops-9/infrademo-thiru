# resource "aws_route53_zone" "venkatcloud" {
#   name = "venkatcloud.xyz"

#   tags = {
#     Environment = "dev"
#   }
# }



# resource "aws_route53_record" "jenkins" {
#   zone_id = aws_route53_zone.venkatcloud.zone_id
#   name    = "testing.venkatcloud.xyz"
#   type    = "CNAME"
#   ttl     = "300"
#   records = ["${aws_lb.testing-jenkins.dns_name}"]
# }




