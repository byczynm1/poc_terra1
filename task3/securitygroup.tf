resource "aws_security_group" "allow-wordpress" {
  vpc_id      = aws_vpc.main.id
  name        = "allow-wordpress"
  description = "security group that allows ingress and egress traffic for wordpress server"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "allow-wordpress"
  }
}

resource "aws_security_group" "allow-http" {
  vpc_id      = aws_vpc.main.id
  name        = "allow-http"
  description = "security group that allows http and all egres traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-http"
  }
}

