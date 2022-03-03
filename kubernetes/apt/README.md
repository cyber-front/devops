# apt based installers for minikube and kubectl

Both minikube and kubectl are used to manage a single node Kubernetes deployment which can be used for development purposes; minikube is not generally suitable for production use.  In this case, the installer and uninstaller both use apt or the Debian package manager (dpkg).

References for installing minkube and kubectl used in building these scripts are:

[minikube install](https://minikube.sigs.k8s.io/docs/start/)
[kubectl install](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management)

Running either the installer or the uninstaller require admin rights and neither take any command line arguments.

Before running the installer, you will need to install a hypervisor or container environment.  I tested this using Docker on Debian 11.