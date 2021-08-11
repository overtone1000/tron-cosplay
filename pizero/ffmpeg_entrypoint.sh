#!/bin/bash

#ffmpeg config is system dependent
#get video devices with 
#get outputs with v4l2-ctl -i /dev/video0 --list-formats
#get output sizes with v4l2-ctl -i /dev/video0 --list-framesizes FORMAT_TYPE_FROM_LISTFORMATS

#ffmpeg -f v4l2 -i /dev/video0 -f rtsp rtsp://localhost:8554/video0
#ffmpeg -f v4l2 -i /dev/video0 -c:v h264_omx -f rtsp rtsp://localhost:8554/video0

#This works!
#ffmpeg -video_size 1280x960 -input_format mjpeg -i /dev/video0 -vcodec copy -f rtsp rtsp://localhost:8554/video0
#Works with the latest version of motion with the netcam_decoder config set to "mjpeg"
#However, while the mjpeg stream is very fast (30 fps), it isn't reliably readable by VLC or by a browser using the HLS stream from simple_rstp_server. 
#This is a wash.

#This works! But only 5 fps. Not really hardware accelerated? Probably just limitation of the pizero. Oh well.
ffmpeg -video_size 1280x960 -i /dev/video0 -c:v h264_omx -pix_fmt yuv420p -f rtsp rtsp://localhost:8554/video0
