#@IgnoreInspection BashAddShebang
docker build -t iantonenko/multi-client:latest -t iantonenko/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t iantonenko/multi-server:latest -t iantonenko/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t iantonenko/multi-worker:latest -t iantonenko/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push iantonenko/multi-client:latest
docker push iantonenko/multi-server:latest
docker push iantonenko/multi-worker:latest

docker push iantonenko/multi-client:$SHA
docker push iantonenko/multi-server:$SHA
docker push iantonenko/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=iantoenko/multi-client:$SHA
kubectl set image deployments/server-deployment server=iantoenko/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=iantoenko/multi-worker:$SHA
