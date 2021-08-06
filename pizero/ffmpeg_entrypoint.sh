#!/bin/bash

#ffmpeg -f v4l2 -i /dev/video0 -f rtsp rtsp://localhost:8554/video0
ffmpeg -f v4l2 -i /dev/video0 -c:v h264_omx -f rtsp rtsp://localhost:8554/video0 
#ffmpeg -f v4l2 -i /dev/video0 -c:v h264_v4l2m2m -f rtsp rtsp://localhost:8554/video0 