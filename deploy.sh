docker build -t manishakhurana25/multi-client:latest -t manishakhurana25/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t manishakhurana25/multi-server:latest -t manishakhurana25/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t manishakhurana25/multi-worker:latest -t manishakhurana25/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push manishakhurana25/multi-client:latest
docker push manishakhurana25/multi-server:latest
docker push manishakhurana25/multi-worker:latest

docker push manishakhurana25/multi-client:$SHA
docker push manishakhurana25/multi-server:$SHA
docker push manishakhurana25/multi-worker:$SHA

kubectl apply -f k8s
kubetcl set image deployments/server-deployment server=manishakhurana25/multi-server:$SHA
kubetcl set image deployments/client-deployment client=manishakhurana25/multi-client:$SHA
kubetcl set image deployments/worker-deployment worker=manishakhurana25/multi-worker:$SHA