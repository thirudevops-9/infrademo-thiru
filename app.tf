resource "aws_instance" "dev-app" {
  ami             = "ami-0443305dabd4be2bc"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.dev-private-subnet-1a.id
  security_groups = ["${aws_security_group.app-security-group.id}", "${aws_security_group.bastion-security-roup.id}"]
  key_name        = "${aws_key_pair.petclinicn.id}"
  tags = {
    Name = "dev-app"
  }
}
