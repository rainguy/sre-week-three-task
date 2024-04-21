#!/bin/bash

# Define variables
NAMESPACE="sre"
DEPLOYMENT="swype-app"
MAX_RESTARTS=3

# Start an infinite loop
while true; do
    POD_RESTARTS=$(kubectl get pods -n $NAMESPACE -l app=$DEPLOYMENT -o jsonpath='{.items[*].status.containerStatuses[*].restartCount}' | awk '{s+=$1} END {print s}')

    echo "Current restart count for $DEPLOYMENT: $POD_RESTARTS"

    if [ $POD_RESTARTS -gt $MAX_RESTARTS ]; then
        echo "Restart limit exceeded. Scaling down $DEPLOYMENT to zero replicas."

        kubectl scale deployment $DEPLOYMENT --replicas=0 -n $NAMESPACE
        break
    else
        sleep 60
    fi
done

echo "Script has completed execution."
