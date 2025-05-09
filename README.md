### Docker build Image
```sh
docker build -t <image_name>:<version> .
```

### Docker run Image
```sh
docker run -p <host_port>:<container_port>  --name <container_name> \
       --hostname <host_name> 
       --network <custom_network>
```
