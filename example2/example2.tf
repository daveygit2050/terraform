provider "aws" {
  region     = "us-east-1"
}

module "consul" {
  source = "github.com/hashicorp/consul/terraform/aws"

  key_name = "dave-virginia"
  key_path = "~/keys/dave-virginia.pem"
  region   = "us-east-1"
  servers  = "3"
}

output "consul_address" {
  value = "${module.consul.server_address}"
}
