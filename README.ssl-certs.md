## SSL Certificate generation for NextCloud server.

### Generate Private Key.
```
openssl genrsa -out nextcloud.mydomain.com.key 4096
```

### Generate CSR.
```
openssl req -new -key nextcloud.mydomain.com.key -out nextcloud.mydomain.com.csr
```

### Now use this CSR file to buy the SSL certificates from CA Or create self-signed.
```
openssl x509 -in  nextcloud.mydomain.com.csr -out  nextcloud.mydomain.com.crt -req -signkey  nextcloud.mydomain.com.key -days 365
```

### Once done copy these certificates to certs directory ( `configs/certs` ) before running container.

