#!/bin/bash

#ffmpeg config is system dependent
#get video devices with 
#get outputs with v4l2-ctl -i /dev/video0 --list-formats
#get output sizes with v4l2-ctl -i /dev/video0 --list-framesizes FORMAT_TYPE_FROM_LISTFORMATS

#ffmpeg -f v4l2 -i /dev/video0 -f rtsp rtsp://localhost:8554/video0
#ffmpeg -f v4l2 -i /dev/video0 -c:v h264_omx -f rtsp rtsp://localhost:8554/video0

#This works! But motion can't read the stream for some reason...
#ffmpeg -video_size 1280x960 -input_format mjpeg -i /dev/video0 -vcodec copy -f rtsp rtsp://localhost:8554/video0

#This works! But only 5 fps. Not really hardware accelerated?
ffmpeg -video_size 1280x960 -i /dev/video0 -c:v h264_omx -pix_fmt yuv420p -f rtsp rtsp://localhost:8554/video0