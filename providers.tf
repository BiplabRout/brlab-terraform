terraform {

  # determines on top of which vversion the configuration file (.tf) can run.
  required_version = ">0.11.0"

  # detrmines which kind of version of the provider we should download
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>3.0"  # >=2.0 | <=2.0  |  >=1.0,<=2.0
    }
    arurerm = {
      source = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

/*
  1. we can have multiple providers in these file.
  2. alos for each provider we can have the terraform setting as well.
  3. all the providers will be downloaded and stored in the .terraform hidden folder , with a provider having
     seperate folder for them.
  4. All the providers can be downlaod using "terraform init"  command/cli
*/

provider "aws" {
  region = "eu-west-1"
  access_key = ""
  secret_key = ""
}

provider "azurerm" {
  features {}
}
