#!/usr/bin/env bash


######################################################
# By : Kabengwa Mark Patrick
# Year: 2019
######################################################

DATE=`date +%d%b%y`
TIME=$( date '+%F_%H:%M:%S' )
LOCAL_BACKUP_DIR="./add your directory here"
DB_HOST="mysql_db_dump"
LDB_HOST="mysql_db_restore"
DB_NAME="db_test"
DB_USER="user"
DB_PASSWORD="example"

############### create a back up folder for the day ########################
mkdir -p $LOCAL_BACKUP_DIR/backups/$DATE

############### move the last backup made into the old backup folder and then wait for the new one. add time to the name ########################
mv $LOCAL_BACKUP_DIR/backups/$DB_NAME.sql $LOCAL_BACKUP_DIR/backups/$DATE/$DB_NAME-$TIME.sql

############### create the Dump ################
docker exec -it $DB_HOST mysqldump --login-path=backup $DB_NAME > $LOCAL_BACKUP_DIR/$DB_NAME.sql

############### Update the live db  ################
cat $LOCAL_BACKUP_DIR/$DB_NAME.sql | docker exec -i $LDB_HOST mysql -h $LDB_HOST -u $DB_USER  -p$DB_PASSWORD $DB_NAME < $LOCAL_BACKUP_DIR/$DB_NAME.sql



