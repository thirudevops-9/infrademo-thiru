# create jenkins server
# add ami liunx
# selete instance type
#selete the private subnet id
#add  the jenkins sg id
#launch the key pair(ssh-keygen local)
# copy the key pair into pem file
#tag the name 

data "template_file" "userr_data" {
  template = "${file("install_jenkins.sh")}"
}

resource "aws_instance" "dev-jenkins" {
  ami             = "ami-0443305dabd4be2bc"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.dev-private-subnet-1a.id
  security_groups = ["${aws_security_group.jenkins-security-group.id}", "${aws_security_group.bastion-security-roup.id}"]
  key_name        = "${aws_key_pair.petclinicn.id}"
  user_data       = file("install_jenkins.sh")
  tags = {
    Name = "dev-jenkins"
  }
}


output "jenkins_endpoint" {
  value = formatlist("/var/lib/jenkins/secrets/initialAdminPassword")
}


  