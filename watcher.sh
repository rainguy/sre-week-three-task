#!/bin/bash

# Define Variables
namespace="sre"
deployment_name="swype"
max_restarts=5

# Start an Infinite Loop
while true
do
    # Check Pod Restarts
    restarts=$(kubectl get pods -n "$namespace" -l app="$deployment_name" -o jsonpath='{.items[0].status.containerStatuses[0].restartCount}')

    # Display Restart Count
    echo "Current restarts: $restarts"

    # Check Restart Limit
    if [[ $restarts -gt $max_restarts ]]; then
        echo "Maximum restarts exceeded. Scaling down deployment."
        kubectl scale deployment "$deployment_name" --replicas=0 -n "$namespace"
        break  # Exit the loop
    fi

    # Pause
    echo "Pausing for 60 seconds..."
    sleep 60
done
