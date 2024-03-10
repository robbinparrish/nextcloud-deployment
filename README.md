## Disclaimer.
The content on this account/repository provided solely for educational and informational purposes.
It is not intended for use in making any kind of business, investment and/or legal decisions.
Although every effort has been made to keep the information up-to-date and accurate, no representations and/or warranties, express and/or implied, completeness, accuracy, reliability, suitability, and/or availability of the content.

## NextCloud.
This can be used to setup a NextCloud Server.  
NextCloud - https://docs.nextcloud.com/

Since the NextCloud image default uses non-root user in image and this user does not have write permission to host directory with bind mount. Need to perform followings to make it work with bind mount.
```bash
mkdir -p ./nextcloud-data/nextcloud/{www,custom_apps,config} ./nextcloud-data/data
chown -R 33:33 ./nextcloud-data/
```

For backup of postgresql database we will need to create a directory and set the correct ownership.
```bash
mkdir -p ./pgsql-db/backups
chown -R 1000:1000 ./pgsql-db/backups
```

## Docker Compose Version.
Always validate that [docker-compose](https://github.com/docker/compose/releases/) version is latest.
If not then use the latest released version. As of updating this document `v2.24.0` was latest released version.

## Email Configuration.
Email configuration for SMTP is by default disabled. If requires then it should be configured in the `docker-compose.yml` file.

### Starting the container.
```bash
docker-compose up -d
```

### Checking the container logs.
```bash
docker-compose logs -f
```

### Once Container is successfully created, we can access the webui in the browser - http://IPADDR_OF_SYSTEM
- Default username and password - admin/admin

### Setting up first time.
- https://docs.nextcloud.com/server/latest/admin_manual/index.html

[Additional Configuration](./configs/additional-configs.md)

[Backup and Restore](./configs/backup-and-restore.md)

[Upgrading NextCloud](./configs/upgrading-nextcloud.md)
