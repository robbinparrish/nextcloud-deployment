## Additional configuration to perform after deploying the NextCloud server.

### First thing before modifying anything on server is to set the `admin` user password and email address.
- https://docs.nextcloud.com/server/stable/admin_manual/

```Please note that followings configuration may not be accurate for every deployments. These settings allowed Admin to make sure the NextCloud server is configured with necessary additional configuration.```

## Navigate to the `Apps Setting Panel` for modifying system-wide settings.

### Your apps.
- `Disable` some default applications.
	- `Federation`
	- `First run wizard`
	- `Nextcloud announcements`
	- `Support`
	- `Usage survey`
	- `Weather status`

## Navigate to the `Admin Setting Panel` for modifying system-wide settings.

### Personal Settings.
- Personal info.
	- Configure `Email` address and `Full Name` for admin user.
	- `Edit your profile visibility`.
		- Change the visibility to make sure Admin profile is private.
- Security.
	- `Password` Change the password.
- Notifications.
	- From `Activity` Enable required `notifications` that need to be shared using `mail`.
- Appearance and accessibility.
	- Keyboard shortcuts.
		- `Disable` all keyboard shortcuts.

### Administration Settings.
- Sharing.
	- Allow users to share via link and emails.
		- `Enable` always ask for a password.
		- `Enable` Enforce password protection.
	- `Enable` Set default expiration date for shares.
		- `Enable` Enforce expiration date.
	- `Enable` Set default expiration date for shares via link or mail.
		- `Enable` Enforce expiration date for remote shares.
	- Default share permissions.
		- `Uncheck` Reshare and Delete.
	- Federated Cloud Sharing.
		- `Disable` all share functionalities for federated cloud sharing.
- Security.
	- Password policy.
		- `Disable` Check password against the list of breached password.
	- OAuth 2.0 clients.
		- [OAuth 2.0 configuration](https://docs.nextcloud.com/server/stable/admin_manual/configuration_server/oauth2.html)
- Usage survey.
	- Data to send.
		- `Uncheck` all from the list.

