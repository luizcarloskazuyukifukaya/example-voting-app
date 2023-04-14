# Setup ArgoCD
This document includes the details on how to setup the ArgoCD server.
Official document can be found [here](https://argo-cd.readthedocs.io/en/stable/getting_started/).

## Before starting
This setup is based on the target environment to be GCP and GKE used.

kubectl command is to be used, so you need to make sure it is working correctly
for other environment such as AWS, Azure ...

(Example) For GCP, for zonal GKE
```
gcloud container clusters get-credentials <target cluster name> \
--zone <cluster zone name> --project <project id>
```

## Install Argo CD
The components required for Argo CD is to be installed on a dedicated namespace
called "argocd". The following is the command to be executed:

```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

## Configure Argo CD Application Manifest
After installing Argo CD components, you will need to config it so it can sync
with the target source repository, and then apply the manifest file against the
target cluster.

Application.yaml file is to be used to config the Argo CD server, but you need
to modify to your environment.

The sample YAML file can be found
[here](https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/)

```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: guestbook
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/argoproj/argocd-example-apps.git
    targetRevision: HEAD
    path: guestbook
  destination:
    server: https://kubernetes.default.svc
    namespace: guestbook
```
Note that <b>spec > source</b> define the source repository where the
kubernetes manifest files are managed with Git.
<b>spec > destination</b> is where the target kubernetes cluster is specified.

For the example on this publication, the <b>source/path</b> is k8s-specifications
where all kubernetes manifest YAMLs are stored.

Once defined, you can apply this to Argo CD with the kubectl apply command.
```
kubectl apply -f Application.yaml
```
