#!/bin/sh
LB_PORT=80
VOTE_IP=$(kubectl get svc vote-extlb --no-headers | awk '{print $4}')
RESULT_IP=$(kubectl get svc result-extlb --no-headers | awk '{print $4}')

VOTE_SERVER="$VOTE_IP:$LB_PORT"
echo "Vote URL is http://$VOTE_IP:$LB_PORT"
echo "Vote Server is $VOTE_SERVER"

RESULT_SERVER="$RESULT_IP:$LB_PORT"
echo "Vote URL is http://$RESULT_IP:$LB_PORT"
echo "Vote Server is $RESULT_SERVER"
