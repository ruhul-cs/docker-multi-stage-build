echo "DOCKER HOT RELOAD PROCESS.. .."
image_id=$(docker images --filter "reference=x:v1"  --format "{{.ID}}")
echo $image_id
if [ -n "${image_id}" ]; then
    container_id=$(docker ps --filter ancestor=x:v1 --format "{{.ID}}")
    if [ -n "${container_id}" ]; then
        docker stop "$container_id"
        echo "$container_id stopped..."
        docker rm "$container_id"
        echo "$container_id removed..."
    else
        docker rmi x:v1 -f
        echo "removed image"
        
    fi
else 
    echo "image id not found"
fi

docker build --network=host -t x:v1 .
echo "Built image"
docker run -p 5000:5000 x:v1
echo "Running container"

