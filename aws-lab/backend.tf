terraform {
  backend "s3" {
    bucket = "goldsquare-state"
    key = "terraform/aws-lab"
    region = "eu-west-1"
  }
}
