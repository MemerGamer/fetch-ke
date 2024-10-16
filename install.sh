#!/bin/bash

# Download the fetch-ke script
curl -L https://raw.githubusercontent.com/MemerGamer/fetch-ke/main/fetch-ke -o fetch-ke

# Make it executable
chmod +x fetch-ke

# Move it to /bin (requires sudo)
sudo mv fetch-ke /bin/fetch-ke

echo "fetch-ke installed successfully."