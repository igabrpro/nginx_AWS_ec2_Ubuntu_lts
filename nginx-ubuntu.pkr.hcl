packer {
	required_plugins {
	  amazon = {
		version = ">= 0.0.1"
		source  = "github.com/hashicorp/amazon"
	  }
	}
  }

  
  source "amazon-ebs" "ubuntu-focal" {
	ami_name      = "Ubuntu-20.04-nginx-ivan"
	instance_type = "t2.micro"
	region        = "us-west-2"
	source_ami_filter {
	  filters = {
		name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
		root-device-type    = "ebs"
		virtualization-type = "hvm"
	  }
	  most_recent = true
	  owners      = ["099720109477"]
	}
	ssh_username = "ubuntu"
  }
  
  build {
	name    = "nginx-install"
	sources = [
	  "source.amazon-ebs.ubuntu-focal"
	]
  
	provisioner "shell" {
	  inline = [
		"echo Installing Nginx",
		"sleep 30",
		"sudo apt-get update",
		"sudo apt-get install -y nginx",
		"sudo su -",
		"sudo systemctl enable nginx.service",
	  ]
	}
	
  }

