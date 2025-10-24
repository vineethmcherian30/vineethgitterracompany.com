resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = { Name = "${var.project}-instance" }
}

output "instance_id" { value = aws_instance.this.id }
output "public_ip" { value = aws_instance.this.public_ip }
