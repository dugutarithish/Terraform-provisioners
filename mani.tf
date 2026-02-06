provider "aws" {
 region = ap-south-1
 }

 variable "cidr" {
 default = "10.0.0.0./16"

resource "aws_vpc" "myvpc" {
cidr_block = var.cidr
}


resource  "aws_key_pair" "example" {
key_name = "terraform-demo-rithi"
public_key = "file("~/.ssh/id_rsa.pub")"
}







provisioner "file" {
source = "app.py"
destination = /home/ubuntu/app.py
}

provisioner "remote-exec" {
inline  = {
"echo 'Hello from the remote instance'",
      "sudo apt update -y",  # Update package lists (for ubuntu)
      "sudo apt-get install -y python3-pip",  # Example package installation
      "cd /home/ubuntu",
      "sudo pip3 install flask",
      "sudo python3 app.py &",
    ]
  }
