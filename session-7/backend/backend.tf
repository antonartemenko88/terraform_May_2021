terraform {
  backend "s3" {
    bucket = "terraform-may-2021-session-remote-state2"
    key    = "session-7/backend.tfstate"
    region = "us-east-1"

  }
}