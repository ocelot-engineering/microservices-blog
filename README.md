# Microservices Blog

## Architecture

## Deployment

### minikube
minikube is local Kubernetes, focusing on making it easy to learn and develop for Kubernetes.
```
minikube start
minikube status
minikube stop
minikube ip
```

### Building images

Before building images run `eval $(minikube docker-env)` so that the Docker daemon running inside of the single node cluster is used instead of the host. E.g.
```
cd posts
eval $(minikube docker-env)
docker build -t posts:0.0.1 .
```
Make sure to add this when pulling locally:
```
imagePullPolicy: Never
```


Process all config files and update their resources by
```
kubectl apply -f infra/k8s/
```

Delete all pods
```
kubectl delete -f infra/k8s/
```

Other useful `kubectl` commands
```
kubectl get pods
kubectl exec -it <pod name><command>
kubectl logs <pod name>
kubectl delete pod <pod name>
kubectl apply -f <pod name>
kubectl describe pod <pod name>
kubectl rollout restart deployment <deployment name>
```
