#! /bin/bash

# This script uninstalls kubectl and minikube from a Red Hat derived Linux host

yum remove kubectl -y
rpm -e minikube
rm -f /etc/yum.repos.d/kubernetes.repo
