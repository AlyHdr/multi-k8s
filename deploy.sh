# build the images from the current dirs

docker build -t alyhdr/multi-client -t alyhdr/multi-client:$SHA -f  ./client/Dockerfile.dev ./client
docker build -t alyhdr/multi-server -t alyhdr/multi-server:$SHA -f ./server/Dockerfile.dev ./server
docker build -t alyhdr/multi-worker -t alyhdr/multi-worker:$SHA -f ./worker/Dockerfile.dev ./worker

# push the new built images to docker hub
docker push alyhdr/multi-client
docker push alyhdr/multi-server
docker push alyhdr/multi-worker

docker push alyhdr/multi-client:$SHA
docker push alyhdr/multi-server:$SHA
docker push alyhdr/multi-worker:$SHA



# load all config files in k8s directory
kubectl apply -f k8s

kubectl set image deployments/server-deployment server=alyhdr/multi-server:$SHA
kubectl set image deployments/client-deployment client=alyhdr/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=alyhdr/multi-worker:$SHA







