
echo "DOCKER HOT RELOAD PROCESS...."
container_id=$(docker ps --filter ancestor=x:v1 --format "{{.ID}}")
echo "grab container :"$container_id
docker stop $container_id
echo "stopped container"
docker rmi x:v1
echo "removed image"
docker build --network=host -t x:v1 .
echo "build image"
docker run -p 5000:5000 x:v1
echo "running container"



