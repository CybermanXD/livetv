#!/bin/bash
chmod +x ./jiotv_go-linux-amd64
apt-get update && apt-get install -y socat

export JIOTV_DRM=true

./jiotv_go-linux-amd64 start &

sleep 5

while true; do
    socat TCP-LISTEN:${PORT},fork,reuseaddr TCP:127.0.0.1:5001
    echo "socat crashed, retrying in 2s..."
    sleep 2
done
