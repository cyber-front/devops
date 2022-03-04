#! /bin/bash

# This section installs minikube by installing a deb package from a Google repo and then uses the
# Debian package manager to install it.  This approach is described in more detail at
# https://minikube.sigs.k8s.io/docs/start/

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
dpkg -i minikube_latest_amd64.deb
rm -f minikube_latest_amd64.deb

# This section installs kubectl based on instructions available from 
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management

apt update -y
apt install -y apt-transport-https ca-certificates curl

curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
apt update -y
apt install -y kubectl

minikube version
kubectl version
