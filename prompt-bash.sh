#!/bin/bash

# Function to check if tsh proxy is running and display (tsh) in green
tsh_prompt() {
    if [[ -f "$HOME/.tsh_proxy_pid" ]]; then
        # Proxy is running, show (tsh) in green
        echo -e "\[\e[32m\](tsh)\[\e[0m\] "
    fi
}

# Modify the PS1 for bash (you can customize this further)
export PS1='$(tsh_prompt)\u@\h:\w\$ '