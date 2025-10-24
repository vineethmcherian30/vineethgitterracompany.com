# This root calls the project root as a module
module "root" {
  source = "../../"
  project = var.project
  aws_region = var.aws_region
}
