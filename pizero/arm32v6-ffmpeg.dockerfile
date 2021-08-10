#rpizero is arm32v6, but there's a problem with this set of docker images, see https://github.com/moby/moby/issues/41017

#workaround for raspberry pi zero automatic platform
#FROM --platform=linux/arm/v6 debian:latest

FROM debian:latest
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y ffmpeg
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
COPY ./ffmpeg_entrypoint.sh /ffmpeg_entrypoint.sh
RUN chmod +x /ffmpeg_entrypoint.sh
ENTRYPOINT ["/ffmpeg_entrypoint.sh"]