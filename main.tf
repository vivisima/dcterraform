provider "aws" {
  region  = "us-east-1"
  version = "~> 2.0"
}

# specify another aws region, a good use of alias @gomex
/* provider "aws" {
  alias = "west"
  region  = "us-west-2"
  version = "~> 2.0"
} */

terraform {
  backend "s3" {
    bucket = "viterraform"
    key    = "dcterraform.tfstate"
    region = "us-east-1"
  }
}