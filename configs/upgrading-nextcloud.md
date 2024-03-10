## Upgrading NextCloud to latest Stable Release.

**NOTE** - Before proceeding further please make sure that you have created a backup. If not then follow [Backup and Restore](./backup-and-restore.md) to create a backup.

### Identify the latest released version.
- https://hub.docker.com/_/nextcloud/tags
- https://hub.docker.com/_/postgres/tags
- https://hub.docker.com/_/nginx/tags
- https://hub.docker.com/_/redis/tags

Once the latest released version is identified we can update the corresponding version in the [docker-compose.yml](./../docker-compose.yml) file.

Once version is updated, recreate container so it can use new version.

### Upgrading the container.
```bash
docker-compose up -d
```

### Checking the container logs.
```bash
docker-compose logs -f
```

### After upgrade finishes, run the migration steps.
```bash
docker-compose exec -it --user www-data nextcloud php occ db:add-missing-columns
docker-compose exec -it --user www-data nextcloud php occ db:add-missing-indices
docker-compose exec -it --user www-data nextcloud php occ db:add-missing-primary-keys
```
