terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
locals {
  instance_number = 4
}

resource "aws_instance" "ec2_instancess" {
  count = 3
  ami = "ami-0c768662cc797cd75"
  instance_type = "t2.micro"
  subnet_id = "subnet-01e6a2019fe516e70"
  iam_instance_profile = "SSM_FULL"
  security_groups = [ "sg-0f5a5696d16c4d5de" ]
  key_name = "MyKey"
  associate_public_ip_address = true
  user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install git -y
git clone https://github.com/Akhamesra/Prometheus_grafana_script.git
cd Prometheus_grafana_script
sudo sh install-node-exporter.sh
            EOF
  tags = {
    Name = "Node ${local.instance_number + count.index}"
  }
}