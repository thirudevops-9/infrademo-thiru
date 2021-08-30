resource "aws_lb" "app-alb-jaga" {
  name               = "app-alb-jaga-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-security-group.id]
  subnets            = ["${aws_subnet.dev-public-subnet-1a.id}", "${aws_subnet.dev-public-subnet-1b.id}" , "${aws_subnet.dev-public-subnet-1c.id}"]

  enable_deletion_protection = true


  tags = {
    Environment = "dev"
  }
}


# instance target group

resource "aws_lb_target_group" "app-alb-jaga" {
  name     = "app-alb-jaga-lb-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   =  aws_vpc.dev-vpc.id
}



resource "aws_lb_target_group_attachment" "app-alb-jaga" {
  target_group_arn = aws_lb_target_group.app-alb-jaga.arn
  target_id        = aws_instance.dev-app.id
  port             = 8080
}





# listner


resource "aws_lb_listener" "rwwn_end" {
  load_balancer_arn = aws_lb.app-alb-jaga.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app-alb-jaga.arn
  }
}