terraform {
  backend "s3" {
    bucket         = "ot-cloud-kit-bucket"
    key            = "ot/module/peering/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}