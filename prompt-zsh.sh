#!/bin/zsh

# Function to check if tsh proxy is running and display (tsh) in green
tsh_prompt() {
    if [[ -f "$HOME/.tsh_proxy_pid" ]]; then
        # Proxy is running, show (tsh) in green
        echo "%F{green}(tsh)%f "
    fi
}

# Modify the PROMPT for zsh
PROMPT='$(tsh_prompt)'$PROMPT