# data "template_file" "user_data" {
#   template = "${file("elk.sh")}"
# }

data "template_file" "user_data" {
  template = "${file("elk.sh")}"
}





resource "aws_instance" "elk-itps" {
  ami             = "ami-0f8243a5175208e08"
  instance_type   = "t2.xlarge"
  subnet_id       = aws_subnet.dev-public-subnet-1a.id
  security_groups = ["${aws_security_group.elk-security-group.id}"] 
  key_name        = "${aws_key_pair.petclinicn.id}"
  user_data       = file("elk.sh")
  tags = {
    Name = "elk"
  }
}


 



