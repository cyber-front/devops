#! /bin/bash

# This script uninstalls kubectl and minikube from a Debian Linux host

apt remove kubectl -y
dpkg --remove minikube
rm -f /etc/apt/sources.list.d/kubernetes.list
