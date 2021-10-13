K8S_VERSION=v1.18.20 # v1.17.17 v1.15.5 v1.18.20 v1.19.11

## cluster setup
start-cluster:
# use driver=hyperkit for docker for mac
	minikube start --cpus=8 --memory=10240 --kubernetes-version=$(K8S_VERSION) --driver=hyperkit
	minikube addons enable metrics-server

stop-cluster:
	minikube stop

remove-cluster:
	minikube delete --all --purge
	
install-argocd:
	helm install argocd ./argocd-install --namespace=argocd --create-namespace -f ./argocd-install/values.yaml

upgrade-argocd:
	helm upgrade argocd ./argocd-install --namespace=argocd --create-namespace -f ./argocd-install/values.yaml

portforward-argocd:
	kubectl port-forward svc/argocd-server -n argocd 8080:80

initialpass-argocd:
	kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

portforward-inggw:
	kubectl port-forward svc/istio-ingressgateway -n istio-system 8081:80

rollout-all:
# kubectl -n NAMESPACE rollout restart deploy
	kubectl -n default rollout restart deploy

download-istio:
	wget https://github.com/istio/istio/releases/download/1.2.10/istio-1.2.10-linux.tar.gz
	tar -xvf istio-1.2.10-linux.tar.gz
	rm istio-1.2.10-linux.tar.gz

