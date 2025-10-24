# Root module - wires modules together as an example

module "vpc" {
  source       = "./modules/vpc"
  project      = var.project
  cidr_block   = "10.0.0.0/16"
  azs          = ["${var.aws_region}a","${var.aws_region}b"]
  public_subnets  = ["10.0.1.0/24","10.0.2.0/24"]
  private_subnets = ["10.0.11.0/24","10.0.12.0/24"]
}

module "iam" {
  source  = "./modules/iam"
  project = var.project
}

module "storage" {
  source      = "./modules/storage"
  project     = var.project
  bucket_name = "${var.project}-state-bucket-example" # replace with real name if using
}

module "compute" {
  source       = "./modules/compute"
  project      = var.project
  ami_id       = "ami-12345678" # replace
  instance_type = "t3.micro"
  subnet_id    = module.vpc.public_subnet_ids[0]
}

module "monitoring" {
  source  = "./modules/monitoring"
  project = var.project
  alarm_name = "${var.project}-ec2-cpu-alarm"
  instance_id = module.compute.instance_id
}
