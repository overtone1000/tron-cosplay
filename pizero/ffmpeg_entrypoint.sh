#!/bin/bash

#ffmpeg config is system dependent
#get video devices with v4l2-ctl --list-devices
#get outputs with v4l2-ctl -i /dev/video0 --list-formats
#get output sizes with v4l2-ctl -i /dev/video0 --list-framesizes FORMAT_TYPE_FROM_LISTFORMATS

#ffmpeg -f v4l2 -i /dev/video0 -f rtsp rtsp://localhost:8554/video0
ffmpeg -f v4l2 -i /dev/video0 -c:v h264_omx -f rtsp rtsp://localhost:8554/video0 
#ffmpeg -f v4l2 -i /dev/video0 -c:v h264_v4l2m2m -f rtsp rtsp://localhost:8554/video0
#ffmpeg -f mjpeg -s 1920x1080 -i /dev/video0 -f rtsp rtsp://localhost:8554/video0

#This is close, but still converts it to mp4!!
#ffmpeg -video_size 1280x1024 -input_format mjpeg -i /dev/video0 -f rtsp -c mjpeg rtsp://localhost:8554/video0

#Gives error about chroma blocks...
#ffmpeg -video_size 1280x1024 -input_format mjpeg -i /dev/video0 -f rtsp -c mjpeg rtsp://localhost:8554/video0
#Probably need to change pixel format.
