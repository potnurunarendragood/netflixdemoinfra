provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-020728ad6199d7fa0"
  instance_type          = "c7i-flex.large"
  key_name               = "jenkins-server"
  vpc_security_group_ids = ["sg-0b32812d346d9d1f2"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "Monitoring server"]
}


