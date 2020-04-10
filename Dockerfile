FROM ubuntu:14.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
# Default jdk
RUN apt-get install curl xvfb x11vnc -y
RUN apt-get -y install gnupg
RUN curl -sS https://download.spotify.com/debian/pubkey.gpg | apt-key add - 
RUN echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
RUN apt-get update && apt-get install spotify-client -y
RUN mkdir ~/.vnc
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
ADD run.sh /
ENTRYPOINT ["/bin/bash", "/run.sh"]