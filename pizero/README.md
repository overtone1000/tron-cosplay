Switch to pizero context
`docker context use pizero`

Build ffmpeg with
`docker build . -t "trm_ffmpeg" -f "arm32v6-ffmpeg.dockerfile"`

Trying new build command due to linux/arm/v6 image problems...
`docker buildx build .  -t "trm_ffmpeg" -f "arm32v6-ffmpeg.dockerfile" --platform="linux/arm/v6"`

Could push to pizero with the following, but it's too slow!
`docker save trm_ffmpeg | ssh -C pi@pizero docker load`

Instead, create a local private docker repository
`docker run -d -p 5000:5000 --restart always --name registry registry:2`

Push to it on the local context
`docker tag trm_ffmpeg localhost:5000/trm_ffmpeg && docker push localhost:5000/trm_ffmpeg`

Need to allow insecure (HTTP) repository use on the pizero. SSH into pizero and edit `/etc/docker/daemon.json` to include:
```
{
  "insecure-registries" : ["IP_OF_PRIVATE_REPOSITORY_MACHINE:5000"]
}
```

And pull from it on the remote context
`docker pull 192.168.1.181:5000/trm_ffmpeg && docker tag 192.168.1.181:5000/trm_ffmpeg trm_ffmpeg`

Deploy with
`docker stack deploy -c trm_rtsp_simple_server.yml rtsp_server`

The "devices" tag is currently ignored by stack deploy. Oh no! Have to manually run the containers instead.
`docker run --network=host --restart="always" -d aler9/rtsp-simple-server && docker run --device="/dev/video0:/dev/video0" --network=host --restart="always" -d trm_ffmpeg`
