#! /bin/bash

# This script uninstalls kubectl and minikube from a Red Hat derived Linux host

apt remove kubectl -y
dpkg --remove minikube
rm -f /etc/yum.repos.d/kubernetes.repo
