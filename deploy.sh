docker build -t ghimire/multi-client:latest -t ghimire/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t ghimire/multi-server:latest -t ghimire/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t ghimire/multi-worker:latest -t ghimire/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push ghimire/multi-client:latest
docker push ghimire/multi-server:latest
docker push ghimire/multi-worker:latest

docker push ghimire/multi-client:$SHA
docker push ghimire/multi-server:$SHA
docker push ghimire/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=ghimire/multi-server:$SHA
kubectl set image deployments/client-deployment client=ghimire/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=ghimire/multi-worker:$SHA