#!/bin/bash
chmod +x ./jiotv_go-linux-amd64

# Start the app (which binds to 127.0.0.1:5001)
./jiotv_go-linux-amd64 start &

# Forward Railway $PORT (external) to internal 127.0.0.1:5001
socat TCP-LISTEN:${PORT},fork TCP:127.0.0.1:5001
