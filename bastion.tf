# # create bastion server
# # add ami liunx
# # selete instance type
# #selete the public subnet id
# #add  the bastion sg id
# #launch the key pair(ssh-keygen local)
# # copy the key pair into pem file
# #tag the name 




resource "aws_instance" "dev-bastion" {
  ami             = "ami-0443305dabd4be2bc"   
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.dev-public-subnet-1a.id
  security_groups = ["${aws_security_group.bastion-security-roup.id}"]
  key_name        = "${aws_key_pair.petclinicn.key_name}"
  tags = {
    Name = "dev-bastion"
  }
}













resource "aws_key_pair" "petclinicn" {
  key_name   = "petclinicn-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJlceIY3JeiY/Th1ve92j+RngxVwyeARqry9NycbkhYzgP96QNWljht5UW6gz6dk3+nMQhG41JWI13vWtlOgHSLMvsSkhzgzB3TdA58OYzVYW3QHrxiyG2Cl3dqaTquEFpme0TBA6+nXER8RSmcHGvHTwOH2HDn70skBmh9jUWPCaHpJ5D/D8/oUWNutmOj58dufnuMRgxSHAvRi4iSu25hgxZIpdCXaHx1xjwmF+alvBgPFbG/0YXQdfwjzoOMxPY5mdxA8D2VNS/in6YX2JR4CVoUK9q7SMAKrkhwAT+8oaSlsDMOhgxaK5lt6cLkrFRSyQbQ1F0U6S7isE4opAH reddy@nagesh"
}  