#!/bin/bash

# Download the fetch-ke script
curl -L https://raw.githubusercontent.com/MemerGamer/fetch-ke/main/fetch-ke -o fetch-ke 2>/dev/null

# Make it executable
chmod +x fetch-ke

isTermux=$(echo $PREFIX | grep -o "com.termux")

# Check if it's Termux
if [[ -n $isTermux ]]; then
    # If it's Termux, check if figlet is installed
    if ! command -v figlet &>/dev/null; then
        # If not, install it
        apt install figlet
    fi

    # Check if ncurses is installed
    if ! command -v ncurses &>/dev/null; then
        # If not, install it
        apt install ncurses-utils
    fi

    # Check if jq is installed
    if ! command -v jq &>/dev/null; then
        # If not, install it
        apt install jq
    fi
else

    # Check if figlet is installed
    if ! command -v figlet &>/dev/null; then
        echo "figlet is not installed. please install it for fetch-ke to work properly!"
    fi

    # Check if ncurses is installed
    if ! command -v ncurses &>/dev/null; then
        echo "ncurses is not installed. please install it for fetch-ke to work properly!"
    fi

    # If it's not Termux
    # Move it to /bin (requires sudo)
    echo "please enter your sudo password to install: "
    sudo mv fetch-ke /bin/fetch-ke
fi

echo "fetch-ke installed successfully."
