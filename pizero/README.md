Switch to pizero context
`docker context use pizero`
Build ffmpeg with
`docker build . -t "trm_ffmpeg" -f "arm32v6-ffmpeg.dockerfile"`
Deploy with
`docker stack deploy -c trm_rtsp_simple_server.yml rtsp_server`