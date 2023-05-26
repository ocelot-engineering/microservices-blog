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
minikube addons enable ingress
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

### Kubernetes and minikube
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

Getting started
```
 minikube start
 minikube addons enable ingress
 # Make sure ports are fowarded (see below)
 cd infra/k8s
 kubectl apply -f ingress-srv.yaml
```

If getting certificate issues
```
minikube delete 
```

### Ingress and port forwarding
[Dev container Ingress port forwarding](https://github.com/microsoft/vscode-dev-containers/tree/main/containers/kubernetes-helm-minikube#ingress-and-port-forwarding)
1. Get ip of minikube `minikube ip`
2. Find port of the NodePort to forward `kubectl get service --all-namespaces`
3. Forward the ingress-nginx-controller NodePorts `<minikube-ip>:<port>` to `localhost:80` and `localhost:443`
4. Update hosts `C:\Windows\System32\drivers\etc\hosts` file to redirect `posts.com` to `localhost` e.g.
```
127.0.0.1 posts.com
```
