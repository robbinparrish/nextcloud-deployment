# Perform an automatic backup of NextCloud Deployment.

## Copy backup script.
```bash
cp -a nextcloud-deployment-backup.sh /usr/bin/
chmod +x /usr/bin/nextcloud-deployment-backup.sh
```

## Update the configuration path in the backup script.
Update following in `/usr/bin/nextcloud-deployment-backup.sh`
```
NEXTCLOUD_DEPLOYMENT_DIR="${HOME}/nextcloud-deployment"
NEXTCLOUD_DEPLOYMENT_BACKUP_PATH="${HOME}/nextcloud-deployment-backup"
```

## Copy systemd unit and timer files.
```bash
cp nextcloud-deployment-backup.timer nextcloud-deployment-backup.service /etc/systemd/system/
```

## Enable the timer.
```bash
systemctl daemon-reload
systemctl enable --now nextcloud-deployment-backup.timer
```