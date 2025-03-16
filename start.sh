#!/bin/bash
chmod +x ./jiotv_go-linux-amd64

# Install socat
apt-get update && apt-get install -y socat

# Start JioTV Go server
./jiotv_go-linux-amd64 start &

# socat forwards external $PORT -> internal 127.0.0.1:5001
socat TCP-LISTEN:${PORT},fork,reuseaddr TCP:127.0.0.1:5001
