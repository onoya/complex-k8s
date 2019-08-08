docker build -t onoya/multi-client:latest -t onoya/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t onoya/multi-server:latest -t onoya/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t onoya/multi-worker:latest -t onoya/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push onoya/multi-client:latest
docker push onoya/multi-server:latest
docker push onoya/multi-worker:latest

docker push onoya/multi-client:$SHA
docker push onoya/multi-server:$SHA
docker push onoya/multi-worker:$SHA

# kubectl apply -f k8s
# kubectl set image deployments/client-deployment client=onoya/multi-client:$SHA
# kubectl set image deployments/server-deployment server=onoya/multi-server:$SHA
# kubectl set image deployments/worker-deployment worker=onoya/multi-worker:$SHA
