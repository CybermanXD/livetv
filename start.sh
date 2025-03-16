#!/bin/bash
chmod +x ./jiotv_go-linux-amd64

# Install socat
apt-get update && apt-get install -y socat

# Start JioTV Go in the background
./jiotv_go-linux-amd64 start &

# Wait a bit to make sure the app boots before socat starts forwarding
sleep 3

# Forward Railway's external $PORT to the app’s internal port
socat TCP-LISTEN:${PORT},fork,reuseaddr TCP:127.0.0.1:5001
