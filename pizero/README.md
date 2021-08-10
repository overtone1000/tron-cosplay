Switch to pizero context
`docker context use pizero`

## Build on Pi

Build ffmpeg with
`docker build . -t "trm_ffmpeg" -f "arm32v6-ffmpeg.dockerfile"`

## Build with buildx

### Local Environment Variables
```
LOCAL_IP=192.168.1.138exit
LOCAL_PORT=5001
```

### Local Repo
Create a local private docker repository
`docker run -d -p $LOCAL_PORT:5000 --restart always --name registry registry:latest`

Need to allow insecure (HTTP) repository use on the pizero. SSH into pizero and edit `/etc/docker/daemon.json` to include:
```
{
  "insecure-registries" : ["$LOCAL_IP:$LOCAL_PORT"]
}
```
Don't forget to restart Docker!
`sudo systemctl restart docker`

### Buildx Emulation Node
Need to create an emulation node. See https://docs.docker.com/buildx/working-with-buildx/#build-multi-platform-images
Install emulation with
`docker run --privileged --rm tonistiigi/binfmt --install all`

### Building

Build with
`sudo docker buildx build .  -t "localhost:$LOCAL_PORT/trm_ffmpeg:latest" -f "arm32v6-ffmpeg.dockerfile" --platform="linux/arm/v6" --push`

Push to it on the local repository
`docker push localhost:$LOCAL_PORT/trm_ffmpeg`

And pull from it on the remote context
`docker pull $LOCAL_IP:$LOCAL_PORT/trm_ffmpeg && docker tag $LOCAL_IP:$LOCAL_PORT/trm_ffmpeg trm_ffmpeg`

## Deploy

Deploy with
`docker stack deploy -c trm_rtsp_simple_server.yml rtsp_server`

The "devices" tag is currently ignored by stack deploy. Oh no! Have to manually run the containers instead.
`docker run --network=host --restart="always" -d aler9/rtsp-simple-server && docker run --device="/dev/video0:/dev/video0" --network=host --restart="always" -d trm_ffmpeg`