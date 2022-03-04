#! /bin/bash

# This section installs minikube by installing a RPM package from a Google repo and then
# uses the Red Hat package manager to install it.  This approach is described in more detail at
# https://minikube.sigs.k8s.io/docs/start/

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
rpm -Uvh minikube-latest.x86_64.rpm
rm -f minikube-latest.x86_64.rpm

# This section installs kubectl based on instructions available from 
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

cat <<EOF | tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
yum install -y kubectl

minikube version
kubectl version
