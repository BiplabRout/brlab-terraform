resource "aws_instance" "myec2" {
  ami = var.ami-id                                # variable calling applicable from 0.12 terraform version onwards
  instance_type = "${var.instance-type}"            # variable calling applicable for all version of terraform
  tags = var.tag-name
}
