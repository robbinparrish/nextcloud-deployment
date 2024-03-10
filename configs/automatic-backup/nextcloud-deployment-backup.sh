#!/bin/bash

# Path where the NextCloud deployment is configured.
# NEED TO REPLACE THEASE TO CORRECT PATH.
NEXTCLOUD_DEPLOYMENT_DIR="${HOME}/nextcloud-deployment"
NEXTCLOUD_DEPLOYMENT_BACKUP_PATH="${HOME}/nextcloud-deployment-backup"

# Backup directory.
BACKUP_TIME=$(date "+%d%m%Y%H%M%S")
NEXTCLOUD_DEPLOYMENT_BACKUP_DIR="${NEXTCLOUD_DEPLOYMENT_BACKUP_PATH}/${BACKUP_TIME}"

cd "${NEXTCLOUD_DEPLOYMENT_DIR}" || exit 1

# Enable maintenance mode.
docker-compose exec -it --user www-data nextcloud php occ maintenance:mode --on

# Backup configuration files.
mkdir -p "${NEXTCLOUD_DEPLOYMENT_BACKUP_DIR}"
cp -av ./nextcloud-data/nextcloud/www ./nextcloud-data/nextcloud/custom_apps \
    ./nextcloud-data/nextcloud/config ./nextcloud-data/data "${NEXTCLOUD_DEPLOYMENT_BACKUP_DIR}"/

# Create backup.
mkdir -p ./pgsql-db/backups
chown -R 1000:1000 ./pgsql-db/backups
docker-compose exec -it pgsql-db /usr/bin/pg_dumpall --clean -U postgres > ./pgsql-db/backups/pgsql-db-backup.sql
mv -fv ./pgsql-db/backups/pgsql-db-backup.sql "${NEXTCLOUD_DEPLOYMENT_BACKUP_DIR}"/
sync

# Disable maintenance mode.
docker-compose exec -it --user www-data nextcloud php occ maintenance:mode --off

# Compress the backup.
cd "${NEXTCLOUD_DEPLOYMENT_BACKUP_PATH}" || exit 1
tar -cvzf "${BACKUP_TIME}".tar.gz "${BACKUP_TIME}"
rm -rf "${BACKUP_TIME}"
sync
