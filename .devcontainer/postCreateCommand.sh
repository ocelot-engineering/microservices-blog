npm install --prefix /workspaces/microservices-blog/client
npm install --prefix /workspaces/microservices-blog/comments
npm install --prefix /workspaces/microservices-blog/event-bus
npm install --prefix /workspaces/microservices-blog/moderation
npm install --prefix /workspaces/microservices-blog/posts
npm install --prefix /workspaces/microservices-blog/query

minikube start
minikube addons enable ingress

curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 && \
sudo install skaffold /usr/local/bin/