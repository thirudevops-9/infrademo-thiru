# # create bastion server
# # add ami liunx
# # selete instance type
# #selete the public subnet id
# #add  the bastion sg id
# #launch the key pair(ssh-keygen local)
# # copy the key pair into pem file
# #tag the name 




resource "aws_instance" "dev-bastion" {
  ami             = "ami-0f8243a5175208e08"   
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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDw4nMjzni41y5qlIWKGJD6VVmFDjDHfxcJ67ELx/y4TMACLHKMyXaDtIy4AElFrSsnZSFskRL+S5LJpg/x8fgFPXA3Y03qgxI23w4nGZE4tPuPKm3ryYwyoZbuJ48FHhONjxc7ZsxICkvmE5lpseIgzScIst03GXJmIAtE7glZoKw67FnkbnZnWacLXuRVb8wJeqpK3FO9cj9/4cbU6cxnGqEAI+5R1WiVdBw0mVknTPbNakiVQS+H742Lozbam1E422F6HLaymJhN8Kb7TgGKluntrDktRg5Odtkbnnsp4MEZHZzOIWn+vpM7MSrohCtbX5OK5a6TDOfIK6LN/phi+bmIm0ySRr7GyVMbAlyAKBJbbk7J5igEBmK7yY4NYUM54ozF/tExlDSMKi/Ai+bPSI4cUcV/kPp1MNpIlDvTcDI1xklfD2HNEogxoq/4Doc5wm+MWmqbN4ce/vUMrYkeq9vHJ9cZXbNOaLyy/J4Ddpu7m69j9HN0e8wRryKhDv8= girie@LAPTOP-JVC21MB8"
}  