# Kubernetes React App with Postgres and Redis (with Minikube)

## Running
- Install Docker Desktop
- Build each images and push to Docker Hub
1. docker build -t ghimire/multi-client -f ./client/Dockerfile ./client
2. docker build -t ghimire/multi-server -f ./server/Dockerfile ./server
3. docker build -t ghimire/multi-worker -f ./worker/Dockerfile ./worker
- Install minikube: `$ brew install minikube`.
  Optionally, install hyperkit driver and run minikube with it.
  1. `$ curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-hyperkit \
&& sudo install -o root -g wheel -m 4755 docker-machine-driver-hyperkit /usr/local/bin/`
  2. `$ minikube config set vm-driver hyperkit`
- Start minikube: `$ minikube start`
- Apply the mandatory command with: `$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml`
- Add secrets for postgres: `$ kubectl create secret pgpassword --from-literal PGPASSWORD=chang3@m3!`
- `$ minikube addons enable ingress`
- Apply the configs: `$ kubectl apply -f k8s`
- Get and visit the IP: `$ minikube ip`
- Voila!

## Cleaning up
- `$ kubectl delete -f k8s`
