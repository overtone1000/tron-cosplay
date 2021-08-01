Switch to pizero context
`docker context use pizero`
Build with
`docker build . -t "trm_rtsp_simple_server"`
Deploy with
`docker stack deploy -c trm_rtsp_simple_server.yml rtsp_server`