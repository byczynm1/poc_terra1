# Wordpress backup (Mariusz Byczynski) 
# backup files and database, 
# write changes to log file,
# upload files to AWS S3 bucket


# variables
BACKUP_DIR="/backup"
LOG_FILE="$BACKUP_DIR/log.txt"
HOSTNAME="www1.filescopy.online"
DATE=`date '+%Y-%m-%d-%H-%M-%S'`

# check if directory backup exist
if [ -x $BACKUP_DIR ]; then
  echo "directory $BACKUP_DIR exist"  | sudo tee -a $LOG_FILE
else  
   sudo mkdir $BACKUP_DIR | sudo tee -a $LOG_FILE
   sudo chmod a+rwx $BACKUP_DIR | sudo tee -a $LOG_FILE
   echo -e "\nDirectory $BACKUP_DIR successfuly created" | sudo tee -a $LOG_FILE  
fi

# if file log.txt doesn't exist create new one.  
if [ -f $LOG_FILE ];  then 
   sudo chmod a+w $LOG_FILE
   sudo ls -la $LOG_FILE | sudo tee -a $LOG_FILE
   echo "New backup of files and database $HOSTNAME->$DATE" | sudo tee -a $LOG_FILE
else
   # log file doesn't exist
   sudo touch $LOG_FILE
   sudo chmod a+w $LOG_FILE  
fi


# wordpress files backup
echo "Backup files-> echo $HOSTNAME-var-www-html-wordpress"
sudo tar -czvf $BACKUP_DIR/$HOSTNAME-var-www-html-wordpress /var/www/html/wordpress
MD5SUM=`md5sum "$BACKUP_DIR/$HOSTNAME-var-www-html-wordpress"`
echo "MD5SUM=$MD5SUM" | sudo tee -a $LOG_FILE
echo "DATE=$DATE" | sudo tee -a $LOG_FILE

# wordpress database backup
mysqldump -u root -p"skmkazws20i903i@IAMJIW12kaJKOp" --all-databases > $BACKUP_DIR/all-databases-copy.sql
sudo tar -czvf $BACKUP_DIR/$HOSTNAME-all-databases-copy.sql.tar $BACKUP_DIR/all-databases-copy.sql
MD5SUM_DATABASE=`md5sum "$BACKUP_DIR/$HOSTNAME-all-databases-copy.sql.tar"`
echo "Backup database ->$BACKUP_DIR/$HOSTNAME-all-databases-copy.sql.tar" | sudo tee -a $LOG_FILE
echo "MD5SUM_DATABASE=$MD5SUM_DATABASE" | sudo tee -a $LOG_FILE
