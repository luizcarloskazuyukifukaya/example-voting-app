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

# create 300 votes (200 for option a, 100 for option b)
ab -n 100 -c 50 -p posta -T "application/x-www-form-urlencoded" http://$VOTE_SERVER/
ab -n 100 -c 50 -p postb -T "application/x-www-form-urlencoded" http://$VOTE_SERVER/
ab -n 100 -c 50 -p posta -T "application/x-www-form-urlencoded" http://$VOTE_SERVER/
