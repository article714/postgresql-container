#/bin/bash

set -x

LOG_FILE="/var/log/postgres_backups.log"

BACKUP_DIR="/backups"

PASSWORD=UNMOTDEPASSE

LIST_DBS=`sudo -u postgres  psql postgres -c "SELECT datname FROM pg_database WHERE datistemplate='f';" | grep -e '^ [a-z_A-Z]*$' | grep -v postgres`

cd /tmp

#cleanup
rm -f $LOG_FILE  

find $BACKUP_DIR -iname '*.pgdump' -ctime +7 -exec rm -f {} \; >> $LOG_FILE 2>&1

# backup
for db in $LIST_DBS; 
do
  LA_DATE=`date +%d%m%Y_%H%M`
  echo ">>>>> $LA_DATE: backing up $db" >> $LOG_FILE 
  sudo -u postgres -s pg_dump --format=c --no-owner ${db} > ${BACKUP_DIR}/${db}_Backup_${LA_DATE}.pgdump  
done
