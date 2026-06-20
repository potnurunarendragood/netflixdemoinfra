provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-0c78ef10ebf8c08db"
  instance_type          = "c7i-flex.large"
  key_name               = "junks"
  vpc_security_group_ids = ["sg-02ff09ea9be40159e"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "Monitoring server"]
}


}
