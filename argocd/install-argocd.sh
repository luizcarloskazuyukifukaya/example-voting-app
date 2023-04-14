# Connect to the target GKE
# kubectl command can be used after
gcloud container clusters get-credentials luiz-devops-argocd \
--zone=us-central1-c --project luiz-devops-cicd

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml


