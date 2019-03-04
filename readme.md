# Kubernetes React App with Postgres and Redis

## Running
- Install Docker
- Build each images as `multi-server`, `multi-worker`, `multi-client` and push to Docker Hub, and change the image names in `k8s` directory appropriately
  Eg: `cd worker && docker build -t ghimire/multi-worker . && docker push ghimire/multi-worker`
- Install minikube: `$ brew install minikube`.
  Optionally, install hyperkit driver and run minikube with it.
  1. `$ curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-hyperkit \
&& sudo install -o root -g wheel -m 4755 docker-machine-driver-hyperkit /usr/local/bin/`
  2. `$ minikube config set vm-driver hyperkit`
- Start minikube: `$ minikube start`
- Apply the mandatory command with: `$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml`
- Add secrets for postgres: `$ kubectl create secret generic --from-literal PGPASSWORD=chang3@m3!`
- `$ minikube addons enable ingress`
- Apply the configs: `$ kubectl apply -f k8s`
- Get and visit the IP: `$ minikube ip`
- Voila!

## Storage Class
This project uses Digital Oean specific storageClass in `k8s/database-persistent-volume-claim.yaml`. Modify this to use your provider specific persistent volume.

## Cleaning up
- `$ kubectl delete -f k8s`
