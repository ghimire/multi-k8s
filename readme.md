# Kubernetes React App with Postgres and Redis

## Steps
- Install Docker
- Build each images as multi-server, multi-worker, multi-client and push to Docker Hub
- Install minikube
- Apply the mandatory command with: `kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml`
- minikube addons enable ingress
- Apply the configs: `kubectl apply -f k8s`
- Get and visit the IP: `minikube ip`
- Voila!
