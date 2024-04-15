#!/bin/bash

# Define variables
NAMESPACE="sre"
DEPLOYMENT="swype"
MAX_RESTARTS=3

# Start an infinite loop
while true; do
    # Retrieve the number of restarts for the pod associated with the specified deployment in the specified namespace
    # This command assumes that there is a single pod or that summarizing restarts is acceptable
    POD_RESTARTS=$(kubectl get pods -n $NAMESPACE -l app=$DEPLOYMENT -o jsonpath='{.items[*].status.containerStatuses[*].restartCount}' | awk '{s+=$1} END {print s}')

    # Display the current number of restarts to the console
    echo "Current restart count for $DEPLOYMENT: $POD_RESTARTS"

    # Check if the current number of restarts is greater than the maximum allowed
    if [ $POD_RESTARTS -gt $MAX_RESTARTS ]; then
        echo "Restart limit exceeded. Scaling down $DEPLOYMENT to zero replicas."
        # Scale down the deployment to zero replicas
        kubectl scale deployment $DEPLOYMENT --replicas=0 -n $NAMESPACE
        # Break the loop
        break
    else
        # Pause for 60 seconds before the next check
        sleep 60
    fi
done

echo "Script has completed execution."
