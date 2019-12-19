# public IP will be used in ansible script
output myoutput {
  value = "${aws_instance.aws-www1-filescopy-online.public_ip}"
}
