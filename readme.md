# Kubernetes React App with Postgres and Redis [![Build Status](https://travis-ci.org/ghimire/multi-k8s.svg?branch=master)](https://travis-ci.org/ghimire/multi-k8s)

## Digital Ocean
- Log in to Digital Ocean and create a Kubernetes (k8s) cluster from Manage -> Kubernetes. Let's call it multi-k8s.
- Once completed, download the config file. Let's call it do.yaml. 
- Copy `do.yaml` to `$HOME/.kube/`
- Set alias to run this config with kubectl and helm (will install it later)
`$ alias kubectl='kubectl --kubeconfig=$HOME/.kube/do.yaml'`
`$ alias helm='helm --kubeconfig $HOME/.kube/do.yaml'`

## Create the k8s secret to be used by PostgreSQL
- `$ kubectl create secret generic pgpassword —from-literal PGPASSWORD=chang3m3!`

## Install Helm
- `$ brew install kubernetes-helm`
- `$ kubectl -n kube-system create serviceaccount tiller`
- `$ kubectl create clusterrolebinding tiller-cluster-role --clusterrole cluster-admin --serviceaccount=kube-system:tiller`
- `$ helm --kubeconfig $HOME/.kube/do.yaml init --service-account tiller -—upgrade`
- `$ helm --kubeconfig $HOME/.kube/do.yaml repo update`

## Install nginx-ingress controller
- `$ helm install stable/nginx-ingress --name my-nginx --set rbac.create=true`

## Install cert-manager
- `$ kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.6/deploy/manifests/00-crds.yaml`
- `$ kubectl create namespace cert-manager`
- `$ kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true`
- `$ helm repo update`
- `$ helm install --name cert-manager --namespace cert-manager stable/cert-manager`

## Apply the k8s configs
`$ kubectl apply -f k8s/`

## Update DNS
- The repo uses k8s.prak.us domain as example. Set the Digital Ocean Load Balancer IP (in Manage -> Networking) as the A record of your domain.
- Visit your domain

## Cleaning up
- `$ kubectl delete -f k8s`
