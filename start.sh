#!/bin/bash
chmod +x ./jiotv_go-linux-amd64

# Install socat at runtime
apt-get update && apt-get install -y socat

# Start the app (runs on 127.0.0.1:5001 internally)
./jiotv_go-linux-amd64 start &

# Forward external traffic to internal localhost:5001
socat TCP-LISTEN:${PORT},fork TCP:127.0.0.1:5001
