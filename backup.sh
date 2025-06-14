#!/bin/bash

# Mysql user and password
USER_DB ="root"
PASSWD = "YourPassWord4321"

# Timestamp for backup directory
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="/backups/lamp_backup_$TIMESTAMP"
mkdir -p $BACKUP_DIR

# Backup Apache configs
cp -R /etc/apache2 $BACKUP_DIR/apache2_configs

# Backup website files (adjust paths as needed)
tar -czf $BACKUP_DIR/website_files.tar.gz /var/www/html

# Backup MySQL/MariaDB databases
mysqldump --user=$USER_DB --password=$PASSWD  --all-databases > $BACKUP_DIR/all_databases.sql

# Compress entire backup
tar -czf /backups/full_backup_$TIMESTAMP.tar.gz $BACKUP_DIR

# Cleanup temporary files
rm -rf $BACKUP_DIR

echo "Backup saved to: /backups/full_backup_$TIMESTAMP.tar.gz"
