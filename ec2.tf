module "srini-ec2"{
    source ="./modules/ec2"
    instance_type  = var.instance_type
    tag_Name = var.tag_Name
}
