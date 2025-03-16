#!/bin/bash
chmod +x ./jiotv_go-linux-amd64

# Start the server on localhost (where it's stuck)
./jiotv_go-linux-amd64 start &

# Forward external traffic from 0.0.0.0:$PORT to internal 127.0.0.1:5001
socat TCP-LISTEN:$PORT,fork TCP:127.0.0.1:5001
