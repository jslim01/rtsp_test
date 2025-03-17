#!/bin/sh
ffmpeg -re -stream_loop -1 -i /videos/video1.mp4 \
       -vf "scale=1280:720,format=yuv420p" \
       -c:v libx264 -preset veryfast -b:v 1500k -maxrate 2000k -bufsize 3000k \
       -g 30 -keyint_min 30 \
       -rtsp_transport tcp \
       -an \
       -f rtsp rtsp://rtsp-server:8554/stream
