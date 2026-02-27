terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0"
    }
  }
}

provider "aws" {
}

########################################################
/*
// calling ec2 module
variable "tags_info" {
  type        = list(string)
  description = "list of env"
  default     = ["dev","prod"]
}

module "srini-ec2"{
  for_each =  var.tags_info
    source ="./modules/ec2"
    instance_type  = var.instance_type
    tag_Name = each.value
}
*/

####################################################
variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8200, 8201,8300, 9200, 9500]
}


resource "aws_security_group" "demo_sg" {
  name        = "srini-sg"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  
  dynamic "egress" {
    for_each = var.sg_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

