echo "DOCKER HOT RELOAD PROCESS.. .."
container_id=$(docker ps --filter ancestor=x:v1 --format "{{.ID}}")
if [ -n "${container_id}" ]; then
    echo "Container exists: $container_id"
    docker stop "$container_id"
    echo "Stopped container: $container_id"
fi
docker rmi x:v1 -f
echo "Removed image"
docker build --network=host -t x:v1 .
echo "Built image"
docker run -p 5000:5000 x:v1
echo "Running container"

#docker images --filter "reference=x:v1" --format "{{.Repository}}:{{.Tag}} => {{.ID}}"