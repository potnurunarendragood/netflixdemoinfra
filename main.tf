provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "one" {
  count                  = 5
  ami                    = "ami-020728ad6199d7fa0"
  instance_type          = "c7i-flex.large"
  key_name               = "jenkins-server"
  vpc_security_group_ids = ["sg-031765443c186d41c"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["ansible", "dev-1", "dev-2", "test-1", "test-2"]
}


