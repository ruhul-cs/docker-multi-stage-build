
### Create nginx-selfsigned.crt and nginx-selfsigned.key for nginx reverse proxy server:

```bash
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout nginx-selfsigned.key -out nginx-selfsigned.crt
```