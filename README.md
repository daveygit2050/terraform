# terraform
For random terraform files

## aws-lab
Quickly setup a VPC environment with public and private subnets per AZ, an internet gateway, one NAT gateway per AZ, all required routing tables and a couple of security groups for bastion servers and private servers.

Run `terraform plan` with your public IP address and export the results to a file...

`terraform plan -var "access-cidr=1.2.3.4/32" -out=actions`

Then, if all is well, apply the changes...

`terraform apply "actions"`

When done with the environment, destory it (NAT gateways cost money!)...

`terraform destroy`

### Variables

The default variables are pretty much setup to suit me, but the behaviour can be overriden by adding additional `-var "key=value"` arguments...

|Key|Description|Default|
|-|-|-|
|name|Sets how resources are named/tagged|gs-lab|
|region|AWS region in which to create resources|eu-west-1|
|access-cidr|SSH traffic to the bastion SG is only allowed from here|0.0.0.0/0|
|az-suffixes|Which AZ's to create subnets and NAT gateways in|["a", "b", "c"]|
|public-cidrs|List of CIDR ranges for public subnets. Must have as least as many AZ's specified in *az-suffixes*|["10.100.10.0/23", "10.100.12.0/23", "10.100.14.0/23"]|
|private-cidrs|List of CIDR ranges for private subnets. Must have as least as many AZ's specified in *az-suffixes*|["10.100.20.0/23", "10.100.22.0/23", "10.100.24.0/23"]|
|vpc-cidr|CIDR range to use for the VPC. Must be inclusive of subnet CIDR ranges|10.100.0.0/16|
