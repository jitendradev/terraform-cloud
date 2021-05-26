terraform {
  backend "s3" {
    bucket = "asaws-attribute-demo-001"
    key    = "remote-backend.tfstate"
    region = "ap-southeast-2"
    shared_credentials_file = "/Users/tf_user/.aws/credentials"
    profile                 = "Workspace"
     }
} 