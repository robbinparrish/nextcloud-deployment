## Backup and Restore.
https://docs.nextcloud.com/server/latest/admin_manual/maintenance/index.html

### Backup NextCloud instance.
Since NextCloud stores all data in the `postgresql` database so we will need to backup the whole database.

All backups are stored in `./pgsql-db/backups` directory.  
Along with the backup following directories must be `manually` backed up.  
```
./nextcloud-data/nextcloud/www
./nextcloud-data/nextcloud/custom_apps
./nextcloud-data/nextcloud/config
./nextcloud-data/data
```

For backup of postgresql database we will need to create a directory and set the correct ownership.
```bash
mkdir -p ./pgsql-db/backups
chown -R 1000:1000 ./pgsql-db/backups
```

#### Maintenance mode.
- Before starting a backup, enable the maintenance mode.
```bash
docker-compose exec -it --user www-data nextcloud php occ maintenance:mode --on
```

- After backup finishes, disable the maintenance mode.
```bash
docker-compose exec -it --user www-data nextcloud php occ maintenance:mode --off
```

#### Triggering Backup.
Run following command to trigger the backup.
This will create a `.sql` file containing database.
```bash
docker-compose exec -it pgsql-db /usr/bin/pg_dumpall \
 --clean -U postgres > ./pgsql-db/backups/pgsql-db-backup.sql
```

#### Triggering Restore.
Followings conditions must be met for restore.
- A working NextCloud instance.

#### Restore.
- Stop the NextCloud container.
```bash
docker-compose down nextcloud
```

- Restore/Copy the configuration files.
```
First remove existing directories.
./nextcloud-data/nextcloud/www
./nextcloud-data/nextcloud/custom_apps
./nextcloud-data/nextcloud/config
./nextcloud-data/data

Now copy backed up directories.
Copy www to ./nextcloud-data/nextcloud/www
Copy custom_apps to ./nextcloud-data/nextcloud/custom_apps
Copy config to ./nextcloud-data/nextcloud/config
Copy data to ./nextcloud-data/data
```

- Copy the postgresql backup file for restore.
```
Copy pgsql-db-backup.sql file to ./pgsql-db/backups directory.
```

- Restore the postgresql backup.
```bash
docker-compose exec -it pgsql-db psql -U postgres -f /var/lib/postgresql/backups/pgsql-db-backup.sql
```

### Stop all the container.
```
docker-compose down
```

### Starting the container.
```
docker-compose up -d
```

### Checking the container logs.
```
docker-compose logs -f
```

### After restore finishes, update the systems data-fingerprint.
```bash
docker-compose exec -it --user www-data nextcloud php occ maintenance:data-fingerprint
```

#### Once Backup is restored login to the NextCloud instance and verify that all configurations and data are restored.

[Automatic Backup Setup](./automatic-backup/README.md)
