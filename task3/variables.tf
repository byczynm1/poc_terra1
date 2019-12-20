variable "AWS_REGION" {
  # frankfurt 
  default = "eu-central-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "/var/lib/jenkins/.ssh/id_rsa"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "/var/lib/jenkins/.ssh/id_rsa.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
    # Red Hat Enterprise Linux 8 (HVM), SSD Volume Type - ami-0badcc5b522737046
    "eu-central-1" = "ami-0badcc5b522737046"
    # my custom AMI - with terraform, django, python 
    "my-custom-redhat8" = "ami-0f2b824dde9e5bfcf"
  }
}

