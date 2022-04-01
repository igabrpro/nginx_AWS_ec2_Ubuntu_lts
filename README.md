# Install Nginx on AWS EC2 Ubuntu using Packer

## Description:
This repo contains autaomation packer script so you can create a AWS ec2 instance with nginx installed on Ubuntu 20.04 version

## Prerequisites
You need packer tool installed on your local machine
You need your AWS account `aws_access_key` and `aws_secret_access_key`,you may also need `aws_session_token` and `aws_session_expiration`

## How to install packer 
Download Packer from [here](https://www.packer.io/).
Install instructions [here](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli).

## Build the image with packer
1. Download the repo
     git clone https://github.com/igabrpro/nginx_AWS_ec2_Ubuntu_lts_Packer.git
2. Go to the directory nginx_AWS_ec2_Ubuntu_lts_Packer 'cd nginx_AWS_ec2_Ubuntu_lts_Packer'
3. Export your 'aws_access_key', 'aws_secret_access_key' and `aws_session_token`as an env variables
     export AWS_ACCESS_KEY_ID=
     export AWS_SECRET_ACCESS_KEY=
     export AWS_SESSION_TOKEN=
4. Note that nginx-ubuntu.pkr.hcl will configure ec2 in us-west-2 you can change this but note taht ami images are diferent in the diferent regions, so this image may not be avalialbe so if you cange the region you may need to change 'source_ami'
5. To start the build execute 'packer build nginx-ubuntu.pkr.hcl'
6. after triggering the command you shuld get simila output to 
```
==> Builds finished. The artifacts of successful builds are:
--> nginx-install.amazon-ebs.ubuntu-focal: AMIs were created:
us-west-2: ami-0e72ebc8cdcf64ced
```
