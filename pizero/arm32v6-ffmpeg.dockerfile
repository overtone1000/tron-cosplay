#rpizero is arm32v6, but there's a problem with this set of docker images, see https://github.com/moby/moby/issues/41017
FROM arm32v5/debian
RUN apt install ffmpeg