#rpizero is arm32v6, but there's a problem with this set of docker images, see https://github.com/moby/moby/issues/41017
#workaround for raspberry pi zero automatic platform
FROM --platform=linux/arm/v6 debian:latest
RUN apt-get update
RUN apt-get install ffmpeg
RUN apt-get clean && rm -rf /var/lib/apt/lists/*;