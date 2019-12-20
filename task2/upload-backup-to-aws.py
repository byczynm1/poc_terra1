# upload-backup-to-aws.py
# POC (Mariusz Byczynski)


# this code upload previously backuped wordpress file to AWS S3 bucket
# AWS bucket should be created with versioning option


import boto3
s3 = boto3.resource("s3")
data = open("iamtest.txt", "rb")
s3.Bucket("byczynm1-backup").put_object(Key="test.txt", Body=data)
