#!/bin/bash

ffmpeg -f v4l2 -i /dev/video0 -f rtsp rtsp://localhost:8554/video0