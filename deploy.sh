set -e

NAME = "kubernetes-basic-api"
USERNAME = "yashmahto"
IMAGE = "$USERNAME/$NAME:latest"

echo "Building Docker image..."
docker build -t $IMAGE .

echo "Pushing Docker image to Docker Hub..."
docker push $IMAGE

echo "Deploying to Kubernetes..."
kubectl apply -f k8s-deployment.yaml
kubectl apply -f k8s-service.yaml

echo "getting pods..."
kubectl get pods

echo "getting services..."
kubectl get services

echo "fetching the main service"
kubectl get services $NAME-service



