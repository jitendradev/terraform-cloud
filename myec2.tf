 resource "aws_instance" "myec2v1" {
   ami = "ami-09f0bb8545fdc6d7c"
   instance_type = var.instance_type
   network_interface {
    network_interface_id = aws_network_interface.tf-cloud.id
    device_index         = 0
  }

} 

resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "terraform-cloud"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "ap-southeast-2a"

  tags = {
    Name = "terraform-cloud"
  }
}

resource "aws_network_interface" "tf-cloud" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}
