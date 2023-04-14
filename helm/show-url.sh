#!/bin/sh
gcloud container clusters get-credentials luiz-devops-cicd-k8s --region us-central1 --project luiz-devops-cicd

LB_PORT=80
NS="default"
VOTE_IP=$(kubectl get svc vote-extlb --no-headers -n $NS | awk '{print $4}')
RESULT_IP=$(kubectl get svc result-extlb --no-headers -n $NS | awk '{print $4}')

VOTE_SERVER="$VOTE_IP:$LB_PORT"
echo "Vote URL is http://$VOTE_IP:$LB_PORT"
echo "Vote Server is $VOTE_SERVER"

RESULT_SERVER="$RESULT_IP:$LB_PORT"
echo "Vote URL is http://$RESULT_IP:$LB_PORT"
echo "Vote Server is $RESULT_SERVER"
