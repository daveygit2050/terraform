terraform {
  backend "s3" {
    bucket = "dave-general"
    key    = "terraform/test"
    region = "eu-west-1"
  }
}
