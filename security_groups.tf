resource "aws_security_group" "mesos_agent" {
  name = "mesos_agent"
  description = "Mesos server to agent communitcation"

  ingress {
    from_port = 5051
    to_port = 5051
    protocol = "tcp"
    cidr_blocks = ["${var.subnet-public_cidr}"]
  }
  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = "${var.vpc_id}"
  tags {
    Name = "mesos_agent"
  }
}

resource "aws_security_group" "mesos_server" {
  name = "mesos_server"
  description = "Mesos agent to server communication"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 2181
    to_port = 2181
    protocol = "tcp"
    cidr_blocks = ["${var.subnet-private_cidr}"]
  }

  ingress {
    from_port = 2888
    to_port = 2888
    protocol = "tcp"
    cidr_blocks = ["${var.subnet-private_cidr}"]
  }

  ingress {
    from_port = 3888
    to_port = 3888
    protocol = "tcp"
    cidr_blocks = ["${var.subnet-private_cidr}"]
  }

  ingress {
    from_port = 5050
    to_port = 5050
    protocol = "tcp"
    cidr_blocks = ["${var.subnet-private_cidr}"]
  }

  ingress {
    from_port = 5051
    to_port = 5051
    protocol = "tcp"
    cidr_blocks = ["${var.subnet-private_cidr}"]
  }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["${var.subnet-private_cidr}"]
  }

  ingress {
    from_port = 8123
    to_port = 8123
    protocol = "tcp"
    cidr_blocks = ["${var.subnet-private_cidr}"]
  }

  ingress {
    from_port = 8181
    to_port = 8181
    protocol = "tcp"
    cidr_blocks = ["${var.subnet-private_cidr}"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = "${var.vpc_id}"
  tags {
    Name = "mesos_server"
  }
}
