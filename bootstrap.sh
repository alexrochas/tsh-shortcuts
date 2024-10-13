# Function to start tsh proxy
start-tsh() {
    # Default environment
    ENVIRONMENT="staging"

    # Parse the input arguments for the environment flag
    while [[ "$#" -gt 0 ]]; do
        case $1 in
            -e|--environment) ENVIRONMENT="$2"; shift ;;
            *) echo "Unknown parameter: $1"; return 1 ;;
        esac
        shift
    done

    # Unset any existing Teleport environment
    eval $(tsh env --unset)

    # Log into the Kubernetes cluster with the specified environment (default is "staging")
    echo "Logging into Kubernetes for environment: $ENVIRONMENT"
    tsh kube login "$ENVIRONMENT"

    # Start the Teleport proxy for Kubernetes in the background and save its PID
    echo "Starting Teleport proxy in the background..."
    tsh proxy kube -p 8443 &

    # Save the PID of the background job
    TSH_PID=$!
    echo $TSH_PID > "$HOME/.tsh_proxy_pid"

    # Export the KUBECONFIG environment variable dynamically using $HOME
    export KUBECONFIG="$HOME/.tsh/keys/teleport.on-running.com/alexrochas-kube/teleport/localproxy-8443-kubeconfig"
    echo "KUBECONFIG set to: $KUBECONFIG"

    echo "Teleport proxy started with PID: $TSH_PID"
}

# Function to stop tsh proxy
stop-tsh() {
    # Check if the PID file exists
    if [[ ! -f "$HOME/.tsh_proxy_pid" ]]; then
        echo "No Teleport proxy process found."
        return 1
    fi

    # Read the PID from the file
    TSH_PID=$(cat "$HOME/.tsh_proxy_pid")

    # Kill the process
    echo "Stopping Teleport proxy with PID: $TSH_PID"
    kill $TSH_PID

    # Remove the PID file
    rm "$HOME/.tsh_proxy_pid"

    echo "Teleport proxy stopped."
}
