resource "aws_security_group" "ec2_public_security_group" {
  name        = "Web-ALB-SG"
  description = "Web ALB Security Group - Allow external web traffic"
  vpc_id      = aws_vpc.msr_vpc.id

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow web traffic to load balancer"
  }


  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { 
           Name = "${var.platform_name}-${var.application_name}-${var.Environment}-ec2_public_sg"
    }
}

