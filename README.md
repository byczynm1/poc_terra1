# Terraform - POC
#### Design
![Design POC](https://github.com/byczynm1/poc_terra1/blob/master/POC_terra1.png?raw=true)

	
#### Description
	
	My POC was created to show method to backup data from one cloud provider like Google, AWS, Azure and restore data to another cloud provider f.e Azure.
	
	Server with installed software Ansible, Jenkins server is located on AWS cloud. 
	DNS name : terra2.xcopy.space
	
		This method should include  :
			- Backup and restore data /var/www/html/wordpress
			- Software installation Apache, MariaDB, wordpress, etc via Ansible.
			- Creating virtual machines on different cloud providers with using Terraform.
			- User rights
			- Public and private key. 
			- swap_creation to enhance memory
			- Backup log file - stored on save place
			- Rebooting
			- provider accounts 
			- Jenkins as a CI-CD software 
			- GIT as source code repository with user rights and versioning. 
			- Migrating data using Python and Boto3 library through AWS.
			- separated networks to isolate source and destinations servers
			
			Scenario 1:
Tasks 1:
Google provider
Backup data from google - www1.filescopy.online (DNS google)
	- Backup.sh
	If backup directory "/backup" doesn't exist create new one
	Create backup log
	Make backup of /var/www/wordpress
	Make backup of database MariaDB 
	Write Dates and MD5SUMs of tarball files to backup log.
	

Backup Log 
"Directory /backup successfuly created
-rw-rw-rw-. 1 root root 39 Nov 26 09:24 /backup/log.txt
New backup of files and database www1.filescopy.online->2019-11-26-09-24-46
MD5SUM=b092fd0f08e51802715665e57a0b26c4  /backup/www1.filescopy.online-var-www-html-wordpress
DATE=2019-11-26-09-24-46
Backup database ->/backup/www1.filescopy.online-all-databases-copy.sql.tar
MD5SUM_DATABASE=5701f559d75de2e25b3257bafc859915  /backup/www1.filescopy.online-all-databases-copy.sql.tar"

Task 2
Upload backup data to AWS S3 bucket 
	- Boto3 upload backup file to AWS from www1.filescopy.online to S3 bucket "byczynm1_backup"
	
	Upload to S3:
	- www files
	- database
	- backup log file with dates and MD5SUMs.
	
	
		
account: blindcomm18@gmail.com

www1.filescopy.online - details
Instance : small
Centos8
Httpd - apache
Wordpress
Specific user rights on /var/www/html 
MariaDB
0.8 GB RAM
10 GB HDD
Swap 1GB


Task 3:
AWS
Create Virtual Machine on AWS aws-www1.filescopy.online via terraform. 

	- create instance EC2 t2.micro
	- Create public_IP
	- Install Linux Centos8
	- Create SWAP 1GB
	- Create security group,  (ssh, http)
	- Create public and private key and export public to AWS

Task4:
AWS
Update OS to latest version. 
aws-www1.filescopy.online
Install software Apache, MariaDB
Update software to latest version
Install Wordpress from zip repo. 
Change user rights for Wordpress and /var/www/html dir.  

Task 5
AWS
Restore backup from S3 bucket 
aws-www1.filescopy.online
Restore data for /var/www/html
Restart MariaDB, Apache

Task 6
Healtcheck
Check wordpress via web browser 
aws-www1.filescopy.online
