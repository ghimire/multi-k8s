# Kubernetes React App with Postgres and Redis (in Google Kubernetes Engine)

## Google Kubernetes Engine
- Log in to Google Cloud Platform (https://console.cloud.google.com) and create a new project. Let's call it multi-k8s. The generated project name will vary, let's say `multi-k8s-233514`
- Go to Kubernetes Engine section and create a new K8s cluster with appropriate name and compute zone.

## Google Cloud Shell
At this point log in to the Google Cloud Shell and run the following. Change project name and compute zone to their appropriate values.
`$ gcloud config set project multi-k8s-233514`
`$ gcloud config set compute/zone us-west2-a`
`$ gcloud container clusters get-credentials multi-k8s`

This can also be used in local machine by installing google cloud sdk as follows:
`$ curl https://sdk.cloud.google.com | bash`
Run the above set of gcloud commands and verify the context is set to GKE with `kubectl config current-context`

## Create the k8s secret to be used by PostgreSQL
- `$ kubectl create secret generic pgpassword —from-literal PGPASSWORD=chang3m3!`

## Install Helm
- `$ curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash`
- `$ kubectl -n kube-system create serviceaccount tiller`
- `$ kubectl create clusterrolebinding tiller-cluster-role --clusterrole cluster-admin --serviceaccount=kube-system:tiller`
- `$ helm init --service-account tiller -—upgrade`
- `$ helm repo update`

## Install nginx-ingress controller
- `$ helm install stable/nginx-ingress --name my-lb --set rbac.create=true`

## Install cert-manager
- `$ kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.6/deploy/manifests/00-crds.yaml`
- `$ kubectl create namespace cert-manager`
- `$ kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true`
- `$ helm repo update`
- `$ helm install --name cert-manager --namespace cert-manager stable/cert-manager`

## Apply the k8s configs
`$ kubectl apply -f k8s/`

## Update DNS
- The repo uses k8s.prak.us as example domain. Set Load Balancer IP (in Kubernetes Engine -> Services) as the A record of your domain.
- Visit your domain

## Cleaning up
- `$ kubectl delete -f k8s`

# Notes:
- To clone and use this on your project, replace the usages of `ghimire/multi-` in k8s configs and update `deploy.sh` and `.travis` as necessary.
- Generate service-account.json.enc from your service account file generated during cluster creation with: `travis encrypt-file service-account.json`
